'use client';

import { useEffect, useRef, useState } from 'react';
import { useRouter } from 'next/navigation';
import type { Siniestro, SiniestroMovimiento } from '@/lib/types';
import { supabase, STORAGE_BUCKET } from '@/lib/supabase';
import { useUser } from './UserContext';
import { Button } from './ui/Button';
import { Textarea, Input } from './ui/Input';
import { cn, colorPorDias, diasDesde, formatFecha, formatMoneda } from '@/lib/utils';
import {
  puedeBorrarPDF,
  puedeBorrarSiniestro,
  puedeEditarCampos,
  puedeSubirPDF,
} from '@/lib/permissions';
import { esEtapaFinal } from '@/lib/workflows';

interface Props {
  siniestro: Siniestro;
  movimientos: SiniestroMovimiento[];
  onClose: () => void;
  onChanged: () => void;
}

/** Gradient del header por tipo */
const accentByTipo: Record<Siniestro['tipo'], string> = {
  pago:      'from-cyan-700 via-cyan-600 to-cyan-500',
  deducible: 'from-amber-700 via-amber-600 to-amber-500',
  reembolso: 'from-violet-700 via-violet-600 to-violet-500',
};

const tipoLabel: Record<Siniestro['tipo'], string> = {
  pago: 'Pago',
  reembolso: 'Reembolso',
  deducible: 'Deducible',
};

const dotByColor: Record<'verde' | 'amarillo' | 'rojo', string> = {
  verde: 'bg-emerald-400',
  amarillo: 'bg-amber-400',
  rojo: 'bg-red-400',
};

const PencilIcon = ({ className = 'h-3.5 w-3.5' }: { className?: string }) => (
  <svg className={className} viewBox="0 0 20 20" fill="currentColor">
    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z" />
  </svg>
);

