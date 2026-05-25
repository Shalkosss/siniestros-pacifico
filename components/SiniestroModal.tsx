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
  puedeArchivar,
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

/** Tinte sutil del header por tipo — alineado al dark del kanban */
const accentByTipo: Record<Siniestro['tipo'], string> = {
  pago:      'from-cyan-500/15 via-cyan-500/10 to-transparent border-b border-cyan-500/20',
  deducible: 'from-amber-500/15 via-amber-500/10 to-transparent border-b border-amber-500/20',
  reembolso: 'from-violet-500/15 via-violet-500/10 to-transparent border-b border-violet-500/20',
};

const accentTextByTipo: Record<Siniestro['tipo'], string> = {
  pago:      'text-cyan-300',
  deducible: 'text-amber-300',
  reembolso: 'text-violet-300',
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
  const [confirmandoArchivar, setConfirmandoArchivar] = useState(false);
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
  const canUpload = puedeSubirPDF(usuario, siniestro);
  const canDelete = puedeBorrarPDF(usuario, siniestro);
  const canDeleteSiniestro = puedeBorrarSiniestro(usuario);
  const canArchive = puedeArchivar(usuario);
  const isFinal = esEtapaFinal(siniestro.tipo, siniestro.estado);
  const isArchivado = !!siniestro.archived_at;
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

          <div className="mt-3 text-[11px] text-slate-400">
            Creado {formatFecha(siniestro.created_at)} por <strong className="text-slate-200">{siniestro.solicitante}</strong>
          </div>
        </div>

        <div className="space-y-5 px-5 py-5">
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
              <div className="rounded-lg border border-white/10 bg-white/[0.02] divide-y divide-white/5">
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
