'use client';

import { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';
import { APP_UPDATES, LATEST_UPDATE_ID } from '@/lib/updates';
import { cn } from '@/lib/utils';

const SEEN_KEY = 'pacifico:updates-seen';

/** Botón "Actualizaciones" para el Header + modal con el historial. */
export function UpdatesButton() {
  const [open, setOpen] = useState(false);
  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1.5 rounded-lg border border-white/[0.06] bg-white/[0.03] px-2.5 py-2 text-xs font-medium text-slate-300 hover:bg-white/[0.06] hover:text-white transition"
        title="Ver actualizaciones y mejoras"
      >
        <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
          <path d="M10 1.5l1.9 4.6 4.9.4-3.7 3.2 1.1 4.8L10 12.9 5.8 14.5l1.1-4.8L3.2 6.5l4.9-.4L10 1.5z" />
        </svg>
        <span className="hidden sm:inline">Actualizaciones</span>
      </button>
      {open && <UpdatesModal onClose={() => setOpen(false)} />}
    </>
  );
}

/** Banner que aparece una sola vez tras cada nuevo release. */
export function UpdatesBanner() {
  const [visible, setVisible] = useState(false);
  const [modalOpen, setModalOpen] = useState(false);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const seen = localStorage.getItem(SEEN_KEY);
    if (seen !== LATEST_UPDATE_ID) setVisible(true);
  }, []);

  function marcarVisto() {
    if (typeof window !== 'undefined') localStorage.setItem(SEEN_KEY, LATEST_UPDATE_ID);
    setVisible(false);
  }

  const ultimo = APP_UPDATES[0];
  if (!visible || !ultimo) return null;

  return (
    <>
      <div className="mb-4 rounded-xl border border-emerald-500/30 bg-emerald-500/10 p-4 flex items-start gap-3 fade-in">
        <svg className="h-5 w-5 shrink-0 text-emerald-400 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
          <path d="M10 1.5l1.9 4.6 4.9.4-3.7 3.2 1.1 4.8L10 12.9 5.8 14.5l1.1-4.8L3.2 6.5l4.9-.4L10 1.5z" />
        </svg>
        <div className="min-w-0 flex-1">
          <div className="text-sm font-semibold text-emerald-200">
            Novedades: {ultimo.titulo}
          </div>
          <div className="text-xs text-emerald-300/80 mt-0.5">
            Se aplicaron mejoras al sistema. Revisa qué cambió.
          </div>
          <div className="mt-2.5 flex gap-2">
            <button
              onClick={() => setModalOpen(true)}
              className="inline-flex items-center rounded-lg border border-emerald-500/50 bg-emerald-500/20 px-3 py-1.5 text-xs font-semibold text-emerald-200 hover:bg-emerald-500/30 transition"
            >
              Ver cambios
            </button>
            <button
              onClick={marcarVisto}
              className="inline-flex items-center rounded-lg border border-white/[0.08] px-3 py-1.5 text-xs font-medium text-slate-300 hover:bg-white/[0.03] hover:text-white transition"
            >
              Entendido
            </button>
          </div>
        </div>
        <button
          onClick={marcarVisto}
          className="rounded-full p-1 text-emerald-300/70 hover:bg-white/10 hover:text-white transition"
          aria-label="Cerrar aviso"
        >
          <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
            <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
          </svg>
        </button>
      </div>
      {modalOpen && (
        <UpdatesModal
          onClose={() => {
            marcarVisto();
            setModalOpen(false);
          }}
        />
      )}
    </>
  );
}

function UpdatesModal({ onClose }: { onClose: () => void }) {
  const [mounted, setMounted] = useState(false);
  useEffect(() => setMounted(true), []);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose]);

  if (!mounted) return null;

  // Portal a document.body: el Header usa backdrop-filter, lo que rompería el
  // posicionamiento fixed si el modal se renderizara dentro de él.
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
          <h2 className="text-base font-semibold text-white">Actualizaciones y mejoras</h2>
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
        <div className="max-h-[70vh] overflow-y-auto px-5 py-4 space-y-5">
          {APP_UPDATES.map((u) => (
            <section key={u.id}>
              <div className="flex items-baseline gap-2">
                <h3 className="text-sm font-semibold text-slate-100">{u.titulo}</h3>
                <span className="text-[11px] text-slate-500">{u.fecha}</span>
              </div>
              <ul className="mt-2 space-y-1.5">
                {u.items.map((it, i) => (
                  <li key={i} className={cn('flex gap-2 text-[13px] text-slate-300 leading-snug')}>
                    <span className="mt-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-cyan-400/70" />
                    <span>{it}</span>
                  </li>
                ))}
              </ul>
            </section>
          ))}
        </div>
      </div>
    </div>,
    document.body
  );
}
