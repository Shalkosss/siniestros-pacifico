'use client';

import { useEffect, useRef, useState } from 'react';
import { useRouter } from 'next/navigation';
import type {
  Beneficiario,
  Moneda,
  Siniestro,
  SiniestroMovimiento,
  TipoDocumento,
  TipoSiniestro,
  Usuario,
} from '@/lib/types';
import { supabase, STORAGE_BUCKET } from '@/lib/supabase';
import { useUser } from './UserContext';
import { Button } from './ui/Button';
import { Textarea, Input } from './ui/Input';
import { cn, censurar, colorPorDias, diasDesde, diasEfectivos, diasHabilesDesde, estaPausado, formatFecha, formatMoneda, validarCodigo } from '@/lib/utils';
import {
  debeCensurar,
  puedeArchivar,
  puedeBorrarPDF,
  puedeBorrarSiniestro,
  puedeEditarCampos,
  puedeSubirPDF,
} from '@/lib/permissions';
import { esEtapaFinal, getEtapas, getResponsableDeEtapa } from '@/lib/workflows';
import { admiteUber, esUber, UBER_ACCENT, UBER_CHIP, UBER_TEXT } from '@/lib/uber';
import {
  buildAsunto,
  buildComposeUrl,
  buildCuerpo,
  buildEmailRecordatorio,
  buildEmailUrl,
  getDestinatarios,
  type EmailProvider,
} from '@/lib/email';

interface Props {
  siniestro: Siniestro;
  movimientos: SiniestroMovimiento[];
  onClose: () => void;
  onChanged: () => void;
}

/** Tinte sutil del header por tipo — alineado al dark del kanban */
const accentByTipo: Record<Siniestro['tipo'], string> = {
  pago:         'from-cyan-500/15 via-cyan-500/10 to-transparent border-b border-cyan-500/20',
  deducible:    'from-amber-500/15 via-amber-500/10 to-transparent border-b border-amber-500/20',
  valorizacion: 'from-emerald-500/15 via-emerald-500/10 to-transparent border-b border-emerald-500/20',
  info_poliza:  'from-pink-500/15 via-pink-500/10 to-transparent border-b border-pink-500/20',
  reembolso:    'from-violet-500/15 via-violet-500/10 to-transparent border-b border-violet-500/20',
};

const accentTextByTipo: Record<Siniestro['tipo'], string> = {
  pago:         'text-cyan-300',
  deducible:    'text-amber-300',
  valorizacion: 'text-emerald-300',
  info_poliza:  'text-pink-300',
  reembolso:    'text-violet-300',
};

const tipoLabel: Record<Siniestro['tipo'], string> = {
  pago:         'Pago',
  reembolso:    'Reembolso',
  deducible:    'Deducible',
  valorizacion: 'Valorización',
  info_poliza:  'Info Póliza',
};

const dotByColor: Record<'verde' | 'amarillo' | 'rojo', string> = {
  verde: 'bg-emerald-400',
  amarillo: 'bg-amber-400',
  rojo: 'bg-red-400',
};

/** Interruptor de una línea para las sub-opciones del siniestro en modo edición */
function ToggleLinea({
  activo,
  onToggle,
  titulo,
  detalle,
  color,
  plano,
}: {
  activo: boolean;
  onToggle: () => void;
  titulo: string;
  detalle: string;
  color: 'cyan' | 'teal' | 'violeta' | 'uber';
  /** Sin marco propio (para anidarlo dentro de otro bloque) */
  plano?: boolean;
}) {
  const marcoActivo: Record<string, string> = {
    cyan: 'border-cyan-500/40 bg-cyan-500/[0.06]',
    teal: 'border-teal-500/40 bg-teal-500/[0.06]',
    violeta: 'border-violet-500/40 bg-violet-500/[0.06]',
    uber: 'border-[rgba(111,156,126,0.4)] bg-[rgba(111,156,126,0.07)]',
  };
  const cajaActiva: Record<string, string> = {
    cyan: 'border-cyan-500 bg-cyan-500',
    teal: 'border-teal-500 bg-teal-500',
    violeta: 'border-violet-500 bg-violet-500',
    uber: 'border-transparent',
  };
  return (
    <button
      type="button"
      role="switch"
      aria-checked={activo}
      onClick={onToggle}
      className={cn(
        'flex w-full items-start gap-2.5 text-left select-none transition',
        !plano && 'rounded-lg border p-3',
        !plano && (activo ? marcoActivo[color] : 'border-white/10 bg-white/[0.02] hover:bg-white/[0.04]')
      )}
    >
      <span
        className={cn(
          'mt-0.5 grid h-4 w-4 shrink-0 place-items-center rounded border transition',
          activo ? cajaActiva[color] : 'border-slate-600 bg-white/[0.04]'
        )}
        style={activo && color === 'uber' ? { background: UBER_ACCENT } : undefined}
      >
        {activo && (
          <svg className="h-3 w-3 text-white" viewBox="0 0 20 20" fill="currentColor">
            <path fillRule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clipRule="evenodd" />
          </svg>
        )}
      </span>
      <span className="text-xs text-slate-300 leading-snug">
        <span
          className="font-medium text-slate-100"
          style={color === 'uber' && activo ? { color: UBER_TEXT } : undefined}
        >
          {titulo}
        </span>
        <span className="block text-[11px] text-slate-500 mt-0.5">{detalle}</span>
      </span>
    </button>
  );
}

const PencilIcon = ({ className = 'h-3.5 w-3.5' }: { className?: string }) => (
  <svg className={className} viewBox="0 0 20 20" fill="currentColor">
    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z" />
  </svg>
);

/** Fila editable de beneficiario (monto como string mientras se escribe) */
type BenEdit = { nombre: string; dni: string; tipo: TipoDocumento; monto: string };

function toBenEdit(bens: Beneficiario[] | null): BenEdit[] {
  return (bens ?? []).map((b) => ({
    nombre: b.nombre,
    dni: b.dni,
    tipo: b.tipo ?? 'DNI',
    monto: b.monto != null ? String(b.monto) : '',
  }));
}

