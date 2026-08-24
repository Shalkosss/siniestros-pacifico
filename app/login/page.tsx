'use client';

import { FormEvent, useState } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { TEAMS, type TeamSlug } from '@/lib/teams';
import { cn } from '@/lib/utils';

const teamColor: Record<TeamSlug, { ring: string; bg: string; text: string }> = {
  pacifico: { ring: 'ring-cyan-500/40',   bg: 'bg-cyan-500/15',   text: 'text-cyan-300' },
  abeo:     { ring: 'ring-violet-500/40', bg: 'bg-violet-500/15', text: 'text-violet-300' },
  rvc:      { ring: 'ring-emerald-500/40',bg: 'bg-emerald-500/15',text: 'text-emerald-300' },
  jh:       { ring: 'ring-amber-500/40',  bg: 'bg-amber-500/15',  text: 'text-amber-300' },
  chacon:   { ring: 'ring-rose-500/40',   bg: 'bg-rose-500/15',   text: 'text-rose-300' },
  tuesta:   { ring: 'ring-sky-500/40',    bg: 'bg-sky-500/15',    text: 'text-sky-300' },
  escobedo: { ring: 'ring-orange-500/40', bg: 'bg-orange-500/15', text: 'text-orange-300' },
};

export default function LoginPage() {
  const router = useRouter();
  const params = useSearchParams();
  const next = params.get('next') || '/';
  const [team, setTeam] = useState<TeamSlug | ''>('');
  const [password, setPassword] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    if (!team) { setError('Selecciona un equipo.'); return; }
    if (!password) { setError('Ingresa la contraseña.'); return; }

    setSubmitting(true);
    try {
      const r = await fetch('/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ team, password }),
      });
      const data = await r.json();
      if (!r.ok) {
        setError(data.error ?? 'Error al ingresar.');
        setSubmitting(false);
        return;
      }
      router.replace(next);
      router.refresh();
    } catch (err) {
      setError('Error de red.');
      setSubmitting(false);
    }
  }

  return (
    <div className="min-h-screen grid place-items-center px-4 py-10">
      <div className="w-full max-w-md">
        <div className="flex flex-col items-center mb-6">
          <div className="grid h-12 w-12 place-items-center rounded-xl bg-grad-pago text-white font-bold text-lg shadow-glow">
            P
          </div>
          <h1 className="mt-3 text-xl font-semibold text-slate-100 tracking-tight">
            Pacífico Seguros · Siniestros Legal
          </h1>
          <p className="mt-1 text-sm text-slate-500">
            Ingresa con la contraseña de tu equipo
          </p>
        </div>

        <form onSubmit={onSubmit} className="rounded-2xl bg-panel border border-white/[0.06] p-6 space-y-5">
          {/* Equipo */}
          <div>
            <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-2">
              Equipo
            </label>
            <div className="grid grid-cols-2 gap-2">
              {TEAMS.map((t) => {
                const active = team === t.slug;
                const c = teamColor[t.slug];
                return (
                  <button
                    type="button"
                    key={t.slug}
                    onClick={() => setTeam(t.slug)}
                    className={cn(
                      'rounded-lg border px-3 py-2 text-left text-sm transition',
                      active
                        ? cn('ring-1', c.ring, c.bg, c.text, 'border-transparent')
                        : 'bg-card border-white/[0.06] text-slate-300 hover:bg-card-hover'
                    )}
                  >
                    {t.label}
                  </button>
                );
              })}
            </div>
          </div>

          {/* Password */}
          <div>
            <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1.5">
              Contraseña
            </label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              autoComplete="current-password"
              placeholder="••••••••"
              className="w-full rounded-lg bg-card border border-white/[0.06] px-3 py-2 text-sm text-slate-200 placeholder:text-slate-600 focus:outline-none focus:border-cyan-500 transition"
            />
          </div>

          {error && (
            <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-sm text-red-300">
              {error}
            </div>
          )}

          <button
            type="submit"
            disabled={submitting}
            className="w-full inline-flex items-center justify-center rounded-lg border border-cyan-500/50 bg-cyan-500/20 px-4 py-2.5 text-sm font-semibold text-cyan-300 hover:bg-cyan-500/30 transition disabled:opacity-50"
          >
            {submitting ? 'Ingresando…' : 'Ingresar'}
          </button>

          <p className="text-[11px] text-slate-500 text-center leading-relaxed">
            Usa la contraseña de tu equipo o, si tienes una personal, la tuya.
            <span className="block">Si no la sabes, pídela al equipo de Pacífico.</span>
          </p>
        </form>
      </div>
    </div>
  );
}
