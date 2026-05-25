'use client';

import { FormEvent, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase, STORAGE_BUCKET } from '@/lib/supabase';
import { useUser } from './UserContext';
import type { TipoSiniestro, Usuario } from '@/lib/types';
import { cn, validarCodigo } from '@/lib/utils';
import { getResponsableDeEtapa } from '@/lib/workflows';
import { puedeCrearSiniestro } from '@/lib/permissions';

const TIPOS: {
  id: TipoSiniestro;
  label: string;
  descripcion: string;
}[] = [
  { id: 'pago', label: 'Pago', descripcion: 'Al asegurado o tercero' },
  { id: 'deducible', label: 'Deducible', descripcion: 'Cobro al asegurado' },
  { id: 'reembolso', label: 'Reembolso', descripcion: 'Reembolso de gastos' },
];

/** Estilos del selector cuando está activo (tinte sutil del accent del tipo) */
const tipoActiveStyle: Record<TipoSiniestro, string> = {
  pago:      'bg-[rgba(6,182,212,0.15)]  border-[rgba(6,182,212,0.4)]  text-[#22d3ee]',
  deducible: 'bg-[rgba(245,158,11,0.15)] border-[rgba(245,158,11,0.4)] text-[#fbbf24]',
  reembolso: 'bg-[rgba(139,92,246,0.15)] border-[rgba(139,92,246,0.4)] text-[#a78bfa]',
};

/** Estilos del botón "Crear" — ghost tintado por tipo */
const submitStyle: Record<TipoSiniestro, string> = {
  pago:      'bg-[rgba(6,182,212,0.18)]  border-[rgba(6,182,212,0.5)]  text-[#22d3ee] hover:bg-[rgba(6,182,212,0.30)]',
  deducible: 'bg-[rgba(245,158,11,0.18)] border-[rgba(245,158,11,0.5)] text-[#fbbf24] hover:bg-[rgba(245,158,11,0.30)]',
  reembolso: 'bg-[rgba(139,92,246,0.18)] border-[rgba(139,92,246,0.5)] text-[#a78bfa] hover:bg-[rgba(139,92,246,0.30)]',
};

/** Color del focus border del input según tipo */
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

    if (files.length > 0) {
      const urls: string[] = [];
      for (const f of files) {
        const path = `${created.id}/${Date.now()}-${f.name.replace(/[^\w.\-]/g, '_')}`;
        const { error: upErr } = await supabase.storage.from(STORAGE_BUCKET).upload(path, f, {
          contentType: f.type || 'application/pdf',
        });
        if (upErr) { console.error(upErr); continue; }
        const { data } = supabase.storage.from(STORAGE_BUCKET).getPublicUrl(path);
        urls.push(data.publicUrl);
      }
      if (urls.length > 0) {
        await supabase.from('siniestros').update({ pdf_urls: urls }).eq('id', created.id);
      }
    }

    if (responsable && responsable !== solicitante) {
      await supabase.from('notificaciones').insert({
        usuario_destino: responsable,
        mensaje: `Nuevo siniestro ${codigo} (${tipo})`,
        siniestro_id: created.id,
      });
    }

    router.push('/');
    router.refresh();
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
        <Field label="Correo del asegurado">
          <input
            type="email"
            value={correoAsegurado}
            onChange={(e) => setCorreoAsegurado(e.target.value)}
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
          <label
            className="inline-flex cursor-pointer items-center gap-1.5 rounded-lg border border-white/[0.08] bg-card px-3 py-1.5 text-xs font-medium text-slate-300 hover:bg-card-hover hover:text-white transition"
          >
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
              <li
                key={f.name}
                className="inline-flex items-center gap-1.5 rounded-md border border-white/[0.06] bg-card px-2 py-1 text-[11px] text-slate-300"
              >
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
