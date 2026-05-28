'use client';

import { FormEvent, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase, STORAGE_BUCKET } from '@/lib/supabase';
import { useUser } from './UserContext';
import type { Siniestro, TipoSiniestro, Usuario } from '@/lib/types';
import { cn, validarCodigo } from '@/lib/utils';
import { getResponsableDeEtapa } from '@/lib/workflows';
import { puedeCrearSiniestro } from '@/lib/permissions';
import { buildAsunto, buildCuerpo, buildMailtoUrl, getDestinatarios } from '@/lib/email';

const TIPOS: {
  id: TipoSiniestro;
  label: string;
  descripcion: string;
}[] = [
  { id: 'pago', label: 'Pago', descripcion: 'Al asegurado o tercero' },
  { id: 'deducible', label: 'Deducible', descripcion: 'Cobro al asegurado' },
  { id: 'reembolso', label: 'Reembolso', descripcion: 'Reembolso de gastos' },
];

const tipoActiveStyle: Record<TipoSiniestro, string> = {
  pago:      'bg-[rgba(6,182,212,0.15)]  border-[rgba(6,182,212,0.4)]  text-[#22d3ee]',
  deducible: 'bg-[rgba(245,158,11,0.15)] border-[rgba(245,158,11,0.4)] text-[#fbbf24]',
  reembolso: 'bg-[rgba(139,92,246,0.15)] border-[rgba(139,92,246,0.4)] text-[#a78bfa]',
};

const submitStyle: Record<TipoSiniestro, string> = {
  pago:      'bg-[rgba(6,182,212,0.18)]  border-[rgba(6,182,212,0.5)]  text-[#22d3ee] hover:bg-[rgba(6,182,212,0.30)]',
  deducible: 'bg-[rgba(245,158,11,0.18)] border-[rgba(245,158,11,0.5)] text-[#fbbf24] hover:bg-[rgba(245,158,11,0.30)]',
  reembolso: 'bg-[rgba(139,92,246,0.18)] border-[rgba(139,92,246,0.5)] text-[#a78bfa] hover:bg-[rgba(139,92,246,0.30)]',
};

const inputFocusStyle: Record<TipoSiniestro, string> = {
  pago:      'focus:border-[#06b6d4]',
  deducible: 'focus:border-[#f59e0b]',
  reembolso: 'focus:border-[#8b5cf6]',
};

const baseInput =
  'w-full rounded-lg bg-card border border-white/[0.06] px-3 py-2 text-sm text-slate-200 placeholder:text-slate-500 transition focus:outline-none focus:bg-card-hover';

interface Props {
  abogados: Usuario[];
}

