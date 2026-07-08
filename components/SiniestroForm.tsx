'use client';

import { FormEvent, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase, STORAGE_BUCKET } from '@/lib/supabase';
import { useUser } from './UserContext';
import type { Moneda, Siniestro, TipoSiniestro, Usuario } from '@/lib/types';
import { cn, validarCodigo } from '@/lib/utils';
import { getResponsableDeEtapa } from '@/lib/workflows';
import { puedeCrearSiniestro } from '@/lib/permissions';
import {
  buildAsunto,
  buildCuerpo,
  buildEmailUrl,
  getDestinatarios,
  type EmailProvider,
} from '@/lib/email';

const EMAIL_PROVIDER_KEY = 'pacifico:email-provider';
const EMAIL_AUTOSEND_KEY = 'pacifico:email-autosend';

const PROVIDER_LABEL: Record<EmailProvider, string> = {
  gmail: 'Gmail',
  outlook: 'Outlook',
  yahoo: 'Yahoo',
};

const TIPOS: {
  id: TipoSiniestro;
  label: string;
  descripcion: string;
}[] = [
  { id: 'pago',         label: 'Pago',          descripcion: 'Al asegurado o tercero' },
  { id: 'deducible',    label: 'Deducible',     descripcion: 'Cobro al asegurado' },
  { id: 'valorizacion', label: 'Valorización',  descripcion: 'Valorización de daños' },
  { id: 'info_poliza',  label: 'Info Póliza',   descripcion: 'Consulta de póliza' },
  { id: 'reembolso',    label: 'Reembolso',     descripcion: 'Reembolso de gastos' },
];

const tipoActiveStyle: Record<TipoSiniestro, string> = {
  pago:         'bg-[rgba(6,182,212,0.15)]  border-[rgba(6,182,212,0.4)]  text-[#22d3ee]',
  deducible:    'bg-[rgba(245,158,11,0.15)] border-[rgba(245,158,11,0.4)] text-[#fbbf24]',
  valorizacion: 'bg-[rgba(16,185,129,0.15)] border-[rgba(16,185,129,0.4)] text-[#34d399]',
  info_poliza:  'bg-[rgba(236,72,153,0.15)] border-[rgba(236,72,153,0.4)] text-[#f472b6]',
  reembolso:    'bg-[rgba(139,92,246,0.15)] border-[rgba(139,92,246,0.4)] text-[#a78bfa]',
};

const submitStyle: Record<TipoSiniestro, string> = {
  pago:         'bg-[rgba(6,182,212,0.18)]  border-[rgba(6,182,212,0.5)]  text-[#22d3ee] hover:bg-[rgba(6,182,212,0.30)]',
  deducible:    'bg-[rgba(245,158,11,0.18)] border-[rgba(245,158,11,0.5)] text-[#fbbf24] hover:bg-[rgba(245,158,11,0.30)]',
  valorizacion: 'bg-[rgba(16,185,129,0.18)] border-[rgba(16,185,129,0.5)] text-[#34d399] hover:bg-[rgba(16,185,129,0.30)]',
  info_poliza:  'bg-[rgba(236,72,153,0.18)] border-[rgba(236,72,153,0.5)] text-[#f472b6] hover:bg-[rgba(236,72,153,0.30)]',
  reembolso:    'bg-[rgba(139,92,246,0.18)] border-[rgba(139,92,246,0.5)] text-[#a78bfa] hover:bg-[rgba(139,92,246,0.30)]',
};