export function SiniestroModal({ siniestro, movimientos, onClose, onChanged }: Props) {
  const { usuario } = useUser();
  const router = useRouter();
  const [editMode, setEditMode] = useState(false);
  const [notas, setNotas] = useState(siniestro.notas ?? '');
  const [monto, setMonto] = useState<string>(siniestro.monto?.toString() ?? '');
  const [aseguradoNombre, setAseguradoNombre] = useState(siniestro.asegurado_nombre ?? '');
  const [dniTercero, setDniTercero] = useState(siniestro.dni_tercero ?? '');
  const [correoAsegurado, setCorreoAsegurado] = useState(siniestro.correo_asegurado ?? '');
  const [guardando, setGuardando] = useState(false);
  const [subiendo, setSubiendo] = useState(false);
  const [confirmandoBorrado, setConfirmandoBorrado] = useState(false);
  const [verHistorial, setVerHistorial] = useState(false);
  const fileRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    setNotas(siniestro.notas ?? '');
    setMonto(siniestro.monto?.toString() ?? '');
    setAseguradoNombre(siniestro.asegurado_nombre ?? '');
    setDniTercero(siniestro.dni_tercero ?? '');
    setCorreoAsegurado(siniestro.correo_asegurado ?? '');
    setEditMode(false);
    setConfirmandoBorrado(false);
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
  const canUpload = puedeSubirPDF(usuario, siniestro);
  const canDelete = puedeBorrarPDF(usuario, siniestro);
  const canDeleteSiniestro = puedeBorrarSiniestro(usuario);
  const isFinal = esEtapaFinal(siniestro.tipo, siniestro.estado);
  const puedeMoverEnGeneral = usuario?.rol === 'admin' || usuario?.rol === 'terceros';

  const diasAbierto = diasDesde(siniestro.created_at);
  const diasEnEtapaActual = (() => {
    const ult = [...movimientos].reverse().find((m) => m.estado_nuevo === siniestro.estado);
    return diasDesde(ult?.timestamp ?? siniestro.created_at);
  })();
  const colorEtapa = colorPorDias(diasEnEtapaActual);

  async function guardarCampos() {
    if (!canEdit) return;
    setGuardando(true);
    const updates: Partial<Siniestro> = {
      notas: notas || null,
      monto: monto ? Number(monto) : null,
      asegurado_nombre: aseguradoNombre || null,
    };
    if (siniestro.tipo !== 'deducible') updates.dni_tercero = dniTercero || null;
    else updates.correo_asegurado = correoAsegurado || null;

    const { error } = await supabase.from('siniestros').update(updates).eq('id', siniestro.id);
    setGuardando(false);
    if (error) { alert('Error: ' + error.message); return; }
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

  return (
    <div className="fixed inset-0 z-40 flex justify-end bg-black/60 backdrop-blur-sm fade-in" onClick={onClose}>
      <aside
        className="h-full w-full max-w-xl overflow-y-auto bg-white shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header compacto con accent por tipo */}
        <div className={cn('bg-gradient-to-br px-5 py-4 text-white relative', accentByTipo[siniestro.tipo])}>
          <button
            onClick={onClose}
            className="absolute top-3 right-3 rounded-full p-1.5 text-white/80 hover:bg-white/15 hover:text-white"
            aria-label="Cerrar"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>

          <div className="text-[10px] font-semibold uppercase tracking-[0.16em] text-white/75">
            {tipoLabel[siniestro.tipo]}
          </div>
          {/* Número siniestro: 1.5rem en vez de 3xl */}
          <h2 className="mt-0.5 font-mono text-2xl font-bold tracking-tight leading-tight">
            {siniestro.codigo}
          </h2>

          {/* Fila compacta de métricas */}
          <div className="mt-4 grid grid-cols-3 gap-3">
            <Metric
              label="Tiempo abierto"
              value={`${diasAbierto}d`}
              subtitle={isFinal && siniestro.closed_at ? `Cerrado hace ${diasDesde(siniestro.closed_at)}d` : undefined}
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

          <div className="mt-3 text-[11px] text-white/75">
            Creado {formatFecha(siniestro.created_at)} por <strong className="text-white">{siniestro.solicitante}</strong>
          </div>
        </div>

        <div className="space-y-5 px-5 py-5 bg-white text-slate-800">
          {/* Tip drag — texto pequeño muted, no banner */}
          {puedeMoverEnGeneral && !isFinal && (
            <p className="text-[11px] text-slate-400 -mt-1">
              Tip: arrastra la tarjeta entre columnas del tablero para mover de etapa.
            </p>
          )}

          {/* Datos */}
          <section>
            <div className="flex items-center justify-between mb-2.5">
              <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-500">Datos</h3>
              {canEdit && !editMode && (
                <button
                  onClick={() => setEditMode(true)}
                  className="grid h-7 w-7 place-items-center rounded-md text-slate-400 hover:text-slate-700 hover:bg-slate-100 transition"
                  title="Editar"
                >
                  <PencilIcon />
                </button>
              )}
              {editMode && (
                <div className="flex gap-1.5">
                  <Button variant="outline" size="sm" onClick={() => { setEditMode(false); setNotas(siniestro.notas ?? ''); }}>
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
                <div className="grid grid-cols-2 gap-3">
                  <Input
                    label="Monto"
                    type="number"
                    step="0.01"
                    value={monto}
                    onChange={(e) => setMonto(e.target.value)}
                  />
                  <Input
                    label="Asegurado / tercero"
                    value={aseguradoNombre}
                    onChange={(e) => setAseguradoNombre(e.target.value)}
                  />
                  {siniestro.tipo !== 'deducible' ? (
                    <Input label="DNI" value={dniTercero} onChange={(e) => setDniTercero(e.target.value)} />
                  ) : (
                    <Input label="Correo" type="email" value={correoAsegurado} onChange={(e) => setCorreoAsegurado(e.target.value)} />
                  )}
                </div>
                <Textarea label="Notas" value={notas} onChange={(e) => setNotas(e.target.value)} rows={3} />
              </div>
            ) : (
              <div className="rounded-lg border border-slate-200 divide-y divide-slate-100">
                <DataLine label="Monto" value={formatMoneda(siniestro.monto)} highlight />
                <DataLine label="Asegurado / tercero" value={siniestro.asegurado_nombre ?? '—'} />
                {siniestro.tipo !== 'deducible' ? (
                  <DataLine label="DNI" value={siniestro.dni_tercero ?? '—'} />
                ) : (
                  <DataLine label="Correo" value={siniestro.correo_asegurado ?? '—'} />
                )}
                <DataLine label="Solicitante" value={siniestro.solicitante} />
                {siniestro.notas && <DataLine label="Notas" value={siniestro.notas} multiline />}
              </div>
            )}
          </section>

          {/* PDFs */}
          <section>
            <div className="flex items-center justify-between mb-2">
              <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-500">
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
                  <span className="inline-flex items-center gap-1 rounded-md bg-slate-900 px-2.5 py-1 text-[11px] font-medium text-white hover:bg-slate-800 transition">
                    {subiendo ? 'Subiendo…' : '+ Adjuntar'}
                  </span>
                </label>
              )}
            </div>
            {siniestro.pdf_urls.length === 0 ? (
              <p className="text-xs text-slate-400">Sin archivos.</p>
            ) : (
              <div className="flex flex-wrap gap-1.5">
                {siniestro.pdf_urls.map((url) => {
                  const name = decodeURIComponent(url.split('/').pop() ?? 'archivo.pdf').replace(/^\d+-/, '');
                  return (
                    <div
                      key={url}
                      className="group inline-flex items-center gap-1.5 rounded-md border border-slate-200 bg-slate-50 pl-2 pr-1 py-1 text-xs"
                    >
                      <svg className="h-3.5 w-3.5 text-red-500 shrink-0" viewBox="0 0 20 20" fill="currentColor">
                        <path fillRule="evenodd" d="M4 4a2 2 0 012-2h6.586A2 2 0 0114 2.586L17.414 6A2 2 0 0118 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4z" clipRule="evenodd" />
                      </svg>
                      <a
                        href={url}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="text-slate-700 hover:text-pacifico-primary hover:underline max-w-[180px] truncate"
                      >
                        {name}
                      </a>
                      {canDelete && (
                        <button
                          onClick={() => eliminarPDF(url)}
                          className="ml-1 rounded p-0.5 text-slate-300 hover:bg-red-100 hover:text-red-600 transition"
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

          {/* Historial — colapsado por defecto */}
          {movimientos.length > 0 && (
            <section>
              <button
                onClick={() => setVerHistorial((v) => !v)}
                className="flex items-center gap-1.5 text-[11px] font-medium text-slate-500 hover:text-slate-800 transition"
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
                <ol className="mt-3 relative space-y-2 border-l-2 border-slate-200 pl-4 slide-in">
                  {movimientos.map((m) => (
                    <li key={m.id} className="relative">
                      <span className="absolute -left-[22px] top-1 grid h-3 w-3 place-items-center rounded-full bg-white border-2 border-slate-400">
                        <span className="h-1 w-1 rounded-full bg-slate-400" />
                      </span>
                      <div className="text-xs">
                        <div className="text-slate-700">
                          {m.estado_anterior ? (
                            <>
                              <span className="text-slate-400">{m.estado_anterior}</span>
                              <span className="mx-1 text-slate-300">→</span>
                            </>
                          ) : (
                            <span className="text-slate-400">Creado · </span>
                          )}
                          <span className="font-medium">{m.estado_nuevo}</span>
                        </div>
                        <div className="text-[11px] text-slate-400">
                          {m.movido_por} · {formatFecha(m.timestamp)}
                        </div>
                        {m.notas && (
                          <div className="mt-1 rounded bg-slate-50 px-2 py-1 text-[11px] text-slate-600">
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

          {/* Zona peligrosa (admin) */}
          {canDeleteSiniestro && (
            <section className="rounded-lg border border-red-200 bg-red-50/60 p-3">
              {!confirmandoBorrado ? (
                <button
                  onClick={() => setConfirmandoBorrado(true)}
                  className="inline-flex items-center gap-1.5 text-xs font-medium text-red-700 hover:underline"
                >
                  <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
                    <path fillRule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9z" clipRule="evenodd" />
                  </svg>
                  Eliminar siniestro
                </button>
              ) : (
                <div className="space-y-2">
                  <p className="text-xs text-red-800">
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
      <div className="text-[10px] font-medium uppercase tracking-[0.10em] text-white/70">{label}</div>
      <div className="mt-0.5 text-[15px] font-semibold leading-tight">{value}</div>
      {subtitle && <div className="mt-0.5 text-[10px] text-white/70 truncate">{subtitle}</div>}
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
          'text-right text-slate-800',
          multiline && 'whitespace-pre-wrap text-left max-w-[60%]',
          highlight && 'font-semibold text-slate-900'
        )}
      >
        {value}
      </span>
    </div>
  );
}