export function SiniestroModal({ siniestro, movimientos, onClose, onChanged }: Props) {
  const { usuario } = useUser();
  const router = useRouter();
  const [editMode, setEditMode] = useState(false);
  const [codigo, setCodigo] = useState(siniestro.codigo);
  const [notas, setNotas] = useState(siniestro.notas ?? '');
  const [monto, setMonto] = useState<string>(siniestro.monto?.toString() ?? '');
  const [moneda, setMoneda] = useState<Moneda>(siniestro.moneda ?? 'PEN');
  const [aseguradoNombre, setAseguradoNombre] = useState(siniestro.asegurado_nombre ?? '');
  const [dniTercero, setDniTercero] = useState(siniestro.dni_tercero ?? '');
  const [correoAsegurado, setCorreoAsegurado] = useState(siniestro.correo_asegurado ?? '');
  const [bensEdit, setBensEdit] = useState<BenEdit[]>(toBenEdit(siniestro.beneficiarios));
  // v13 — el detalle ahora edita todo lo que se llenó al crear el siniestro.
  const [tipoEdit, setTipoEdit] = useState<TipoSiniestro>(siniestro.tipo);
  const [docTipoEdit, setDocTipoEdit] = useState<TipoDocumento>(siniestro.doc_tipo ?? 'DNI');
  const [esUberEdit, setEsUberEdit] = useState(!!siniestro.es_uber);
  const [esChequeEdit, setEsChequeEdit] = useState(!!siniestro.es_cheque);
  const [chequeBancoEdit, setChequeBancoEdit] = useState(siniestro.cheque_banco ?? '');
  const [chequePersonaEdit, setChequePersonaEdit] = useState(siniestro.cheque_persona ?? '');
  const [chequeDniEdit, setChequeDniEdit] = useState(siniestro.cheque_dni ?? '');
  const [esPagoCuentaEdit, setEsPagoCuentaEdit] = useState(!!siniestro.es_pago_cuenta);
  const [reembolsoAbogadoEdit, setReembolsoAbogadoEdit] = useState(!!siniestro.reembolso_abogado);
  const [notaPausaInput, setNotaPausaInput] = useState(siniestro.nota_pausa ?? '');
  const [pausando, setPausando] = useState(false);
  const [guardando, setGuardando] = useState(false);
  const [subiendo, setSubiendo] = useState(false);
  const [confirmandoBorrado, setConfirmandoBorrado] = useState(false);
  const [confirmandoArchivar, setConfirmandoArchivar] = useState(false);
  const [verHistorial, setVerHistorial] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    setCodigo(siniestro.codigo);
    setNotas(siniestro.notas ?? '');
    setMonto(siniestro.monto?.toString() ?? '');
    setMoneda(siniestro.moneda ?? 'PEN');
    setAseguradoNombre(siniestro.asegurado_nombre ?? '');
    setDniTercero(siniestro.dni_tercero ?? '');
    setCorreoAsegurado(siniestro.correo_asegurado ?? '');
    setBensEdit(toBenEdit(siniestro.beneficiarios));
    setTipoEdit(siniestro.tipo);
    setDocTipoEdit(siniestro.doc_tipo ?? 'DNI');
    setEsUberEdit(!!siniestro.es_uber);
    setEsChequeEdit(!!siniestro.es_cheque);
    setChequeBancoEdit(siniestro.cheque_banco ?? '');
    setChequePersonaEdit(siniestro.cheque_persona ?? '');
    setChequeDniEdit(siniestro.cheque_dni ?? '');
    setEsPagoCuentaEdit(!!siniestro.es_pago_cuenta);
    setReembolsoAbogadoEdit(!!siniestro.reembolso_abogado);
    setNotaPausaInput(siniestro.nota_pausa ?? '');
    setEditMode(false);
    setConfirmandoBorrado(false);
    setConfirmandoArchivar(false);
    setVerHistorial(false);
  }, [siniestro.id]);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose]);

  const canEdit = puedeEditarCampos(usuario, siniestro);
  const censura = debeCensurar(usuario);
  const canUpload = puedeSubirPDF(usuario, siniestro);
  const canDelete = puedeBorrarPDF(usuario, siniestro);
  const canDeleteSiniestro = puedeBorrarSiniestro(usuario);
  const canArchive = puedeArchivar(usuario);
  const isFinal = esEtapaFinal(siniestro.tipo, siniestro.estado);
  const isArchivado = !!siniestro.archived_at;
  const puedeMoverEnGeneral = usuario?.rol === 'admin' || usuario?.rol === 'terceros';

  const pausado = estaPausado(siniestro);
  const diasAbierto = diasEfectivos(siniestro);
  const diasEnEtapaActual = (() => {
    const ult = [...movimientos].reverse().find((m) => m.estado_nuevo === siniestro.estado);
    return diasHabilesDesde(ult?.timestamp ?? siniestro.created_at);
  })();
  const colorEtapa = colorPorDias(diasEnEtapaActual);

  const esVariosBens = (siniestro.beneficiarios?.length ?? 0) > 1;
  // En modo edición manda lo que se está editando; fuera de él, lo guardado.
  const esReembolsoAbogado = editMode
    ? tipoEdit === 'reembolso' && reembolsoAbogadoEdit
    : !!siniestro.reembolso_abogado;
  const uber = esUber(siniestro);

  /** El cambio de tipo reubica la tarjeta: la etapa actual debe existir en el nuevo flujo. */
  function etapaParaTipo(nuevoTipo: TipoSiniestro): string {
    const etapas = getEtapas(nuevoTipo);
    if (etapas.includes(siniestro.estado)) return siniestro.estado;
    // Si no existe (deducible ↔ pago tienen etapas distintas), se conserva la
    // posición relativa en el flujo.
    const etapasViejas = getEtapas(siniestro.tipo);
    const idx = etapasViejas.indexOf(siniestro.estado);
    return etapas[Math.min(Math.max(idx, 0), etapas.length - 1)] ?? etapas[0];
  }

  async function guardarCampos() {
    if (!canEdit) return;
    const codigoNuevo = codigo.trim();
    if (!validarCodigo(codigoNuevo)) {
      alert('El código debe tener exactamente 8 o 10 dígitos numéricos.');
      return;
    }

    const admitePagoCuenta = tipoEdit === 'pago' || tipoEdit === 'reembolso';
    const esCheque = tipoEdit === 'pago' && esChequeEdit;
    const pagoCuenta = admitePagoCuenta && esPagoCuentaEdit;
    const marcaUber = admiteUber(tipoEdit) && esUberEdit;

    if (esCheque && (!chequeBancoEdit.trim() || !chequePersonaEdit.trim() || !chequeDniEdit.trim())) {
      alert('Para un cheque hace falta el banco, quién lo recoge y su DNI.');
      return;
    }

    const updates: Partial<Siniestro> = {
      notas: notas || null,
      moneda,
      // Sub-opciones del pago
      es_cheque: esCheque,
      cheque_banco: esCheque ? chequeBancoEdit.trim() : null,
      cheque_persona: esCheque ? chequePersonaEdit.trim() : null,
      cheque_dni: esCheque ? chequeDniEdit.trim() : null,
      es_pago_cuenta: pagoCuenta,
      es_uber: marcaUber,
      reembolso_abogado: tipoEdit === 'reembolso' ? reembolsoAbogadoEdit : false,
      doc_tipo: docTipoEdit,
    };

    if (esVariosBens) {
      const bens = bensEdit
        .map((b) => ({ nombre: b.nombre.trim(), dni: b.dni.trim(), tipo: b.tipo, monto: Number(b.monto) || 0 }))
        .filter((b) => b.nombre && (b.dni || esReembolsoAbogado));
      if (bens.length < 2) {
        alert('Con varios beneficiarios debe haber al menos 2 filas completas.');
        return;
      }
      const conMonto = bens.filter((b) => b.monto > 0).length;
      if (conMonto > 0 && conMonto < bens.length) {
        alert('Completa el monto de todos los beneficiarios (o deja todos vacíos para no cambiar el total).');
        return;
      }
      // Si todos tienen monto, el total del siniestro es la suma. Si ninguno lo
      // tiene (siniestros antiguos), el total se mantiene tal cual.
      updates.beneficiarios = conMonto === bens.length
        ? bens
        : bens.map(({ monto: _m, ...rest }) => rest);
      if (conMonto === bens.length) {
        updates.monto = bens.reduce((acc, b) => acc + b.monto, 0);
      }
      updates.asegurado_nombre = bens[0].nombre;
      if (tipoEdit !== 'deducible') updates.dni_tercero = bens[0].dni || null;
    } else {
      updates.monto = monto ? Number(monto) : null;
      updates.asegurado_nombre = aseguradoNombre || null;
      if (tipoEdit !== 'deducible') updates.dni_tercero = dniTercero || null;
      else updates.correo_asegurado = correoAsegurado || null;
    }

    const codigoCambiado = codigoNuevo !== siniestro.codigo;
    const tipoCambiado = tipoEdit !== siniestro.tipo;
    const uberCambiado = marcaUber !== !!siniestro.es_uber;
    if (codigoCambiado) updates.codigo = codigoNuevo;
    if (tipoCambiado) {
      updates.tipo = tipoEdit;
      updates.estado = etapaParaTipo(tipoEdit);
    }
    // El responsable sale del flujo: depende del tipo, los dígitos (8 → Christian,
    // 10 → Jack) y, dentro de los de 8, de si es UBER (→ Katty).
    if (codigoCambiado || tipoCambiado || uberCambiado) {
      updates.asignado_a = getResponsableDeEtapa(
        tipoEdit,
        updates.estado ?? siniestro.estado,
        { codigo: codigoNuevo, es_uber: marcaUber }
      );
    }

    setGuardando(true);
    const { error } = await supabase.from('siniestros').update(updates).eq('id', siniestro.id);
    if (error) { setGuardando(false); alert('Error: ' + error.message); return; }

    // Los cambios estructurales quedan en el historial del caso.
    const notasCambio = [
      codigoCambiado ? `Código corregido: ${siniestro.codigo} → ${codigoNuevo}` : null,
      tipoCambiado ? `Tipo cambiado: ${tipoLabel[siniestro.tipo]} → ${tipoLabel[tipoEdit]}` : null,
      uberCambiado ? (marcaUber ? 'Marcado como UBER' : 'Ya no es UBER') : null,
    ].filter(Boolean);
    if (notasCambio.length > 0) {
      await supabase.from('siniestro_movimientos').insert({
        siniestro_id: siniestro.id,
        estado_anterior: siniestro.estado,
        estado_nuevo: updates.estado ?? siniestro.estado,
        movido_por: usuario?.nombre ?? 'sistema',
        notas: notasCambio.join(' · '),
      });
    }
    setGuardando(false);
    setEditMode(false);
    onChanged();
  }

  async function onUploadPDFs(files: FileList | null) {
    if (!files || !canUpload) return;
    setSubiendo(true);
    const nuevasUrls: string[] = [];
    for (const f of Array.from(files)) {
      const path = `${siniestro.id}/${Date.now()}-${f.name.replace(/[^\w.\-]/g, '_')}`;
      const { error } = await supabase.storage.from(STORAGE_BUCKET).upload(path, f, {
        contentType: f.type || 'application/pdf', upsert: false,
      });
      if (error) { alert('Error subiendo ' + f.name + ': ' + error.message); continue; }
      const { data } = supabase.storage.from(STORAGE_BUCKET).getPublicUrl(path);
      nuevasUrls.push(data.publicUrl);
    }
    if (nuevasUrls.length > 0) {
      await supabase.from('siniestros')
        .update({ pdf_urls: [...siniestro.pdf_urls, ...nuevasUrls] })
        .eq('id', siniestro.id);
    }
    setSubiendo(false);
    if (fileRef.current) fileRef.current.value = '';
    onChanged();
  }

  async function eliminarPDF(url: string) {
    if (!canDelete) return;
    if (!confirm('¿Eliminar este PDF?')) return;
    const match = url.match(/\/storage\/v1\/object\/public\/[^/]+\/(.+)$/);
    if (match) {
      const path = decodeURIComponent(match[1]);
      await supabase.storage.from(STORAGE_BUCKET).remove([path]);
    }
    const nuevas = siniestro.pdf_urls.filter((u) => u !== url);
    await supabase.from('siniestros').update({ pdf_urls: nuevas }).eq('id', siniestro.id);
    onChanged();
  }

  async function eliminarSiniestro() {
    if (!canDeleteSiniestro) return;
    for (const url of siniestro.pdf_urls) {
      const match = url.match(/\/storage\/v1\/object\/public\/[^/]+\/(.+)$/);
      if (match) {
        const path = decodeURIComponent(match[1]);
        await supabase.storage.from(STORAGE_BUCKET).remove([path]);
      }
    }
    await supabase.from('siniestros').delete().eq('id', siniestro.id);
    onClose();
    onChanged();
    if (window.location.pathname.startsWith('/siniestro/')) router.push('/');
  }

  async function toggleUrgente() {
    if (!puedeMoverEnGeneral) return;
    const nuevo = !siniestro.urgente;
    const { error } = await supabase
      .from('siniestros')
      .update({ urgente: nuevo })
      .eq('id', siniestro.id);
    if (error) { alert('Error: ' + error.message); return; }
    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: siniestro.estado,
      movido_por: usuario?.nombre ?? 'sistema',
      notas: nuevo ? 'Marcado como urgente' : 'Se quitó la marca de urgente',
    });
    onChanged();
  }

  async function actualizarDeduciblePagado(valor: boolean) {
    if (!puedeMoverEnGeneral) return;
    // Toggle: si ya estaba en ese valor, vuelve a "sin indicar" (null).
    const nuevo = siniestro.deducible_pagado === valor ? null : valor;
    const { error } = await supabase
      .from('siniestros')
      .update({ deducible_pagado: nuevo })
      .eq('id', siniestro.id);
    if (error) { alert('Error: ' + error.message); return; }
    onChanged();
  }

  const [diasInput, setDiasInput] = useState('');
  async function ajustarDias(reset: boolean) {
    if (!puedeMoverEnGeneral) return;
    const payload = reset
      ? { dias_ajuste: null, dias_ajuste_fecha: null }
      : { dias_ajuste: Math.max(0, Math.floor(Number(diasInput) || 0)), dias_ajuste_fecha: new Date().toISOString() };
    const { error } = await supabase.from('siniestros').update(payload).eq('id', siniestro.id);
    if (error) { alert('Error: ' + error.message); return; }
    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: siniestro.estado,
      movido_por: usuario?.nombre ?? 'sistema',
      notas: reset ? 'Conteo de días restablecido' : `Días ajustados a ${payload.dias_ajuste}`,
    });
    setDiasInput('');
    onChanged();
  }

  // v10 — Nota de pausa: congela el contador (guarda los días actuales en
  // dias_ajuste) hasta que Pacífico lo reanude. El tiempo en pausa no cuenta.
  async function pausarContador() {
    if (!puedeMoverEnGeneral) return;
    const nota = notaPausaInput.trim();
    if (!nota) { alert('Escribe una nota para pausar el contador.'); return; }
    setPausando(true);
    const congelado = diasEfectivos(siniestro);
    const { error } = await supabase
      .from('siniestros')
      .update({
        nota_pausa: nota,
        pausado: true,
        dias_ajuste: congelado,
        dias_ajuste_fecha: new Date().toISOString(),
      })
      .eq('id', siniestro.id);
    if (error) { setPausando(false); alert('Error: ' + error.message); return; }
    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: siniestro.estado,
      movido_por: usuario?.nombre ?? 'sistema',
      notas: `Contador pausado (${congelado}d): ${nota}`,
    });
    setPausando(false);
    onChanged();
  }

  async function reanudarContador() {
    if (!puedeMoverEnGeneral) return;
    setPausando(true);
    // Se mantiene dias_ajuste (los días congelados) y se reinicia la fecha a hoy,
    // de modo que el conteo continúa desde el valor congelado.
    const { error } = await supabase
      .from('siniestros')
      .update({
        pausado: false,
        nota_pausa: null,
        dias_ajuste_fecha: new Date().toISOString(),
      })
      .eq('id', siniestro.id);
    if (error) { setPausando(false); alert('Error: ' + error.message); return; }
    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: siniestro.estado,
      movido_por: usuario?.nombre ?? 'sistema',
      notas: 'Contador reanudado',
    });
    setNotaPausaInput('');
    setPausando(false);
    onChanged();
  }

  async function archivar() {
    if (!canArchive) return;
    const ts = new Date().toISOString();
    const { error } = await supabase
      .from('siniestros')
      .update({ archived_at: ts })
      .eq('id', siniestro.id);
    if (error) { alert('Error: ' + error.message); return; }
    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: siniestro.estado,
      movido_por: usuario?.nombre ?? 'sistema',
      notas: 'Archivado al histórico',
    });
    onClose();
    onChanged();
  }

  async function desarchivar() {
    if (!canArchive) return;
    const { error } = await supabase
      .from('siniestros')
      .update({ archived_at: null })
      .eq('id', siniestro.id);
    if (error) { alert('Error: ' + error.message); return; }
    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: siniestro.estado,
      movido_por: usuario?.nombre ?? 'sistema',
      notas: 'Restaurado del histórico',
    });
    onChanged();
  }

  return (
    <div className="fixed inset-0 z-40 flex justify-end bg-black/60 backdrop-blur-sm fade-in" onClick={onClose}>
      <aside
        className="h-full w-full max-w-xl overflow-y-auto bg-ink-800 border-l border-white/10 shadow-2xl text-slate-200"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header — fondo dark con tinte por tipo */}
        <div className={cn('bg-gradient-to-b px-5 py-4 relative', accentByTipo[siniestro.tipo])}>
          <button
            onClick={onClose}
            className="absolute top-3 right-3 rounded-full p-1.5 text-slate-400 hover:bg-white/10 hover:text-white transition"
            aria-label="Cerrar"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>

          <div className={cn('text-[10px] font-semibold uppercase tracking-[0.16em]', accentTextByTipo[siniestro.tipo])}>
            {tipoLabel[siniestro.tipo]}
            {siniestro.reembolso_abogado ? ' · a abogado' : ''}
            {uber && (
              <span
                className={cn(
                  'ml-2 inline-flex items-center rounded-full px-2 py-0.5 text-[9px] font-bold normal-case tracking-normal',
                  UBER_CHIP
                )}
              >
                UBER
              </span>
            )}
            {siniestro.urgente && (
              <span className="ml-2 inline-flex items-center gap-1 rounded-full bg-red-500/20 px-2 py-0.5 text-[9px] font-bold text-red-300 ring-1 ring-red-500/40 normal-case tracking-normal">
                <svg className="h-2.5 w-2.5" viewBox="0 0 20 20" fill="currentColor">
                  <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                </svg>
                Urgente
              </span>
            )}
            {isArchivado && (
              <span className="ml-2 inline-flex items-center gap-1 rounded-full bg-white/10 px-2 py-0.5 text-[9px] text-slate-300 normal-case tracking-normal">
                Archivado
              </span>
            )}
          </div>
          <h2 className="mt-0.5 font-mono text-2xl font-bold tracking-tight leading-tight text-white">
            {siniestro.codigo}
          </h2>

          <div className="mt-4 grid grid-cols-3 gap-3">
            <Metric
              label="Tiempo abierto"
              value={pausado ? '—' : `${diasAbierto}d`}
              subtitle={
                pausado
                  ? `Pausado · ${diasAbierto}d congelados`
                  : isFinal && siniestro.closed_at
                  ? `Cerrado hace ${diasDesde(siniestro.closed_at)}d`
                  : undefined
              }
            />
            <Metric
              label="En etapa"
              value={
                <span className="flex items-center gap-1.5">
                  <span className={cn('h-2 w-2 rounded-full', dotByColor[colorEtapa])} />
                  {diasEnEtapaActual}d
                </span>
              }
              subtitle={siniestro.estado}
            />
            <Metric
              label="Responsable"
              value={siniestro.asignado_a ?? '—'}
            />
          </div>

          <div className="mt-3 text-[11px] text-slate-400">
            Creado {formatFecha(siniestro.created_at)} por <strong className="text-slate-200">{siniestro.solicitante}</strong>
          </div>
        </div>

        <div className="space-y-5 px-5 py-5">
          {/* Banner de pausa — visible para todos cuando el contador está pausado */}
          {pausado && (
            <div className="rounded-lg border border-amber-500/30 bg-amber-500/[0.08] px-3 py-2.5 flex items-start gap-2.5">
              <svg className="h-4 w-4 shrink-0 text-amber-300 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
                <path d="M6 4h3v12H6zM11 4h3v12h-3z" />
              </svg>
              <div className="min-w-0 text-xs">
                <span className="font-semibold text-amber-200">Contador de días pausado</span>
                <span className="block text-[11px] text-amber-100/70">
                  El conteo quedó congelado en {diasAbierto}d por Pacífico.
                </span>
                {siniestro.nota_pausa && (
                  <p className="mt-1 whitespace-pre-wrap text-[11px] text-slate-300">{siniestro.nota_pausa}</p>
                )}
              </div>
            </div>
          )}

          {/* Marcar como urgente (pacífico: admin/terceros) */}
          {puedeMoverEnGeneral && (
            <button
              onClick={toggleUrgente}
              className={cn(
                'flex w-full items-center justify-between gap-2 rounded-lg border px-3 py-2.5 text-left transition',
                siniestro.urgente
                  ? 'border-red-500/40 bg-red-500/10 hover:bg-red-500/15'
                  : 'border-white/10 bg-white/[0.02] hover:bg-white/[0.04]'
              )}
            >
              <span className="flex items-center gap-2">
                <svg
                  className={cn('h-4 w-4', siniestro.urgente ? 'text-red-400' : 'text-slate-400')}
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                </svg>
                <span className="text-sm font-medium text-slate-200">
                  {siniestro.urgente ? 'Caso marcado como urgente' : 'Marcar como caso urgente'}
                </span>
              </span>
              <span
                className={cn(
                  'text-[11px] font-semibold',
                  siniestro.urgente ? 'text-red-300' : 'text-slate-500'
                )}
              >
                {siniestro.urgente ? 'Quitar' : 'Marcar'}
              </span>
            </button>
          )}

          {puedeMoverEnGeneral && !isFinal && !isArchivado && (
            <p className="text-[11px] text-slate-500 -mt-1">
              Tip: arrastra la tarjeta entre columnas del tablero para mover de etapa.
            </p>
          )}

          {/* Datos */}
          <section>
            <div className="flex items-center justify-between mb-2.5">
              <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">Datos</h3>
              {canEdit && !editMode && (
                <button
                  onClick={() => setEditMode(true)}
                  className="grid h-7 w-7 place-items-center rounded-md text-slate-500 hover:text-white hover:bg-white/10 transition"
                  title="Editar"
                >
                  <PencilIcon />
                </button>
              )}
              {editMode && (
                <div className="flex gap-1.5">
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => {
                      setEditMode(false);
                      setCodigo(siniestro.codigo);
                      setNotas(siniestro.notas ?? '');
                      setMonto(siniestro.monto?.toString() ?? '');
                      setMoneda(siniestro.moneda ?? 'PEN');
                      setAseguradoNombre(siniestro.asegurado_nombre ?? '');
                      setDniTercero(siniestro.dni_tercero ?? '');
                      setCorreoAsegurado(siniestro.correo_asegurado ?? '');
                      setBensEdit(toBenEdit(siniestro.beneficiarios));
                      setTipoEdit(siniestro.tipo);
                      setDocTipoEdit(siniestro.doc_tipo ?? 'DNI');
                      setEsUberEdit(!!siniestro.es_uber);
                      setEsChequeEdit(!!siniestro.es_cheque);
                      setChequeBancoEdit(siniestro.cheque_banco ?? '');
                      setChequePersonaEdit(siniestro.cheque_persona ?? '');
                      setChequeDniEdit(siniestro.cheque_dni ?? '');
                      setEsPagoCuentaEdit(!!siniestro.es_pago_cuenta);
                      setReembolsoAbogadoEdit(!!siniestro.reembolso_abogado);
                    }}
                  >
                    Cancelar
                  </Button>
                  <Button size="sm" onClick={guardarCampos} disabled={guardando}>
                    {guardando ? 'Guardando…' : 'Guardar'}
                  </Button>
                </div>
              )}
            </div>

            {editMode ? (
              <div className="space-y-3">
                {/* Tipo — corregible: un pago mal registrado como reembolso se arregla aquí */}
                <div>
                  <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1.5">
                    Tipo de siniestro
                  </label>
                  <div className="flex flex-wrap gap-1.5">
                    {(['pago', 'reembolso', 'deducible', 'info_poliza'] as TipoSiniestro[]).map((t) => (
                      <button
                        key={t}
                        type="button"
                        onClick={() => setTipoEdit(t)}
                        className={cn(
                          'rounded-md border px-2.5 py-1 text-xs font-medium transition',
                          tipoEdit === t
                            ? 'border-white/25 bg-white/10 text-white'
                            : 'border-white/10 bg-white/[0.03] text-slate-400 hover:text-slate-200'
                        )}
                      >
                        {tipoLabel[t]}
                      </button>
                    ))}
                  </div>
                  {tipoEdit !== siniestro.tipo && (
                    <p className="mt-1.5 text-[11px] text-amber-300/90">
                      Al guardar, la tarjeta se mueve a la sección de {tipoLabel[tipoEdit]} (etapa
                      "{etapaParaTipo(tipoEdit)}") y se recalcula el responsable.
                    </p>
                  )}
                </div>

                <div className="grid grid-cols-2 gap-3">
                  <div className="col-span-2">
                    <Input
                      label="Número de siniestro"
                      value={codigo}
                      onChange={(e) => setCodigo(e.target.value.replace(/\D/g, ''))}
                      maxLength={10}
                      inputMode="numeric"
                      className="font-mono tabular-nums"
                      hint="8 o 10 dígitos. Al cambiarlo se reasigna el responsable y queda registrado en el historial."
                    />
                  </div>
                  {!esVariosBens && (
                    <Input
                      label="Monto"
                      type="number"
                      step="0.01"
                      value={monto}
                      onChange={(e) => setMonto(e.target.value)}
                    />
                  )}
                  <div>
                    <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1.5">Moneda</label>
                    <div className="inline-flex rounded-lg bg-white/[0.04] border border-white/[0.06] p-1">
                      <MonedaPill active={moneda === 'PEN'} onClick={() => setMoneda('PEN')}>S/ Soles</MonedaPill>
                      <MonedaPill active={moneda === 'USD'} onClick={() => setMoneda('USD')}>$ Dólares</MonedaPill>
                    </div>
                  </div>
                  {(!censura || esReembolsoAbogado) && !esVariosBens && (
                    <>
                      <Input
                        label={
                          esReembolsoAbogado
                            ? 'Abogado'
                            : tipoEdit === 'deducible'
                            ? 'Asegurado'
                            : 'Asegurado / tercero'
                        }
                        value={aseguradoNombre}
                        onChange={(e) => setAseguradoNombre(e.target.value)}
                      />
                      {tipoEdit === 'deducible' ? (
                        <Input label="Correo" type="email" value={correoAsegurado} onChange={(e) => setCorreoAsegurado(e.target.value)} />
                      ) : esReembolsoAbogado ? null : (
                        <div>
                          <div className="flex items-center justify-between mb-1.5">
                            <label className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">
                              Documento
                            </label>
                            <div className="inline-flex rounded-md bg-white/[0.04] border border-white/[0.06] p-0.5">
                              {(['DNI', 'CE'] as TipoDocumento[]).map((t) => (
                                <button
                                  key={t}
                                  type="button"
                                  onClick={() => setDocTipoEdit(t)}
                                  className={cn(
                                    'rounded px-1.5 py-0.5 text-[10px] font-medium transition',
                                    docTipoEdit === t ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
                                  )}
                                >
                                  {t}
                                </button>
                              ))}
                            </div>
                          </div>
                          <input
                            value={dniTercero}
                            onChange={(e) => setDniTercero(e.target.value)}
                            maxLength={12}
                            inputMode="numeric"
                            placeholder={`N° de ${docTipoEdit}`}
                            className="w-full rounded-lg border border-white/10 bg-white/[0.04] px-2.5 py-1.5 text-sm text-slate-100 placeholder:text-slate-500 focus:outline-none focus:border-white/25 tabular-nums"
                          />
                        </div>
                      )}
                    </>
                  )}
                </div>

                {/* Beneficiarios múltiples — nombre, documento y monto por persona */}
                {esVariosBens && (!censura || esReembolsoAbogado) && (
                  <div className="rounded-lg border border-white/10 bg-white/[0.02] p-3 space-y-2">
                    <div className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">
                      Beneficiarios (monto por persona)
                    </div>
                    {bensEdit.map((b, i) => (
                      <div key={i} className="flex items-center gap-2">
                        <input
                          value={b.nombre}
                          onChange={(e) =>
                            setBensEdit((prev) => prev.map((x, j) => (j === i ? { ...x, nombre: e.target.value } : x)))
                          }
                          placeholder="Nombre completo"
                          className="flex-1 min-w-0 rounded-lg border border-white/10 bg-white/[0.04] px-2.5 py-1.5 text-xs text-slate-100 placeholder:text-slate-500 focus:outline-none focus:border-white/25"
                        />
                        {!esReembolsoAbogado && (
                          <input
                            value={b.dni}
                            onChange={(e) =>
                              setBensEdit((prev) => prev.map((x, j) => (j === i ? { ...x, dni: e.target.value } : x)))
                            }
                            maxLength={12}
                            inputMode="numeric"
                            placeholder={b.tipo}
                            className="w-24 rounded-lg border border-white/10 bg-white/[0.04] px-2.5 py-1.5 text-xs text-slate-100 placeholder:text-slate-500 focus:outline-none focus:border-white/25 tabular-nums"
                          />
                        )}
                        <input
                          type="number"
                          step="0.01"
                          min="0"
                          value={b.monto}
                          onChange={(e) =>
                            setBensEdit((prev) => prev.map((x, j) => (j === i ? { ...x, monto: e.target.value } : x)))
                          }
                          placeholder="Monto"
                          inputMode="decimal"
                          className="w-24 rounded-lg border border-white/10 bg-white/[0.04] px-2.5 py-1.5 text-xs text-slate-100 placeholder:text-slate-500 focus:outline-none focus:border-white/25 tabular-nums"
                        />
                        {bensEdit.length > 2 && (
                          <button
                            type="button"
                            onClick={() => setBensEdit((prev) => prev.filter((_, j) => j !== i))}
                            className="grid h-7 w-7 shrink-0 place-items-center rounded-md text-slate-500 hover:bg-red-500/15 hover:text-red-400 transition"
                            title="Quitar beneficiario"
                          >
                            <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
                              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
                            </svg>
                          </button>
                        )}
                      </div>
                    ))}
                    <div className="flex items-center justify-between gap-2">
                      <button
                        type="button"
                        onClick={() => setBensEdit((prev) => [...prev, { nombre: '', dni: '', tipo: 'DNI', monto: '' }])}
                        className="text-[11px] font-medium text-slate-400 hover:text-white transition"
                      >
                        + Agregar beneficiario
                      </button>
                      <span className="text-[11px] text-slate-400">
                        Total:{' '}
                        <strong className="text-slate-200 tabular-nums">
                          {formatMoneda(bensEdit.reduce((acc, b) => acc + (Number(b.monto) || 0), 0), moneda)}
                        </strong>
                      </span>
                    </div>
                  </div>
                )}

                {/* Sub-opciones: lo que antes solo se podía elegir al crear */}
                {tipoEdit === 'reembolso' && (
                  <ToggleLinea
                    activo={reembolsoAbogadoEdit}
                    onToggle={() => setReembolsoAbogadoEdit((v) => !v)}
                    titulo="Reembolso a un abogado"
                    detalle="Se registra solo el nombre, sin documento."
                    color="violeta"
                  />
                )}

                {admiteUber(tipoEdit) && (
                  <ToggleLinea
                    activo={esUberEdit}
                    onToggle={() => setEsUberEdit((v) => !v)}
                    titulo="Caso UBER"
                    detalle="Se distingue en el tablero. Los de 8 dígitos los gestiona Katty."
                    color="uber"
                  />
                )}

                {(tipoEdit === 'pago' || tipoEdit === 'reembolso') && (
                  <ToggleLinea
                    activo={esPagoCuentaEdit}
                    onToggle={() => {
                      setEsPagoCuentaEdit((v) => {
                        const nuevo = !v;
                        if (nuevo) setEsChequeEdit(false);
                        return nuevo;
                      });
                    }}
                    titulo="Pago en cuenta bancaria"
                    detalle="Necesita la ficha de matrícula entre los adjuntos."
                    color="teal"
                  />
                )}

                {tipoEdit === 'pago' && (
                  <div className="rounded-lg border border-white/10 bg-white/[0.02] p-3 space-y-3">
                    <ToggleLinea
                      activo={esChequeEdit}
                      onToggle={() => {
                        setEsChequeEdit((v) => {
                          const nuevo = !v;
                          if (nuevo) setEsPagoCuentaEdit(false);
                          return nuevo;
                        });
                      }}
                      titulo="El pago es un cheque"
                      detalle="Banco y quién lo recoge."
                      color="cyan"
                      plano
                    />
                    {esChequeEdit && (
                      <div className="space-y-2.5 slide-in">
                        <Input label="Banco" value={chequeBancoEdit} onChange={(e) => setChequeBancoEdit(e.target.value)} />
                        <div className="grid grid-cols-2 gap-3">
                          <Input
                            label="Persona que recoge"
                            value={chequePersonaEdit}
                            onChange={(e) => setChequePersonaEdit(e.target.value)}
                          />
                          <Input
                            label="DNI de quien recoge"
                            value={chequeDniEdit}
                            onChange={(e) => setChequeDniEdit(e.target.value)}
                            maxLength={12}
                            inputMode="numeric"
                          />
                        </div>
                      </div>
                    )}
                  </div>
                )}

                <Textarea label="Notas" value={notas} onChange={(e) => setNotas(e.target.value)} rows={3} />
              </div>
            ) : (
              <div className="rounded-lg border border-white/10 bg-white/[0.02] divide-y divide-white/5">
                <DataLine
                  label={esVariosBens ? 'Monto total' : 'Monto'}
                  value={formatMoneda(siniestro.monto, siniestro.moneda)}
                  highlight
                />
                <DataLine
                  label={esReembolsoAbogado ? 'Abogado' : 'Asegurado / tercero'}
                  value={censurar(siniestro.asegurado_nombre, censura && !esReembolsoAbogado)}
                />
                {siniestro.tipo === 'deducible' ? (
                  <DataLine label="Correo" value={siniestro.correo_asegurado ?? '—'} />
                ) : esReembolsoAbogado ? null : (
                  <DataLine
                    label={siniestro.doc_tipo === 'CE' ? 'CE' : 'DNI'}
                    value={censurar(siniestro.dni_tercero, censura)}
                  />
                )}
                <DataLine label="Solicitante" value={siniestro.solicitante} />
                {siniestro.notas && <DataLine label="Notas" value={siniestro.notas} multiline />}
              </div>
            )}

            {/* Pago en cuenta */}
            {siniestro.es_pago_cuenta && !editMode && (
              <div className="mt-3 rounded-lg border border-teal-500/25 bg-teal-500/[0.05] px-3 py-2.5 flex items-center gap-2">
                <svg className="h-4 w-4 shrink-0 text-teal-300" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M10 2L2 7h16l-8-5z" />
                  <path d="M4 8v6h2V8H4zm5 0v6h2V8H9zm5 0v6h2V8h-2zM2 16h16v2H2v-2z" />
                </svg>
                <div className="text-xs">
                  <span className="font-semibold text-teal-200">Pago en cuenta bancaria</span>
                  <span className="block text-[11px] text-slate-400">La ficha de matrícula está en los PDFs adjuntos.</span>
                </div>
              </div>
            )}

            {/* Beneficiarios múltiples — cada uno con su documento y su monto */}
            {esVariosBens && !editMode && (
              <div className="mt-3 rounded-lg border border-white/10 bg-white/[0.02] divide-y divide-white/5">
                <div className="px-3 py-2 text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">
                  Beneficiarios ({siniestro.beneficiarios!.length})
                </div>
                {siniestro.beneficiarios!.map((b, i) => (
                  <DataLine
                    key={i}
                    label={`${i + 1}. ${censurar(b.nombre, censura && !esReembolsoAbogado)}`}
                    value={[
                      b.dni ? `${b.tipo ?? 'DNI'} ${censurar(b.dni, censura)}` : null,
                      b.monto != null ? formatMoneda(b.monto, siniestro.moneda) : null,
                    ]
                      .filter(Boolean)
                      .join(' · ') || '—'}
                  />
                ))}
              </div>
            )}

            {/* Bloque Cheque */}
            {siniestro.es_cheque && !editMode && (
              <div className="mt-3 rounded-lg border border-cyan-500/20 bg-cyan-500/[0.04] divide-y divide-white/5">
                <div className="px-3 py-2 text-[10px] font-semibold uppercase tracking-[0.12em] text-cyan-300">
                  Cheque
                </div>
                <DataLine label="Banco" value={siniestro.cheque_banco ?? '—'} />
                <DataLine label="Recoge" value={censurar(siniestro.cheque_persona, censura)} />
                <DataLine label="DNI recoge" value={censurar(siniestro.cheque_dni, censura)} />
              </div>
            )}

            {/* Deducible — aplica a todos los pagos. Lo ven todos; lo marca Pacífico. */}
            {siniestro.tipo === 'pago' && !editMode && (
              <div className="mt-3 rounded-lg border border-white/10 bg-white/[0.02] p-3">
                <div className="flex items-center justify-between gap-2 flex-wrap">
                  <div>
                    <div className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">
                      Deducible
                    </div>
                    <div
                      className={cn(
                        'mt-0.5 text-sm font-semibold',
                        siniestro.deducible_pagado == null
                          ? 'text-slate-400'
                          : siniestro.deducible_pagado
                          ? 'text-emerald-300'
                          : 'text-red-300'
                      )}
                    >
                      {siniestro.deducible_pagado == null
                        ? 'Sin indicar'
                        : siniestro.deducible_pagado
                        ? 'Pagado'
                        : 'No pagado'}
                    </div>
                  </div>
                  {puedeMoverEnGeneral && (
                    <div className="inline-flex gap-1.5">
                      <button
                        onClick={() => actualizarDeduciblePagado(true)}
                        className={cn(
                          'rounded-md px-2.5 py-1 text-[11px] font-medium border transition',
                          siniestro.deducible_pagado === true
                            ? 'border-emerald-500/50 bg-emerald-500/15 text-emerald-300'
                            : 'border-white/10 text-slate-400 hover:text-white'
                        )}
                      >
                        Pagado
                      </button>
                      <button
                        onClick={() => actualizarDeduciblePagado(false)}
                        className={cn(
                          'rounded-md px-2.5 py-1 text-[11px] font-medium border transition',
                          siniestro.deducible_pagado === false
                            ? 'border-red-500/50 bg-red-500/15 text-red-300'
                            : 'border-white/10 text-slate-400 hover:text-white'
                        )}
                      >
                        No pagado
                      </button>
                    </div>
                  )}
                </div>
                {puedeMoverEnGeneral && (
                  <p className="mt-1.5 text-[11px] text-slate-500">
                    Vuelve a tocar el mismo botón para dejarlo en “Sin indicar”.
                  </p>
                )}
              </div>
            )}
          </section>

          {/* PDFs */}
          <section>
            <div className="flex items-center justify-between mb-2">
              <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">
                PDFs ({siniestro.pdf_urls.length})
              </h3>
              {canUpload && (
                <label className="cursor-pointer">
                  <input
                    ref={fileRef}
                    type="file"
                    accept="application/pdf"
                    multiple
                    className="hidden"
                    onChange={(e) => onUploadPDFs(e.target.files)}
                  />
                  <span className="inline-flex items-center gap-1 rounded-md bg-white/10 px-2.5 py-1 text-[11px] font-medium text-white hover:bg-white/15 transition">
                    {subiendo ? 'Subiendo…' : '+ Adjuntar'}
                  </span>
                </label>
              )}
            </div>
            {siniestro.pdf_urls.length === 0 ? (
              <p className="text-xs text-slate-500">Sin archivos.</p>
            ) : (
              <div className="flex flex-wrap gap-1.5">
                {siniestro.pdf_urls.map((url) => {
                  const name = decodeURIComponent(url.split('/').pop() ?? 'archivo.pdf').replace(/^\d+-/, '');
                  return (
                    <div
                      key={url}
                      className="group inline-flex items-center gap-1.5 rounded-md border border-white/10 bg-white/[0.03] pl-2 pr-1 py-1 text-xs"
                    >
                      <svg className="h-3.5 w-3.5 text-red-400 shrink-0" viewBox="0 0 20 20" fill="currentColor">
                        <path fillRule="evenodd" d="M4 4a2 2 0 012-2h6.586A2 2 0 0114 2.586L17.414 6A2 2 0 0118 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4z" clipRule="evenodd" />
                      </svg>
                      <a
                        href={url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-slate-300 hover:text-cyan-300 hover:underline max-w-[180px] truncate"
                      >
                        {name}
                      </a>
                      {canDelete && (
                        <button
                          onClick={() => eliminarPDF(url)}
                          className="ml-1 rounded p-0.5 text-slate-500 hover:bg-red-500/15 hover:text-red-400 transition"
                          title="Eliminar"
                        >
                          <svg className="h-3 w-3" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
                          </svg>
                        </button>
                      )}
                    </div>
                  );
                })}
              </div>
            )}
          </section>

          {/* Enviar / Reenviar correo de notificación */}
          <EnviarCorreoSection siniestro={siniestro} remitente={usuario ?? null} onChanged={onChanged} />

          {/* Recordatorio de gestión (para abogados y admin) */}
          {!isFinal && !isArchivado && (usuario?.rol === 'abogado' || usuario?.rol === 'admin') && (
            <RecordatorioSection
              siniestro={siniestro}
              remitente={usuario ?? null}
              diasTotales={diasAbierto}
              diasEnEtapa={diasEnEtapaActual}
            />
          )}

          {/* Historial */}
          {movimientos.length > 0 && (
            <section>
              <button
                onClick={() => setVerHistorial((v) => !v)}
                className="flex items-center gap-1.5 text-[11px] font-medium text-slate-400 hover:text-white transition"
              >
                <svg
                  className={cn('h-3 w-3 transition-transform', verHistorial && 'rotate-90')}
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path fillRule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.06 10 7.23 6.29a.75.75 0 111.04-1.08l4.39 4.25a.75.75 0 010 1.08l-4.39 4.25a.75.75 0 01-1.06-.02z" clipRule="evenodd" />
                </svg>
                Ver historial ({movimientos.length} {movimientos.length === 1 ? 'movimiento' : 'movimientos'})
              </button>
              {verHistorial && (
                <ol className="mt-3 relative space-y-2 border-l-2 border-white/10 pl-4 slide-in">
                  {movimientos.map((m) => (
                    <li key={m.id} className="relative">
                      <span className="absolute -left-[22px] top-1 grid h-3 w-3 place-items-center rounded-full bg-ink-800 border-2 border-slate-500">
                        <span className="h-1 w-1 rounded-full bg-slate-500" />
                      </span>
                      <div className="text-xs">
                        <div className="text-slate-300">
                          {m.estado_anterior && m.estado_anterior !== m.estado_nuevo ? (
                            <>
                              <span className="text-slate-500">{m.estado_anterior}</span>
                              <span className="mx-1 text-slate-600">→</span>
                              <span className="font-medium text-slate-200">{m.estado_nuevo}</span>
                            </>
                          ) : m.notas ? (
                            <span className="text-slate-400 italic">{m.notas}</span>
                          ) : (
                            <>
                              <span className="text-slate-500">Creado · </span>
                              <span className="font-medium text-slate-200">{m.estado_nuevo}</span>
                            </>
                          )}
                        </div>
                        <div className="text-[11px] text-slate-500">
                          {m.movido_por} · {formatFecha(m.timestamp)}
                        </div>
                        {m.notas && m.estado_anterior !== m.estado_nuevo && (
                          <div className="mt-1 rounded bg-white/5 px-2 py-1 text-[11px] text-slate-400">
                            {m.notas}
                          </div>
                        )}
                      </div>
                    </li>
                  ))}
                </ol>
              )}
            </section>
          )}

          {/* Nota de pausa (pacífico: admin/terceros) — congela el contador de días */}
          {puedeMoverEnGeneral && (
            <section
              className={cn(
                'rounded-lg border p-3 space-y-2',
                pausado ? 'border-amber-500/30 bg-amber-500/[0.05]' : 'border-white/10 bg-white/[0.02]'
              )}
            >
              <div className="flex items-center gap-1.5">
                <svg className="h-3.5 w-3.5 text-amber-300" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M6 4h3v12H6zM11 4h3v12h-3z" />
                </svg>
                <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">
                  Nota de pausa
                </h3>
              </div>
              <p className="text-[11px] text-slate-500">
                Pausa el contador de días con una nota (p. ej. “a la espera de documento del abogado”).
                Mientras esté pausado, en el tablero se muestra “—” y el tiempo no cuenta. Es distinta de
                las notas normales del siniestro.
              </p>
              <Textarea
                label={pausado ? 'Nota de pausa (activa)' : 'Motivo de la pausa'}
                value={notaPausaInput}
                onChange={(e) => setNotaPausaInput(e.target.value)}
                rows={2}
                placeholder="¿Por qué se pausa el conteo?"
                disabled={pausado}
              />
              <div className="flex items-center gap-2">
                {!pausado ? (
                  <Button size="sm" onClick={pausarContador} disabled={pausando || !notaPausaInput.trim()}>
                    {pausando ? 'Pausando…' : 'Pausar contador'}
                  </Button>
                ) : (
                  <Button size="sm" onClick={reanudarContador} disabled={pausando}>
                    {pausando ? 'Reanudando…' : 'Reanudar contador'}
                  </Button>
                )}
                {pausado && (
                  <span className="text-[11px] text-amber-300/80">
                    Congelado en {diasAbierto}d.
                  </span>
                )}
              </div>
            </section>
          )}

          {/* Ajuste de días (pacífico: admin/terceros) */}
          {puedeMoverEnGeneral && (
            <section className="rounded-lg border border-white/10 bg-white/[0.02] p-3 space-y-2">
              <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400">Ajustar días</h3>
              <p className="text-[11px] text-slate-500">
                Fija cuántos días hábiles lleva este siniestro. El conteo seguirá sumando días hábiles desde hoy.
                {siniestro.dias_ajuste != null && (
                  <span className="block mt-0.5 text-slate-400">
                    Base actual: {siniestro.dias_ajuste}d desde {siniestro.dias_ajuste_fecha ? formatFecha(siniestro.dias_ajuste_fecha) : '—'}.
                  </span>
                )}
              </p>
              <div className="flex items-center gap-2">
                <input
                  type="number"
                  min={0}
                  value={diasInput}
                  onChange={(e) => setDiasInput(e.target.value)}
                  placeholder="N° días"
                  className="w-24 rounded-lg bg-white/[0.03] border border-white/[0.06] px-3 py-1.5 text-sm text-slate-200 focus:outline-none focus:border-white/20"
                />
                <Button size="sm" onClick={() => ajustarDias(false)} disabled={diasInput === ''}>
                  Fijar días
                </Button>
                {siniestro.dias_ajuste != null && (
                  <Button variant="outline" size="sm" onClick={() => ajustarDias(true)}>
                    Restablecer
                  </Button>
                )}
              </div>
            </section>
          )}

          {/* Acciones de archivo (pacífico: admin/terceros) */}
          {canArchive && (
            <section className="rounded-lg border border-white/10 bg-white/[0.02] p-3">
              {isArchivado ? (
                <div className="space-y-2">
                  <p className="text-xs text-slate-400">
                    Este siniestro está archivado. Restaurarlo lo devolverá al tablero.
                  </p>
                  <Button variant="outline" size="sm" onClick={desarchivar}>
                    Restaurar al tablero
                  </Button>
                </div>
              ) : !confirmandoArchivar ? (
                <button
                  onClick={() => setConfirmandoArchivar(true)}
                  className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-300 hover:text-white transition"
                >
                  <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M4 3a2 2 0 00-2 2v1a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4z" />
                    <path fillRule="evenodd" d="M3 9h14v6a2 2 0 01-2 2H5a2 2 0 01-2-2V9zm5 2a1 1 0 011-1h2a1 1 0 110 2H9a1 1 0 01-1-1z" clipRule="evenodd" />
                  </svg>
                  Mandar a histórico
                </button>
              ) : (
                <div className="space-y-2">
                  <p className="text-xs text-slate-300">
                    El siniestro desaparece del tablero y queda solo en el histórico. Puedes restaurarlo después.
                  </p>
                  <div className="flex gap-2">
                    <Button size="sm" onClick={archivar}>
                      Sí, archivar
                    </Button>
                    <Button variant="outline" size="sm" onClick={() => setConfirmandoArchivar(false)}>
                      Cancelar
                    </Button>
                  </div>
                </div>
              )}
            </section>
          )}

          {/* Zona peligrosa (admin) */}
          {canDeleteSiniestro && (
            <section className="rounded-lg border border-red-500/30 bg-red-500/[0.06] p-3">
              {!confirmandoBorrado ? (
                <button
                  onClick={() => setConfirmandoBorrado(true)}
                  className="inline-flex items-center gap-1.5 text-xs font-medium text-red-300 hover:text-red-200 transition"
                >
                  <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
                    <path fillRule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9z" clipRule="evenodd" />
                  </svg>
                  Eliminar siniestro
                </button>
              ) : (
                <div className="space-y-2">
                  <p className="text-xs text-red-200">
                    Borra el siniestro, su historial y sus PDFs. No se puede deshacer.
                  </p>
                  <div className="flex gap-2">
                    <Button variant="danger" size="sm" onClick={eliminarSiniestro}>
                      Sí, eliminar
                    </Button>
                    <Button variant="outline" size="sm" onClick={() => setConfirmandoBorrado(false)}>
                      Cancelar
                    </Button>
                  </div>
                </div>
              )}
            </section>
          )}
        </div>
      </aside>
    </div>
  );
}