export function SiniestroForm({ abogados }: Props) {
  const router = useRouter();
  const { usuario } = useUser();
  const [tipo, setTipo] = useState<TipoSiniestro>('pago');
  const [codigo, setCodigo] = useState('');
  const [monto, setMonto] = useState('');
  const [aseguradoNombre, setAseguradoNombre] = useState('');
  const [dniTercero, setDniTercero] = useState('');
  const [correoAsegurado, setCorreoAsegurado] = useState('');
  const [solicitanteOverride, setSolicitanteOverride] = useState('');
  const [agregarNota, setAgregarNota] = useState(false);
  const [notas, setNotas] = useState('');
  const [files, setFiles] = useState<File[]>([]);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  /** Cuando se crea exitosamente, mostramos la confirmación con preview del correo */
  const [creado, setCreado] = useState<Siniestro | null>(null);

  if (!puedeCrearSiniestro(usuario)) {
    return (
      <div className="rounded-xl border border-amber-500/30 bg-amber-500/10 p-4 text-sm text-amber-200">
        Tu rol actual no tiene permisos para crear siniestros.
      </div>
    );
  }

  const solicitante = solicitanteOverride || usuario!.nombre;
  const focusClass = inputFocusStyle[tipo];

  function validar(): string | null {
    if (!validarCodigo(codigo)) return 'El código debe tener exactamente 8 o 10 dígitos numéricos.';
    if (!monto || isNaN(Number(monto)) || Number(monto) <= 0) return 'Ingresa un monto válido mayor a 0.';
    if (tipo === 'deducible') {
      if (!aseguradoNombre.trim()) return 'Indica el nombre del asegurado.';
      if (!correoAsegurado.trim()) return 'Indica el correo del asegurado.';
    } else {
      if (!aseguradoNombre.trim()) return 'Indica el nombre del tercero.';
      if (!dniTercero.trim()) return 'Indica el DNI del tercero.';
    }
    return null;
  }

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    const v = validar();
    if (v) { setError(v); return; }
    setSubmitting(true);

    const estadoInicial = 'Solicitud recibida';
    const responsable = getResponsableDeEtapa(tipo, estadoInicial, { codigo });

    const payload = {
      codigo,
      tipo,
      estado: estadoInicial,
      monto: Number(monto),
      solicitante,
      asegurado_nombre: aseguradoNombre,
      dni_tercero: tipo !== 'deducible' ? dniTercero : null,
      correo_asegurado: tipo === 'deducible' ? correoAsegurado : null,
      notas: agregarNota && notas ? notas : null,
      asignado_a: responsable,
    };

    const { data: created, error: insErr } = await supabase
      .from('siniestros').insert(payload).select().single();

    if (insErr || !created) {
      setSubmitting(false);
      setError('Error al crear: ' + (insErr?.message ?? 'desconocido'));
      return;
    }

    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: created.id,
      estado_anterior: null,
      estado_nuevo: estadoInicial,
      movido_por: solicitante,
      notas: 'Creación de siniestro',
    });

    let pdfUrls: string[] = [];
    if (files.length > 0) {
      for (const f of files) {
        const path = `${created.id}/${Date.now()}-${f.name.replace(/[^\w.\-]/g, '_')}`;
        const { error: upErr } = await supabase.storage.from(STORAGE_BUCKET).upload(path, f, {
          contentType: f.type || 'application/pdf',
        });
        if (upErr) { console.error(upErr); continue; }
        const { data } = supabase.storage.from(STORAGE_BUCKET).getPublicUrl(path);
        pdfUrls.push(data.publicUrl);
      }
      if (pdfUrls.length > 0) {
        await supabase.from('siniestros').update({ pdf_urls: pdfUrls }).eq('id', created.id);
      }
    }

    if (responsable && responsable !== solicitante) {
      await supabase.from('notificaciones').insert({
        usuario_destino: responsable,
        mensaje: `Nuevo siniestro ${codigo} (${tipo})`,
        siniestro_id: created.id,
      });
    }

    setSubmitting(false);
    setCreado({ ...(created as Siniestro), pdf_urls: pdfUrls });
  }

  // -------- Vista de confirmación post-creación --------
  if (creado) {
    return (
      <ConfirmacionCorreo
        siniestro={creado}
        onCerrar={() => {
          router.push('/');
          router.refresh();
        }}
      />
    );
  }

  return (
    <form onSubmit={onSubmit} className="space-y-5">
      {/* Tipo de siniestro */}
      <div>
        <Label>Tipo de siniestro</Label>
        <div className="grid grid-cols-3 gap-2">
          {TIPOS.map((t) => {
            const active = tipo === t.id;
            return (
              <button
                type="button"
                key={t.id}
                onClick={() => setTipo(t.id)}
                className={cn(
                  'rounded-lg border px-3 py-2.5 text-left transition',
                  active
                    ? tipoActiveStyle[t.id]
                    : 'bg-card border-white/[0.06] text-slate-400 hover:bg-card-hover hover:text-slate-200'
                )}
              >
                <div className={cn('text-sm font-semibold', active ? 'text-current' : 'text-slate-200')}>
                  {t.label}
                </div>
                <div className="text-[11px] mt-0.5 opacity-70">
                  {t.descripcion}
                </div>
              </button>
            );
          })}
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <Field
          label="Código del siniestro"
          hint="Solo números. 8 dígitos → Christian. 10 dígitos → Jack."
        >
          <input
            type="text"
            value={codigo}
            onChange={(e) => setCodigo(e.target.value.replace(/\D/g, ''))}
            placeholder="8 o 10 dígitos"
            maxLength={10}
            inputMode="numeric"
            className={cn(baseInput, focusClass, 'font-mono tabular-nums')}
          />
        </Field>
        <Field label="Monto (PEN)">
          <input
            type="number"
            step="0.01"
            value={monto}
            onChange={(e) => setMonto(e.target.value)}
            placeholder="0.00"
            inputMode="decimal"
            className={cn(baseInput, focusClass)}
          />
        </Field>
      </div>

      <Field label={tipo === 'deducible' ? 'Nombre del asegurado' : 'Nombre del tercero / asegurado'}>
        <input
          type="text"
          value={aseguradoNombre}
          onChange={(e) => setAseguradoNombre(e.target.value)}
          className={cn(baseInput, focusClass)}
        />
      </Field>

      {tipo === 'deducible' ? (
        <Field label="Correo del asegurado" hint="A este correo se enviará el cobro del deducible.">
          <input
            type="email"
            value={correoAsegurado}
            onChange={(e) => setCorreoAsegurado(e.target.value)}
            placeholder="correo@ejemplo.com"
            inputMode="email"
            autoComplete="email"
            className={cn(baseInput, focusClass)}
          />
        </Field>
      ) : (
        <Field label="DNI del tercero">
          <input
            type="text"
            value={dniTercero}
            onChange={(e) => setDniTercero(e.target.value)}
            maxLength={12}
            inputMode="numeric"
            className={cn(baseInput, focusClass)}
          />
        </Field>
      )}

      {usuario?.rol === 'admin' && abogados.length > 0 && (
        <Field label="Abogado solicitante">
          <select
            value={solicitanteOverride}
            onChange={(e) => setSolicitanteOverride(e.target.value)}
            className={cn(baseInput, focusClass)}
          >
            <option value="" className="bg-card">— Yo ({usuario.nombre}) —</option>
            {abogados.map((a) => (
              <option key={a.id} value={a.nombre} className="bg-card">
                {a.nombre}{a.estudio ? ` — ${a.estudio}` : ''}
              </option>
            ))}
          </select>
        </Field>
      )}

      {/* Notas — toggle */}
      <div>
        <button
          type="button"
          onClick={() => setAgregarNota((v) => !v)}
          className={cn(
            'inline-flex items-center gap-1.5 rounded-lg border px-3 py-1.5 text-xs font-medium transition',
            agregarNota
              ? cn(tipoActiveStyle[tipo].split(' ').slice(0, 2).join(' '))
              : 'border-white/[0.08] bg-card text-slate-400 hover:text-slate-200 hover:bg-card-hover'
          )}
        >
          <svg
            className={cn('h-3.5 w-3.5 transition-transform', agregarNota ? 'rotate-45' : '')}
            viewBox="0 0 20 20"
            fill="currentColor"
          >
            <path d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" />
          </svg>
          {agregarNota ? 'Quitar nota' : 'Agregar nota (opcional)'}
        </button>
        {agregarNota && (
          <div className="mt-3 slide-in">
            <textarea
              value={notas}
              onChange={(e) => setNotas(e.target.value)}
              rows={3}
              placeholder="Contexto, instrucciones..."
              className={cn(baseInput, focusClass, 'resize-y')}
            />
          </div>
        )}
      </div>

      {/* PDFs */}
      <div>
        <Label>PDFs adjuntos (opcional)</Label>
        <div className="flex items-center gap-3">
          <label className="inline-flex cursor-pointer items-center gap-1.5 rounded-lg border border-white/[0.08] bg-card px-3 py-1.5 text-xs font-medium text-slate-300 hover:bg-card-hover hover:text-white transition">
            <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
              <path fillRule="evenodd" d="M4 4a2 2 0 012-2h6.586A2 2 0 0114 2.586L17.414 6A2 2 0 0118 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4z" clipRule="evenodd" />
            </svg>
            Elegir archivos
            <input
              type="file"
              accept="application/pdf"
              multiple
              onChange={(e) => setFiles(Array.from(e.target.files ?? []))}
              className="hidden"
            />
          </label>
          {files.length > 0 ? (
            <span className="text-xs text-slate-400">{files.length} {files.length === 1 ? 'archivo' : 'archivos'}</span>
          ) : (
            <span className="text-xs text-slate-500">Ningún archivo seleccionado</span>
          )}
        </div>
        {files.length > 0 && (
          <ul className="mt-2 flex flex-wrap gap-1.5">
            {files.map((f) => (
              <li key={f.name} className="inline-flex items-center gap-1.5 rounded-md border border-white/[0.06] bg-card px-2 py-1 text-[11px] text-slate-300">
                <svg className="h-3 w-3 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                  <path fillRule="evenodd" d="M4 4a2 2 0 012-2h6.586A2 2 0 0114 2.586L17.414 6A2 2 0 0118 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4z" clipRule="evenodd" />
                </svg>
                {f.name} <span className="text-slate-500">({(f.size / 1024).toFixed(0)} KB)</span>
              </li>
            ))}
          </ul>
        )}
      </div>

      {error && (
        <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-sm text-red-300">
          {error}
        </div>
      )}

      <div className="flex gap-2 pt-2">
        <button
          type="submit"
          disabled={submitting}
          className={cn(
            'inline-flex items-center justify-center rounded-lg border px-4 py-2 text-sm font-semibold transition disabled:opacity-50 disabled:cursor-not-allowed',
            submitStyle[tipo]
          )}
        >
          {submitting ? 'Creando…' : 'Crear siniestro'}
        </button>
        <button
          type="button"
          onClick={() => router.push('/')}
          className="inline-flex items-center justify-center rounded-lg border border-white/[0.08] bg-transparent px-4 py-2 text-sm font-medium text-slate-400 hover:bg-white/[0.03] hover:text-slate-200 transition"
        >
          Cancelar
        </button>
      </div>
    </form>
  );
}

