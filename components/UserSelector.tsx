'use client';

import { useState, useRef, useEffect } from 'react';
import { useUser } from './UserContext';
import type { Usuario, RolUsuario } from '@/lib/types';
import { cn } from '@/lib/utils';

const rolLabels: Record<RolUsuario, string> = {
  admin: 'Admin',
  terceros: 'Terceros',
  abogado: 'Abogado',
  viewer: 'Jefatura',
};

const rolColors: Record<RolUsuario, string> = {
  admin: 'bg-pago text-white',
  terceros: 'bg-reembolso text-white',
  abogado: 'bg-emerald-600 text-white',
  viewer: 'bg-slate-500 text-white',
};

export function UserSelector() {
  const { usuario, usuariosEquipo, teamLabel, setUsuario, loading, logout } = useUser();
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function onClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    }
    document.addEventListener('mousedown', onClick);
    return () => document.removeEventListener('mousedown', onClick);
  }, []);

  if (loading) {
    return <div className="h-9 w-40 animate-pulse rounded-lg bg-white/10" />;
  }

  if (!usuario) {
    return <SelectorModal usuarios={usuariosEquipo} teamLabel={teamLabel} onSelect={setUsuario} onLogout={logout} />;
  }

  return (
    <div className="relative" ref={ref}>
      <button
        onClick={() => setOpen((v) => !v)}
        className="flex items-center gap-2 rounded-lg bg-white/[0.03] border border-white/[0.06] px-2 py-1.5 text-sm font-medium text-slate-200 hover:bg-white/[0.05] transition"
      >
        <span className={cn('grid h-7 w-7 place-items-center rounded-lg text-xs font-semibold', rolColors[usuario.rol])}>
          {usuario.nombre.charAt(0).toUpperCase()}
        </span>
        <span className="hidden sm:flex flex-col items-start leading-tight">
          <span className="text-slate-100">{usuario.nombre}</span>
          <span className="text-[10px] text-slate-500 uppercase tracking-wide">{rolLabels[usuario.rol]}</span>
        </span>
        <svg className="h-4 w-4 text-slate-500" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.06l3.71-3.83a.75.75 0 011.08 1.04l-4.25 4.39a.75.75 0 01-1.08 0L5.21 8.27a.75.75 0 01.02-1.06z" clipRule="evenodd" />
        </svg>
      </button>

      {open && (
        <div className="absolute right-0 z-50 mt-2 w-80 rounded-xl bg-panel border border-white/[0.08] p-2 shadow-2xl slide-in">
          <div className="px-3 py-1.5 flex items-center justify-between">
            <div>
              <div className="text-[10px] uppercase tracking-[0.12em] text-slate-500">Equipo</div>
              <div className="text-sm font-semibold text-slate-200">{teamLabel}</div>
            </div>
          </div>
          <div className="my-1 border-t border-white/[0.06]" />
          <div className="px-3 py-1 text-[10px] uppercase tracking-[0.12em] text-slate-500">
            Cambiar usuario
          </div>
          <div className="max-h-[26rem] space-y-1 overflow-y-auto px-1">
            {usuariosEquipo.map((u) => (
              <button
                key={u.id}
                onClick={() => {
                  setUsuario(u);
                  setOpen(false);
                }}
                className={cn(
                  'flex w-full items-center gap-3 rounded-lg px-2 py-1.5 text-left text-sm transition',
                  u.id === usuario.id ? 'bg-pago/15 text-cyan-300' : 'text-slate-300 hover:bg-white/5'
                )}
              >
                <span className={cn('grid h-7 w-7 place-items-center rounded-lg text-xs font-semibold', rolColors[u.rol])}>
                  {u.nombre.charAt(0).toUpperCase()}
                </span>
                <span className="flex-1">
                  <span className="block font-medium">{u.nombre}</span>
                  <span className="block text-[11px] text-slate-500">{rolLabels[u.rol]}</span>
                </span>
              </button>
            ))}
          </div>
          <div className="mt-1 border-t border-white/[0.06] pt-1 space-y-0.5">
            <button
              onClick={() => {
                setUsuario(null);
                setOpen(false);
              }}
              className="w-full rounded-lg px-2 py-1.5 text-left text-xs text-slate-400 hover:bg-white/5 hover:text-slate-200"
            >
              Cerrar sesión de usuario
            </button>
            <button
              onClick={() => { void logout(); }}
              className="w-full rounded-lg px-2 py-1.5 text-left text-xs text-red-400 hover:bg-red-500/10"
            >
              Cambiar de equipo
            </button>
          </div>
        </div>
      )}
    </div>
  );
}

function SelectorModal({
  usuarios,
  teamLabel,
  onSelect,
  onLogout,
}: {
  usuarios: Usuario[];
  teamLabel: string | null;
  onSelect: (u: Usuario) => void;
  onLogout: () => void;
}) {
  return (
    <div className="fixed inset-0 z-50 grid place-items-center bg-black/60 backdrop-blur-md fade-in">
      <div className="w-full max-w-md rounded-2xl bg-panel border border-white/[0.06] p-6 shadow-2xl">
        <div className="flex items-center justify-between gap-3 mb-5">
          <div className="flex items-center gap-3">
            <div className="grid h-11 w-11 place-items-center rounded-xl bg-grad-pago text-white font-bold shadow-glow">
              P
            </div>
            <div>
              <div className="text-[10px] uppercase tracking-[0.12em] text-slate-500">Equipo</div>
              <h2 className="text-base font-semibold text-slate-100">{teamLabel}</h2>
            </div>
          </div>
          <button
            onClick={onLogout}
            className="text-[11px] text-slate-500 hover:text-red-400 underline-offset-2 hover:underline"
          >
            Cambiar equipo
          </button>
        </div>

        <p className="text-sm text-slate-400 mb-3">¿Quién eres?</p>

        <div className="max-h-[24rem] space-y-1 overflow-y-auto">
          {usuarios.length === 0 && (
            <div className="rounded-lg bg-amber-500/10 border border-amber-500/30 p-3 text-sm text-amber-200">
              No hay usuarios activos para este equipo. Verifica el seed o el panel admin.
            </div>
          )}
          {usuarios.map((u) => (
            <button
              key={u.id}
              onClick={() => onSelect(u)}
              className="flex w-full items-center gap-3 rounded-lg border border-white/[0.06] bg-card px-3 py-2 text-left transition hover:bg-card-hover"
            >
              <span className={cn('grid h-9 w-9 place-items-center rounded-lg text-sm font-semibold', rolColors[u.rol])}>
                {u.nombre.charAt(0).toUpperCase()}
              </span>
              <span className="flex-1">
                <span className="block text-sm font-medium text-slate-100">{u.nombre}</span>
                <span className="block text-[11px] text-slate-500">{rolLabels[u.rol]}</span>
              </span>
            </button>
          ))}
        </div>
      </div>
    </div>
  );
}