function Metric({ label, value, subtitle }: { label: string; value: React.ReactNode; subtitle?: string }) {
  return (
    <div>
      <div className="text-[10px] font-medium uppercase tracking-[0.10em] text-slate-400">{label}</div>
      <div className="mt-0.5 text-[15px] font-semibold leading-tight text-white">{value}</div>
      {subtitle && <div className="mt-0.5 text-[10px] text-slate-400 truncate">{subtitle}</div>}
    </div>
  );
}

function DataLine({
  label,
  value,
  multiline,
  highlight,
}: {
  label: string;
  value: string;
  multiline?: boolean;
  highlight?: boolean;
}) {
  return (
    <div className="flex items-start justify-between gap-3 px-3 py-2 text-sm">
      <span className="text-[11px] font-medium uppercase tracking-wider text-slate-500 pt-0.5 shrink-0">{label}</span>
      <span
        className={cn(
          'text-right text-slate-200',
          multiline && 'whitespace-pre-wrap text-left max-w-[60%]',
          highlight && 'font-semibold text-white'
        )}
      >
        {value}
      </span>
    </div>
  );
}

/* ---------------- Enviar / Reenviar correo desde el modal ---------------- */

const EMAIL_PROVIDER_KEY = 'pacifico:email-provider';
const PROVIDER_LABEL_MODAL: Record<EmailProvider, string> = {
  gmail: 'Gmail',
  outlook: 'Outlook',
  yahoo: 'Yahoo',
};