/* ---------------- Vista de confirmación post-creación ---------------- */

function ConfirmacionCorreo({
  siniestro,
  onCerrar,
}: {
  siniestro: Siniestro;
  onCerrar: () => void;
}) {
  const [marcando, setMarcando] = useState(false);
  const dest = getDestinatarios(siniestro);
  const asunto = buildAsunto(siniestro);
  const cuerpo = buildCuerpo(siniestro);
  const mailto = buildMailtoUrl(siniestro);

  async function enviarCorreo() {
    setMarcando(true);
    // Abre el cliente de correo del usuario (Outlook / Gmail / Apple Mail)
    window.location.href = mailto;
    // Marcamos como enviado de forma optimista (el usuario debe presionar enviar en su mail)
    await supabase.from('siniestros').update({ correo_enviado: true }).eq('id', siniestro.id);
    setMarcando(false);
  }

  return (
    <div className="space-y-4">
      {/* Banner de éxito */}
      <div className="rounded-xl border border-emerald-500/30 bg-emerald-500/10 p-4 flex items-start gap-3">
        <svg className="h-5 w-5 shrink-0 text-emerald-400 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
        </svg>
        <div className="min-w-0 flex-1">
          <div className="text-sm font-semibold text-emerald-200">Siniestro creado</div>
          <div className="text-xs text-emerald-300/80 mt-0.5">
            Código <span className="font-mono">{siniestro.codigo}</span> · ya está en "Solicitud recibida".
          </div>
        </div>
      </div>

      {/* Preview del correo */}
      <div className="rounded-xl border border-white/[0.08] bg-panel p-4 space-y-3">
        <div>
          <div className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1">
            ¿Enviar correo de notificación?
          </div>
          <p className="text-xs text-slate-500">
            Se abrirá tu cliente de correo (Outlook / Gmail) con los destinatarios y el contenido prellenado.
            Solo necesitas presionar enviar.
          </p>
        </div>

        <div className="rounded-lg bg-card border border-white/[0.06] divide-y divide-white/[0.04] text-xs">
          <Row label="Para">
            <ChipList items={dest.to} />
          </Row>
          <Row label="CC">
            <ChipList items={dest.cc} />
          </Row>
          <Row label="Asunto">
            <span className="text-slate-200">{asunto}</span>
          </Row>
          <Row label="Cuerpo">
            <pre className="whitespace-pre-wrap text-slate-300 text-[11px] font-sans leading-relaxed max-h-48 overflow-y-auto">
              {cuerpo}
            </pre>
          </Row>
        </div>

        <div className="flex flex-wrap gap-2 pt-1">
          <button
            type="button"
            onClick={enviarCorreo}
            disabled={marcando}
            className="inline-flex items-center gap-1.5 rounded-lg border border-cyan-500/50 bg-cyan-500/20 px-4 py-2 text-sm font-semibold text-cyan-300 hover:bg-cyan-500/30 transition disabled:opacity-50"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M2.94 6.412A2 2 0 002 8.108V16a2 2 0 002 2h12a2 2 0 002-2V8.108a2 2 0 00-.94-1.696l-6-3.75a2 2 0 00-2.12 0l-6 3.75z" />
            </svg>
            Abrir correo y enviar
          </button>
          <button
            type="button"
            onClick={onCerrar}
            className="inline-flex items-center rounded-lg border border-white/[0.08] bg-transparent px-4 py-2 text-sm font-medium text-slate-400 hover:bg-white/[0.03] hover:text-slate-200 transition"
          >
            Omitir y volver al tablero
          </button>
        </div>
      </div>

      <p className="text-[11px] text-slate-500">
        Si presionas "Abrir correo y enviar", se marca el siniestro como notificado. Puedes
        re-enviar el correo en cualquier momento desde el detalle del siniestro.
      </p>
    </div>
  );
}

function Row({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="px-3 py-2 grid grid-cols-[80px_1fr] gap-3 items-start">
      <div className="text-[10px] font-semibold uppercase tracking-wider text-slate-500 pt-0.5">{label}</div>
      <div className="min-w-0">{children}</div>
    </div>
  );
}

function ChipList({ items }: { items: string[] }) {
  if (items.length === 0) return <span className="text-slate-500">—</span>;
  return (
    <div className="flex flex-wrap gap-1">
      {items.map((it) => (
        <span key={it} className="inline-flex rounded-md bg-white/[0.04] border border-white/[0.06] px-1.5 py-0.5 text-[11px] text-slate-300">
          {it}
        </span>
      ))}
    </div>
  );
}

/* ---------- Helpers ---------- */

function Label({ children }: { children: React.ReactNode }) {
  return (
    <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1.5">
      {children}
    </label>
  );
}

function Field({
  label,
  hint,
  children,
}: {
  label: string;
  hint?: string;
  children: React.ReactNode;
}) {
  return (
    <div>
      <Label>{label}</Label>
      {children}
      {hint && <p className="mt-1 text-[11px] text-slate-500">{hint}</p>}
    </div>
  );
}
