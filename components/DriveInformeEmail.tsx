'use client';

import { useEffect, useMemo, useState } from 'react';
import type { DriveSiniestro, Usuario } from '@/lib/types';
import { buildComposeUrl, type EmailProvider } from '@/lib/email';
import { buildEmailInforme } from '@/lib/informe';
import { cn } from '@/lib/utils';

const EMAIL_PROVIDER_KEY = 'pacifico:email-provider';

const PROVIDER_LABEL: Record<EmailProvider, string> = {
  gmail: 'Gmail',
  outlook: 'Outlook',
  yahoo: 'Yahoo',
};

/**
 * Panel para disparar el informe por correo: muestra a quiénes va, deja ver el
 * texto exacto que se va a enviar y abre el compose del proveedor elegido.
 */
export function InformeEmailPanel({
  registro,
  usuario,
}: {
  registro: DriveSiniestro;
  usuario: Usuario | null;
}) {
  const [provider, setProvider] = useState<EmailProvider>('gmail');
  const [verTexto, setVerTexto] = useState(false);
  const [copiado, setCopiado] = useState(false);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const p = localStorage.getItem(EMAIL_PROVIDER_KEY);
    if (p === 'gmail' || p === 'outlook' || p === 'yahoo') setProvider(p);
  }, []);

  useEffect(() => {
    if (typeof window !== 'undefined') localStorage.setItem(EMAIL_PROVIDER_KEY, provider);
  }, [provider]);

  const contenido = useMemo(() => buildEmailInforme(registro, usuario), [registro, usuario]);

  function abrir() {
    window.open(buildComposeUrl(provider, contenido), '_blank', 'noopener');
  }

  async function copiar() {
    try {
      await navigator.clipboard.writeText(`${contenido.subject}\n\n${contenido.body}`);
      setCopiado(true);
      setTimeout(() => setCopiado(false), 2000);
    } catch {
      setVerTexto(true);
    }
  }

  return (
    <div className="space-y-3 rounded-xl border border-white/[0.06] bg-white/[0.02] p-4">
      <div className="flex flex-wrap items-center gap-2">
        <h3 className="text-[13px] font-semibold text-slate-200">Enviar informe por correo</h3>
        <div className="ml-auto flex items-center gap-1 rounded-lg border border-white/[0.06] p-0.5">
          {(Object.keys(PROVIDER_LABEL) as EmailProvider[]).map((p) => (
            <button
              key={p}
              type="button"
              onClick={() => setProvider(p)}
              className={cn(
                'rounded-md px-2.5 py-1 text-[11px] font-medium transition',
                provider === p ? 'bg-white/10 text-white' : 'text-slate-500 hover:text-slate-300'
              )}
            >
              {PROVIDER_LABEL[p]}
            </button>
          ))}
        </div>
      </div>

      <dl className="space-y-1.5 text-[12px]">
        <div className="flex gap-2">
          <dt className="w-14 shrink-0 font-semibold uppercase tracking-wider text-slate-500">Para</dt>
          <dd className="min-w-0 break-words text-slate-300">{contenido.to.join(', ')}</dd>
        </div>
        <div className="flex gap-2">
          <dt className="w-14 shrink-0 font-semibold uppercase tracking-wider text-slate-500">Copia</dt>
          <dd className="min-w-0 break-words text-slate-400">
            {contenido.cc.length > 0 ? contenido.cc.join(', ') : '—'}
          </dd>
        </div>
        <div className="flex gap-2">
          <dt className="w-14 shrink-0 font-semibold uppercase tracking-wider text-slate-500">Asunto</dt>
          <dd className="min-w-0 break-words font-medium text-slate-200">{contenido.subject}</dd>
        </div>
      </dl>

      <div className="flex flex-wrap items-center gap-2">
        <button
          type="button"
          onClick={abrir}
          className="inline-flex items-center gap-1.5 rounded-lg bg-pago px-3.5 py-2 text-sm font-semibold text-white transition hover:bg-cyan-600"
        >
          <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
          </svg>
          Abrir en {PROVIDER_LABEL[provider]}
        </button>
        <button
          type="button"
          onClick={copiar}
          className="inline-flex items-center rounded-lg border border-white/[0.08] px-3.5 py-2 text-sm font-medium text-slate-300 transition hover:bg-white/[0.06] hover:text-white"
        >
          {copiado ? '¡Copiado!' : 'Copiar texto'}
        </button>
        <button
          type="button"
          onClick={() => setVerTexto((v) => !v)}
          className="text-[12px] font-medium text-slate-500 transition hover:text-slate-300"
        >
          {verTexto ? 'Ocultar informe' : 'Ver informe completo'}
        </button>
      </div>

      {verTexto && (
        <pre className="max-h-72 overflow-auto whitespace-pre-wrap rounded-lg border border-white/[0.06] bg-black/30 p-3 text-[11.5px] leading-relaxed text-slate-300">
          {contenido.body}
        </pre>
      )}
    </div>
  );
}
