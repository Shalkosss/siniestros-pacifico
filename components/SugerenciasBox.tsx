'use client';

import { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';
import { supabase } from '@/lib/supabase';
import type { Sugerencia } from '@/lib/types';
import { useUser } from './UserContext';
import { cn, formatFecha } from '@/lib/utils';

/**
 * Buzón de sugerencias.
 * Cualquier usuario deja una sugerencia; el admin (Rodrigo) ve la lista completa
 * y puede marcarlas como leídas.
 */
export function SugerenciasButton() {
  const [open, setOpen] = useState(false);
  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1.5 rounded-lg border border-white/[0.06] bg-white/[0.03] px-2.5 py-2 text-xs font-medium text-slate-300 hover:bg-white/[0.06] hover:text-white transition"
        title="Buzón de sugerencias"
      >
        <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
          <path d="M10 2a6 6 0 00-3.815 10.631c.401.328.65.794.727 1.293l.088.576h6l.088-.576c.077-.499.326-.965.727-1.293A6 6 0 0010 2z" />
          <path d="M8.5 16a.5.5 0 000 1h3a.5.5 0 000-1h-3zm.5 2a.5.5 0 000 1h2a.5.5 0 000-1H9z" />
        </svg>
        <span className="hidden sm:inline">Sugerencias</span>
      </button>
      {open && <SugerenciasModal onClose={() => setOpen(false)} />}
    </>
  );
}