function EnviarCorreoSection({
  siniestro,
  remitente,
  onChanged,
}: {
  siniestro: Siniestro;
  remitente: Usuario | null;
  onChanged: () => void;
}) {
  const [open, setOpen] = useState(false);
  const [provider, setProvider] = useState<EmailProvider>('gmail');
  const [enviando, setEnviando] = useState(false);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const saved = localStorage.getItem(EMAIL_PROVIDER_KEY);
    if (saved === 'gmail' || saved === 'outlook' || saved === 'yahoo') setProvider(saved);
  }, []);

  function cambiarProvider(p: EmailProvider) {
    setProvider(p);
    if (typeof window !== 'undefined') localStorage.setItem(EMAIL_PROVIDER_KEY, p);
  }

  const censura = debeCensurar(remitente);
  const dest = getDestinatarios(siniestro, remitente);
  const asunto = buildAsunto(siniestro);
  // El correo real (para Pacífico) va sin censura; la vista previa que ve un
  // abogado externo se oculta por seguridad.
  const cuerpo = buildCuerpo(siniestro);
  const yaEnviado = siniestro.correo_enviado;
  const fechaEnvio = siniestro.correo_enviado_fecha
    ? formatFecha(siniestro.correo_enviado_fecha)
    : null;

  async function enviar() {
    setEnviando(true);
    const url = buildEmailUrl(siniestro, provider, remitente);
    window.open(url, '_blank', 'noopener');
    await supabase
      .from('siniestros')
      .update({
        correo_enviado: true,
        correo_enviado_fecha: new Date().toISOString(),
      })
      .eq('id', siniestro.id);
    setEnviando(false);
    onChanged();
  }

  return (
    <section className="rounded-lg border border-white/[0.08] bg-white/[0.02]">
      <button
        onClick={() => setOpen((v) => !v)}
        className="flex w-full items-center justify-between gap-2 px-3 py-2.5 text-left"
      >
        <span className="flex items-center gap-2">
          <svg className="h-4 w-4 text-slate-400" viewBox="0 0 20 20" fill="currentColor">
            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
          </svg>
          <span className="text-sm font-medium text-slate-200">
            {yaEnviado ? 'Reenviar correo de notificación' : 'Enviar correo de notificación'}
          </span>
          {yaEnviado && (
            <span className="inline-flex items-center gap-1 rounded-full bg-emerald-500/15 px-2 py-0.5 text-[10px] font-medium text-emerald-300">
              <svg className="h-2.5 w-2.5" viewBox="0 0 20 20" fill="currentColor">
                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
              </svg>
              Enviado
            </span>
          )}
        </span>
        <svg
          className={cn('h-3 w-3 text-slate-400 transition-transform', open && 'rotate-90')}
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path fillRule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.06 10 7.23 6.29a.75.75 0 111.04-1.08l4.39 4.25a.75.75 0 010 1.08l-4.39 4.25a.75.75 0 01-1.06-.02z" clipRule="evenodd" />
        </svg>
      </button>

      {open && (
        <div className="border-t border-white/[0.06] p-3 space-y-3 slide-in">
          {yaEnviado && fechaEnvio && (
            <div className="text-[11px] text-slate-500">
              Último envío: <span className="text-slate-300">{fechaEnvio}</span>
            </div>
          )}

          <div className="flex items-center justify-between gap-2 flex-wrap">
            <span className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-500">
              Cliente
            </span>
            <div className="inline-flex rounded-md bg-white/[0.04] border border-white/[0.06] p-0.5">
              <button
                onClick={() => cambiarProvider('gmail')}
                className={cn(
                  'rounded px-2 py-0.5 text-[11px] font-medium transition',
                  provider === 'gmail' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
                )}
              >
                Gmail
              </button>
              <button
                onClick={() => cambiarProvider('outlook')}
                className={cn(
                  'rounded px-2 py-0.5 text-[11px] font-medium transition',
                  provider === 'outlook' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
                )}
              >
                Outlook
              </button>
              <button
                onClick={() => cambiarProvider('yahoo')}
                className={cn(
                  'rounded px-2 py-0.5 text-[11px] font-medium transition',
                  provider === 'yahoo' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
                )}
              >
                Yahoo
              </button>
            </div>
          </div>

          <div className="rounded-md bg-white/[0.02] border border-white/[0.05] divide-y divide-white/[0.04] text-xs">
            <ModalRow label="Para">
              <ModalChipList items={dest.to} />
            </ModalRow>
            <ModalRow label="CC">
              <ModalChipList items={dest.cc} />
            </ModalRow>
            <ModalRow label="Asunto">
              <span className="text-slate-200">{asunto}</span>
            </ModalRow>
            <ModalRow label="Cuerpo">
              {censura ? (
                <span className="text-[11px] text-slate-500 italic">
                  Contenido oculto por seguridad. El correo se enviará completo a Pacífico.
                </span>
              ) : (
              <pre className="whitespace-pre-wrap text-slate-300 text-[11px] font-sans leading-relaxed max-h-40 overflow-y-auto">
                {cuerpo}
              </pre>
              )}
            </ModalRow>
          </div>

          <button
            onClick={enviar}
            disabled={enviando}
            className="w-full inline-flex items-center justify-center gap-1.5 rounded-lg border border-cyan-500/50 bg-cyan-500/20 px-3 py-2 text-sm font-semibold text-cyan-300 hover:bg-cyan-500/30 transition disabled:opacity-50"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M2.94 6.412A2 2 0 002 8.108V16a2 2 0 002 2h12a2 2 0 002-2V8.108a2 2 0 00-.94-1.696l-6-3.75a2 2 0 00-2.12 0l-6 3.75z" />
            </svg>
            {enviando ? 'Abriendo…' : `Abrir ${PROVIDER_LABEL_MODAL[provider]} y enviar`}
          </button>
        </div>
      )}
    </section>
  );
}

