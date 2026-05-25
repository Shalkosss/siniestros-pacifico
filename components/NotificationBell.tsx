'use client';

import { useEffect, useRef, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import type { Notificacion } from '@/lib/types';
import { useUser } from './UserContext';
import { cn, formatFecha } from '@/lib/utils';

export function NotificationBell() {
  const { usuario } = useUser();
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [items, setItems] = useState<Notificacion[]>([]);
  const ref = useRef<HTMLDivElement>(null);

  async function cargar() {
    if (!usuario) return;
    const { data } = await supabase
      .from('notificaciones')
      .select('*')
      .eq('usuario_destino', usuario.nombre)
      .order('created_at', { ascending: false })
      .limit(30);
    setItems(data ?? []);
  }

  useEffect(() => {
    void cargar();
    if (!usuario) return;
    const ch = supabase
      .channel(`notif-${usuario.nombre}`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'notificaciones',
          filter: `usuario_destino=eq.${usuario.nombre}`,
        },
        () => cargar()
      )
      .subscribe();
    return () => {
      void supabase.removeChannel(ch);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [usuario?.nombre]);

  useEffect(() => {
    function onClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    }
    document.addEventListener('mousedown', onClick);
    return () => document.removeEventListener('mousedown', onClick);
  }, []);

  const noLeidas = items.filter((n) => !n.leida).length;

  async function marcarTodasLeidas() {
    if (!usuario || noLeidas === 0) return;
    await supabase
      .from('notificaciones')
      .update({ leida: true })
      .eq('usuario_destino', usuario.nombre)
      .eq('leida', false);
    void cargar();
  }

  async function abrirSiniestro(n: Notificacion) {
    if (!n.leida) {
      await supabase.from('notificaciones').update({ leida: true }).eq('id', n.id);
    }
    setOpen(false);
    if (n.siniestro_id) router.push(`/siniestro/${n.siniestro_id}`);
    void cargar();
  }

  if (!usuario) return null;

  return (
    <div className="relative" ref={ref}>
      <button
        onClick={() => setOpen((v) => !v)}
        className="relative grid h-9 w-9 place-items-center rounded-lg bg-white/[0.03] border border-white/[0.06] text-slate-300 hover:bg-white/[0.05] hover:text-white transition"
        title="Notificaciones"
      >
        <svg className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
          <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
        </svg>
        {noLeidas > 0 && (
          <span className="absolute -top-1 -right-1 grid h-5 min-w-5 place-items-center rounded-full bg-accent-danger px-1 text-[10px] font-bold text-white shadow">
            {noLeidas > 9 ? '9+' : noLeidas}
          </span>
        )}
      </button>

      {open && (
        <div className="absolute right-0 z-50 mt-2 w-96 rounded-2xl panel shadow-2xl slide-in overflow-hidden">
          <div className="flex items-center justify-between border-b border-white/10 px-4 py-2.5">
            <h3 className="text-sm font-semibold text-white">Notificaciones</h3>
            {noLeidas > 0 && (
              <button
                onClick={marcarTodasLeidas}
                className="text-xs text-pacifico-secondary hover:text-white transition"
              >
                Marcar todas como leídas
              </button>
            )}
          </div>
          <div className="max-h-96 overflow-y-auto">
            {items.length === 0 ? (
              <div className="px-4 py-10 text-center text-sm text-white/40">Sin notificaciones</div>
            ) : (
              <ul>
                {items.map((n) => (
                  <li key={n.id}>
                    <button
                      onClick={() => abrirSiniestro(n)}
                      className={cn(
                        'flex w-full gap-3 border-b border-white/5 px-4 py-3 text-left transition hover:bg-white/5',
                        !n.leida && 'bg-pacifico-primary/10'
                      )}
                    >
                      <span
                        className={cn(
                          'mt-1.5 h-2 w-2 shrink-0 rounded-full',
                          n.leida ? 'bg-white/20' : 'bg-pacifico-secondary'
                        )}
                      />
                      <span className="flex-1">
                        <span className="block text-sm text-white/90">{n.mensaje}</span>
                        <span className="block text-[11px] text-white/40 mt-0.5">
                          {formatFecha(n.created_at)}
                        </span>
                      </span>
                    </button>
                  </li>
                ))}
              </ul>
            )}
          </div>
        </div>
      )}
    </div>
  );
}