function SugerenciasModal({ onClose }: { onClose: () => void }) {
  const { usuario } = useUser();
  const [mounted, setMounted] = useState(false);
  const [texto, setTexto] = useState('');
  const [enviando, setEnviando] = useState(false);
  const [enviada, setEnviada] = useState(false);
  const [error, setError] = useState<string | null>(null);
  // Lista para el admin
  const [sugerencias, setSugerencias] = useState<Sugerencia[]>([]);
  const [cargandoLista, setCargandoLista] = useState(false);

  const esAdmin = usuario?.rol === 'admin';

  useEffect(() => setMounted(true), []);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose]);

  useEffect(() => {
    if (!esAdmin) return;
    setCargandoLista(true);
    supabase
      .from('sugerencias')
      .select('*')
      .order('created_at', { ascending: false })
      .then(({ data, error: err }) => {
        if (!err) setSugerencias((data as Sugerencia[]) ?? []);
        setCargandoLista(false);
      });
  }, [esAdmin, enviada]);

  async function enviar() {
    if (!texto.trim() || enviando) return;
    setEnviando(true);
    setError(null);
    const { error: insErr } = await supabase.from('sugerencias').insert({
      autor: usuario?.nombre ?? 'anónimo',
      rol: usuario?.rol ?? null,
      texto: texto.trim(),
    });
    setEnviando(false);
    if (insErr) {
      setError(
        insErr.message.includes('sugerencias')
          ? 'El buzón aún no está habilitado en la base de datos (falta la migración v8). Avísale a Rodrigo.'
          : 'Error: ' + insErr.message
      );
      return;
    }
    setTexto('');
    setEnviada(true);
  }

  async function marcarLeida(s: Sugerencia) {
    const { error: err } = await supabase
      .from('sugerencias')
      .update({ leida: !s.leida })
      .eq('id', s.id);
    if (!err) {
      setSugerencias((prev) => prev.map((x) => (x.id === s.id ? { ...x, leida: !s.leida } : x)));
    }
  }

  if (!mounted) return null;

  // Portal a body: el header usa backdrop-filter y rompería el fixed.
  return createPortal(
    <div
      className="fixed inset-0 z-50 flex items-start justify-center bg-black/60 backdrop-blur-sm fade-in p-4 sm:p-8 overflow-y-auto"
      onClick={onClose}
    >
      <div
        className="w-full max-w-lg rounded-2xl border border-white/10 bg-ink-800 shadow-2xl text-slate-200"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-white/[0.06] px-5 py-4">
          <div>
            <h2 className="text-base font-semibold text-white">Buzón de sugerencias</h2>
            <p className="text-[11px] text-slate-500 mt-0.5">
              Ideas, mejoras o problemas del sistema. Las lee el equipo de Pacífico.
            </p>
          </div>
          <button
            onClick={onClose}
            className="rounded-full p-1.5 text-slate-400 hover:bg-white/10 hover:text-white transition"
            aria-label="Cerrar"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>
        </div>

        <div className="max-h-[75vh] overflow-y-auto px-5 py-4 space-y-4">
          {/* Escribir sugerencia */}
          {enviada ? (
            <div className="rounded-xl border border-emerald-500/30 bg-emerald-500/10 p-4 flex items-start gap-3">
              <svg className="h-5 w-5 shrink-0 text-emerald-400 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
              </svg>
              <div className="flex-1">
                <div className="text-sm font-semibold text-emerald-200">¡Gracias por tu sugerencia!</div>
                <div className="text-xs text-emerald-300/80 mt-0.5">Quedó guardada en el buzón.</div>
                <button
                  onClick={() => setEnviada(false)}
                  className="mt-2 text-xs text-emerald-200 underline hover:text-white transition"
                >
                  Escribir otra
                </button>
              </div>
            </div>
          ) : (
            <div className="space-y-2">
              <textarea
                value={texto}
                onChange={(e) => setTexto(e.target.value)}
                rows={4}
                placeholder="Escribe tu sugerencia… (ej. 'Sería útil poder filtrar por monto')"
                className="w-full rounded-lg bg-card border border-white/[0.06] px-3 py-2 text-sm text-slate-200 placeholder:text-slate-500 transition focus:outline-none focus:bg-card-hover focus:border-[#06b6d4] resize-y"
              />
              {error && (
                <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-xs text-red-300">
                  {error}
                </div>
              )}
              <button
                onClick={enviar}
                disabled={!texto.trim() || enviando}
                className="inline-flex items-center gap-1.5 rounded-lg bg-pago px-3.5 py-2 text-sm font-semibold text-white hover:bg-cyan-600 transition disabled:opacity-50"
              >
                <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M3.105 2.289a.75.75 0 00-.826.95l1.414 4.925A1.5 1.5 0 005.135 9.25h6.115a.75.75 0 010 1.5H5.135a1.5 1.5 0 00-1.442 1.086l-1.414 4.926a.75.75 0 00.826.95 28.896 28.896 0 0015.293-7.154.75.75 0 000-1.115A28.897 28.897 0 003.105 2.289z" />
                </svg>
                {enviando ? 'Enviando…' : 'Enviar sugerencia'}
              </button>
            </div>
          )}

          {/* Lista completa (solo admin) */}
          {esAdmin && (
            <section className="border-t border-white/[0.06] pt-4">
              <h3 className="text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-2.5">
                Sugerencias recibidas ({sugerencias.length})
              </h3>
              {cargandoLista ? (
                <p className="text-xs text-slate-500">Cargando…</p>
              ) : sugerencias.length === 0 ? (
                <p className="text-xs text-slate-500">Aún no hay sugerencias.</p>
              ) : (
                <ul className="space-y-2">
                  {sugerencias.map((s) => (
                    <li
                      key={s.id}
                      className={cn(
                        'rounded-lg border p-3',
                        s.leida
                          ? 'border-white/[0.05] bg-white/[0.01] opacity-60'
                          : 'border-white/[0.08] bg-white/[0.03]'
                      )}
                    >
                      <div className="flex items-start justify-between gap-2">
                        <div className="min-w-0 flex-1">
                          <div className="text-[11px] text-slate-500">
                            <span className="font-semibold text-slate-300">{s.autor}</span>
                            {s.rol && <span> · {s.rol}</span>}
                            <span> · {formatFecha(s.created_at)}</span>
                          </div>
                          <p className="mt-1 text-[13px] text-slate-200 whitespace-pre-wrap leading-snug">
                            {s.texto}
                          </p>
                        </div>
                        <button
                          onClick={() => marcarLeida(s)}
                          className={cn(
                            'shrink-0 rounded-md px-2 py-1 text-[10px] font-medium border transition',
                            s.leida
                              ? 'border-white/10 text-slate-500 hover:text-slate-300'
                              : 'border-emerald-500/40 bg-emerald-500/10 text-emerald-300 hover:bg-emerald-500/20'
                          )}
                        >
                          {s.leida ? 'Marcar no leída' : 'Marcar leída'}
                        </button>
                      </div>
                    </li>
                  ))}
                </ul>
              )}
            </section>
          )}
        </div>
      </div>
    </div>,
    document.body
  );
}