/* ---------------- Recordatorio de gestión (abogados/admin) ---------------- */

function RecordatorioSection({
  siniestro,
  remitente,
  diasTotales,
  diasEnEtapa,
}: {
  siniestro: Siniestro;
  remitente: Usuario | null;
  diasTotales: number;
  diasEnEtapa: number;
}) {
  const [open, setOpen] = useState(false);
  const [provider, setProvider] = useState<EmailProvider>('gmail');

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const saved = localStorage.getItem(EMAIL_PROVIDER_KEY);
    if (saved === 'gmail' || saved === 'outlook' || saved === 'yahoo') setProvider(saved);
  }, []);

  const contenido = buildEmailRecordatorio(siniestro, diasTotales, diasEnEtapa, remitente);

  function enviar() {
    window.open(buildComposeUrl(provider, contenido), '_blank', 'noopener');
  }

  return (
    <section className="rounded-lg border border-amber-500/20 bg-amber-500/[0.04]">
      <button
        onClick={() => setOpen((v) => !v)}
        className="flex w-full items-center justify-between gap-2 px-3 py-2.5 text-left"
      >
        <span className="flex items-center gap-2">
          <svg className="h-4 w-4 text-amber-300" viewBox="0 0 20 20" fill="currentColor">
            <path fillRule="evenodd" d="M10 2a6 6 0 00-6 6c0 1.887-.454 3.665-1.257 5.234a.75.75 0 00.515 1.076 32.91 32.91 0 003.256.508 3.5 3.5 0 006.972 0 32.903 32.903 0 003.256-.508.75.75 0 00.515-1.076A11.448 11.448 0 0116 8a6 6 0 00-6-6zM8.05 14.943a33.54 33.54 0 003.9 0 2 2 0 01-3.9 0z" clipRule="evenodd" />
          </svg>
          <span className="text-sm font-medium text-slate-200">Enviar recordatorio de gestión</span>
          <span className="rounded-full bg-amber-500/15 px-2 py-0.5 text-[10px] font-medium text-amber-300 tabular-nums">
            {diasTotales}d abierto · {diasEnEtapa}d en etapa
          </span>
        </span>
        <svg
          className={cn('h-3 w-3 text-slate-400 transition-transform', open && 'rotate-90')}
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path fillRule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.06 10 7.23 6.29a.75.75 0 111.04-1.08l4.39 4.25a.75.75 0 010 1.08l-4.39 4.25a.75.75 0 01-1.06-.02z" clipRule="evenodd" />
        </svg>
      </button>

      {open && (
        <div className="border-t border-white/[0.06] p-3 space-y-3 slide-in">
          <p className="text-[11px] text-slate-400">
            Envía un correo a Pacífico pidiendo que se gestione{' '}
            {siniestro.tipo === 'deducible' ? 'el cobro del deducible' : 'el pago'}, indicando los
            días hábiles acumulados.
          </p>
          <div className="rounded-md bg-white/[0.02] border border-white/[0.05] divide-y divide-white/[0.04] text-xs">
            <ModalRow label="Para">
              <ModalChipList items={contenido.to} />
            </ModalRow>
            <ModalRow label="CC">
              <ModalChipList items={contenido.cc} />
            </ModalRow>
            <ModalRow label="Asunto">
              <span className="text-slate-200">{contenido.subject}</span>
            </ModalRow>
            <ModalRow label="Cuerpo">
              <pre className="whitespace-pre-wrap text-slate-300 text-[11px] font-sans leading-relaxed max-h-40 overflow-y-auto">
                {contenido.body}
              </pre>
            </ModalRow>
          </div>
          <button
            onClick={enviar}
            className="w-full inline-flex items-center justify-center gap-1.5 rounded-lg border border-amber-500/50 bg-amber-500/15 px-3 py-2 text-sm font-semibold text-amber-200 hover:bg-amber-500/25 transition"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M2.94 6.412A2 2 0 002 8.108V16a2 2 0 002 2h12a2 2 0 002-2V8.108a2 2 0 00-.94-1.696l-6-3.75a2 2 0 00-2.12 0l-6 3.75z" />
            </svg>
            Abrir {PROVIDER_LABEL_MODAL[provider]} y enviar recordatorio
          </button>
        </div>
      )}
    </section>
  );
}

function MonedaPill({ active, onClick, children }: { active: boolean; onClick: () => void; children: React.ReactNode }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={cn(
        'rounded px-2 py-0.5 text-[11px] font-medium transition',
        active ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
      )}
    >
      {children}
    </button>
  );
}

function ModalRow({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="px-2.5 py-1.5 grid grid-cols-[60px_1fr] gap-2 items-start">
      <div className="text-[9px] font-semibold uppercase tracking-wider text-slate-500 pt-0.5">{label}</div>
      <div className="min-w-0">{children}</div>
    </div>
  );
}

function ModalChipList({ items }: { items: string[] }) {
  if (items.length === 0) return <span className="text-slate-500">—</span>;
  return (
    <div className="flex flex-wrap gap-1">
      {items.map((it) => (
        <span
          key={it}
          className="inline-flex rounded-sm bg-white/[0.04] border border-white/[0.06] px-1.5 py-0.5 text-[10px] text-slate-300"
        >
          {it}
        </span>
      ))}
    </div>
  );
}