const inputFocusStyle: Record<TipoSiniestro, string> = {
  pago:         'focus:border-[#06b6d4]',
  deducible:    'focus:border-[#f59e0b]',
  valorizacion: 'focus:border-[#10b981]',
  info_poliza:  'focus:border-[#ec4899]',
  reembolso:    'focus:border-[#8b5cf6]',
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
  const [moneda, setMoneda] = useState<Moneda>('PEN');
  const [aseguradoNombre, setAseguradoNombre] = useState('');
  const [dniTercero, setDniTercero] = useState('');
  const [correoAsegurado, setCorreoAsegurado] = useState('');
  // Cheque (sub-opción dentro de Pago)
  const [esCheque, setEsCheque] = useState(false);
  const [chequeBanco, setChequeBanco] = useState('');
  const [chequePersona, setChequePersona] = useState('');
  const [chequeDni, setChequeDni] = useState('');
  const [chequeDeduciblePagado, setChequeDeduciblePagado] = useState<boolean | null>(null);
  const [solicitanteOverride, setSolicitanteOverride] = useState('');
  const [agregarNota, setAgregarNota] = useState(false);
  const [notas, setNotas] = useState('');
  const [files, setFiles] = useState<File[]>([]);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  /** Cuando se crea exitosamente, mostramos la confirmación con preview del correo */
  const [creado, setCreado] = useState<Siniestro | null>(null);
  const [emailProvider, setEmailProvider] = useState<EmailProvider>('gmail');
  const [autoEnviar, setAutoEnviar] = useState(false);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const p = localStorage.getItem(EMAIL_PROVIDER_KEY);
    if (p === 'gmail' || p === 'outlook' || p === 'yahoo') setEmailProvider(p);
    setAutoEnviar(localStorage.getItem(EMAIL_AUTOSEND_KEY) === '1');
  }, []);

  useEffect(() => {
    if (typeof window !== 'undefined') localStorage.setItem(EMAIL_PROVIDER_KEY, emailProvider);
  }, [emailProvider]);
  useEffect(() => {
    if (typeof window !== 'undefined') localStorage.setItem(EMAIL_AUTOSEND_KEY, autoEnviar ? '1' : '0');
  }, [autoEnviar]);

  if (!puedeCrearSiniestro(usuario)) {
    return (
      <div className="rounded-xl border border-amber-500/30 bg-amber-500/10 p-4 text-sm text-amber-200">
        Tu rol actual no tiene permisos para crear siniestros.
      </div>
    );
  }

  const solicitante = solicitanteOverride || usuario!.nombre;
  const focusClass = inputFocusStyle[tipo];

  // Valorización e Info Póliza solo requieren el número de siniestro.
  const soloCodigo = tipo === 'valorizacion' || tipo === 'info_poliza';
  const puedeSerCheque = tipo === 'pago';

  function validar(): string | null {
    if (!validarCodigo(codigo)) return 'El código debe tener exactamente 8 o 10 dígitos numéricos.';
    if (soloCodigo) return null;
    if (!monto || isNaN(Number(monto)) || Number(monto) <= 0) return 'Ingresa un monto válido mayor a 0.';
    if (tipo === 'deducible') {
      if (!aseguradoNombre.trim()) return 'Indica el nombre del asegurado.';
      if (!correoAsegurado.trim()) return 'Indica el correo del asegurado.';
    } else {
      if (!aseguradoNombre.trim()) return 'Indica el nombre del tercero.';
      if (!dniTercero.trim()) return 'Indica el DNI del tercero.';
    }
    if (puedeSerCheque && esCheque) {
      if (!chequeBanco.trim()) return 'Indica el nombre del banco del cheque.';
      if (!chequePersona.trim()) return 'Indica la persona que recogerá el cheque.';
      if (!chequeDni.trim()) return 'Indica el DNI de quien recogerá el cheque.';
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

    const cheque = puedeSerCheque && esCheque;

    const payload = {
      codigo,
      tipo,
      estado: estadoInicial,
      monto: soloCodigo ? null : Number(monto),
      moneda: soloCodigo ? 'PEN' : moneda,
      solicitante,
      asegurado_nombre: soloCodigo ? null : aseguradoNombre,
      dni_tercero: !soloCodigo && tipo !== 'deducible' ? dniTercero : null,
      correo_asegurado: tipo === 'deducible' ? correoAsegurado : null,
      es_cheque: cheque,
      cheque_banco: cheque ? chequeBanco : null,
      cheque_persona: cheque ? chequePersona : null,
      cheque_dni: cheque ? chequeDni : null,
      cheque_deducible_pagado: cheque ? chequeDeduciblePagado : null,
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

    const siniestroFinal = { ...(created as Siniestro), pdf_urls: pdfUrls };

    if (autoEnviar) {
      // Dispara el cliente de correo y marca como enviado de inmediato.
      await supabase.from('siniestros').update({
        correo_enviado: true,
        correo_enviado_fecha: new Date().toISOString(),
      }).eq('id', siniestroFinal.id);
      const url = buildEmailUrl(siniestroFinal, emailProvider, usuario ?? null);
      // Nueva pestaña para Gmail/Outlook web — mailto se ignora window.open, pero ya no usamos mailto.
      window.open(url, '_blank', 'noopener');
      router.push('/');
      router.refresh();
      return;
    }

    setSubmitting(false);
    setCreado(siniestroFinal);
  }

  // -------- Vista de confirmación post-creación --------
  if (creado) {
    return (
      <ConfirmacionCorreo
        siniestro={creado}
        remitente={usuario ?? null}
        providerInicial={emailProvider}
        onCambioProvider={setEmailProvider}
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
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-2">
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
        {!soloCodigo && (
          <Field label="Monto">
            <div className="flex gap-2">
              <input
                type="number"
                step="0.01"
                value={monto}
                onChange={(e) => setMonto(e.target.value)}
                placeholder="0.00"
                inputMode="decimal"
                className={cn(baseInput, focusClass, 'flex-1')}
              />
              <div className="inline-flex rounded-lg bg-card border border-white/[0.06] p-1 shrink-0">
                <ProviderPill active={moneda === 'PEN'} onClick={() => setMoneda('PEN')}>
                  S/ Soles
                </ProviderPill>
                <ProviderPill active={moneda === 'USD'} onClick={() => setMoneda('USD')}>
                  $ Dólares
                </ProviderPill>
              </div>
            </div>
          </Field>
        )}
      </div>

      {soloCodigo && (
        <p className="rounded-lg border border-white/[0.06] bg-card/50 p-3 text-xs text-slate-400">
          Para {tipo === 'valorizacion' ? 'valorizaciones' : 'información de póliza'} solo se necesita el número de siniestro.
        </p>
      )}

      {!soloCodigo && (
        <>
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
        </>
      )}

      {/* Cheque — sub-opción dentro de Pago */}
      {puedeSerCheque && (
        <div className="rounded-lg border border-white/[0.06] bg-card/50 p-3 space-y-3">
          <label className="flex items-start gap-2.5 cursor-pointer select-none">
            <span
              onClick={() => setEsCheque((v) => !v)}
              className={cn(
                'mt-0.5 grid h-4 w-4 shrink-0 place-items-center rounded border transition',
                esCheque ? 'border-cyan-500 bg-cyan-500' : 'border-slate-600 bg-card'
              )}
            >
              {esCheque && (
                <svg className="h-3 w-3 text-white" viewBox="0 0 20 20" fill="currentColor">
                  <path fillRule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clipRule="evenodd" />
                </svg>
              )}
            </span>
            <input type="checkbox" checked={esCheque} onChange={(e) => setEsCheque(e.target.checked)} className="sr-only" />
            <span className="text-xs text-slate-300 leading-snug">
              Este pago es un <strong className="text-slate-100">cheque</strong>
              <span className="block text-[11px] text-slate-500 mt-0.5">
                Registra el banco y quién lo recoge.
              </span>
            </span>
          </label>

          {esCheque && (
            <div className="space-y-3 slide-in">
              <Field label="Nombre del banco">
                <input
                  type="text"
                  value={chequeBanco}
                  onChange={(e) => setChequeBanco(e.target.value)}
                  placeholder="Ej. BCP, Interbank…"
                  className={cn(baseInput, focusClass)}
                />
              </Field>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                <Field label="Persona a recoger (nombre completo)">
                  <input
                    type="text"
                    value={chequePersona}
                    onChange={(e) => setChequePersona(e.target.value)}
                    className={cn(baseInput, focusClass)}
                  />
                </Field>
                <Field label="DNI de quien recoge">
                  <input
                    type="text"
                    value={chequeDni}
                    onChange={(e) => setChequeDni(e.target.value)}
                    maxLength={12}
                    inputMode="numeric"
                    className={cn(baseInput, focusClass)}
                  />
                </Field>
              </div>
              <div>
                <Label>¿Se pagó el deducible de este caso?</Label>
                <div className="inline-flex rounded-lg bg-card border border-white/[0.06] p-1">
                  <ProviderPill active={chequeDeduciblePagado === true} onClick={() => setChequeDeduciblePagado(true)}>
                    Sí pagó
                  </ProviderPill>
                  <ProviderPill active={chequeDeduciblePagado === false} onClick={() => setChequeDeduciblePagado(false)}>
                    No pagó
                  </ProviderPill>
                  <ProviderPill active={chequeDeduciblePagado === null} onClick={() => setChequeDeduciblePagado(null)}>
                    Sin indicar
                  </ProviderPill>
                </div>
              </div>
            </div>
          )}
        </div>
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

      {/* Preferencias de correo de notificación */}
      <div className="rounded-lg border border-white/[0.06] bg-card/50 p-3 space-y-3">
        <div>
          <Label>Cliente de correo</Label>
          <div className="inline-flex rounded-lg bg-card border border-white/[0.06] p-1">
            <ProviderPill active={emailProvider === 'gmail'} onClick={() => setEmailProvider('gmail')}>
              Gmail
            </ProviderPill>
            <ProviderPill active={emailProvider === 'outlook'} onClick={() => setEmailProvider('outlook')}>
              Outlook
            </ProviderPill>
            <ProviderPill active={emailProvider === 'yahoo'} onClick={() => setEmailProvider('yahoo')}>
              Yahoo
            </ProviderPill>
          </div>
        </div>

        <label className="flex items-start gap-2.5 cursor-pointer select-none">
          <span
            onClick={() => setAutoEnviar((v) => !v)}
            className={cn(
              'mt-0.5 grid h-4 w-4 shrink-0 place-items-center rounded border transition',
              autoEnviar ? 'border-cyan-500 bg-cyan-500' : 'border-slate-600 bg-card'
            )}
          >
            {autoEnviar && (
              <svg className="h-3 w-3 text-white" viewBox="0 0 20 20" fill="currentColor">
                <path fillRule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clipRule="evenodd" />
              </svg>
            )}
          </span>
          <input
            type="checkbox"
            checked={autoEnviar}
            onChange={(e) => setAutoEnviar(e.target.checked)}
            className="sr-only"
          />
          <span className="text-xs text-slate-300 leading-snug">
            Enviar correo automáticamente al crear el siniestro
            <span className="block text-[11px] text-slate-500 mt-0.5">
              Abre {PROVIDER_LABEL[emailProvider]} en una pestaña nueva con el correo listo. Solo presionas enviar.
            </span>
          </span>
        </label>
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
  remitente,
  providerInicial,
  onCambioProvider,
  onCerrar,
}: {
  siniestro: Siniestro;
  remitente: Usuario | null;
  providerInicial: EmailProvider;
  onCambioProvider: (p: EmailProvider) => void;
  onCerrar: () => void;
}) {
  const [marcando, setMarcando] = useState(false);
  const [provider, setProvider] = useState<EmailProvider>(providerInicial);
  const dest = getDestinatarios(siniestro, remitente);
  const asunto = buildAsunto(siniestro);
  const cuerpo = buildCuerpo(siniestro);

  function cambiarProvider(p: EmailProvider) {
    setProvider(p);
    onCambioProvider(p);
  }

  async function enviarCorreo() {
    setMarcando(true);
    const url = buildEmailUrl(siniestro, provider, remitente);
    window.open(url, '_blank', 'noopener');
    // Marcamos como enviado de forma optimista (el usuario debe presionar enviar en su mail)
    await supabase.from('siniestros').update({
      correo_enviado: true,
      correo_enviado_fecha: new Date().toISOString(),
    }).eq('id', siniestro.id);
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
        <div className="flex items-start justify-between gap-3 flex-wrap">
          <div>
            <div className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1">
              ¿Enviar correo de notificación?
            </div>
            <p className="text-xs text-slate-500">
              Se abre el cliente seleccionado en una pestaña nueva con los destinatarios y el contenido prellenado.
            </p>
          </div>
          <div className="inline-flex rounded-lg bg-card border border-white/[0.06] p-1 shrink-0">
            <ProviderPill active={provider === 'gmail'} onClick={() => cambiarProvider('gmail')}>
              Gmail
            </ProviderPill>
            <ProviderPill active={provider === 'outlook'} onClick={() => cambiarProvider('outlook')}>
              Outlook
            </ProviderPill>
            <ProviderPill active={provider === 'yahoo'} onClick={() => cambiarProvider('yahoo')}>
              Yahoo
            </ProviderPill>
          </div>
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
            Abrir {PROVIDER_LABEL[provider]} y enviar
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

function ProviderPill({
  active,
  onClick,
  children,
}: {
  active: boolean;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={cn(
        'rounded-md px-3 py-1 text-xs font-medium transition',
        active ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white hover:bg-white/5'
      )}
    >
      {children}
    </button>
  );
}
