'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { UserSelector } from './UserSelector';
import { NotificationBell } from './NotificationBell';
import { UpdatesButton } from './UpdatesAnnouncement';
import { cn } from '@/lib/utils';
import { useUser } from './UserContext';
import { puedeCrearSiniestro, puedeVerRuta, type Ruta } from '@/lib/permissions';

const NAV: { href: Ruta; label: string }[] = [
  { href: '/', label: 'Tablero' },
  { href: '/historico', label: 'Histórico' },
  { href: '/dashboard', label: 'KPIs' },
];

export function Header() {
  const pathname = usePathname();
  const { usuario } = useUser();

  const visibles = NAV.filter((n) => puedeVerRuta(usuario, n.href));
  const puedeCrear = puedeCrearSiniestro(usuario);

  return (
    <header className="sticky top-0 z-30 border-b border-white/[0.06] bg-base/80 backdrop-blur-md">
      <div className="mx-auto flex max-w-[1600px] items-center gap-3 sm:gap-6 px-3 sm:px-6 py-3 sm:py-4">
        <Link href="/" className="flex items-center gap-2.5 min-w-0">
          <div className="grid h-9 w-9 shrink-0 place-items-center rounded-lg bg-grad-pago text-white font-bold text-sm">
            P
          </div>
          <div className="leading-tight hidden xs:block sm:block">
            <div className="text-sm font-semibold text-slate-100 truncate">Pacífico Seguros</div>
            <div className="text-[10px] uppercase tracking-[0.12em] text-slate-500">Siniestros · Legal</div>
          </div>
        </Link>

        {/* Nav (solo si tiene más de 1 ruta visible) */}
        {visibles.length > 1 && (
          <nav className="ml-2 hidden md:flex items-center gap-0.5 rounded-lg bg-white/[0.03] border border-white/[0.06] p-1">
            {visibles.map((n) => (
              <Link
                key={n.href}
                href={n.href}
                className={cn(
                  'rounded-md px-3 py-1.5 text-sm font-medium transition',
                  pathname === n.href
                    ? 'bg-white/10 text-white'
                    : 'text-slate-400 hover:text-white hover:bg-white/5'
                )}
              >
                {n.label}
              </Link>
            ))}
          </nav>
        )}

        <div className="ml-auto flex items-center gap-2">
          {/* "+ Nuevo" — Desktop completo, mobile compacto (solo ícono) */}
          {puedeCrear && (
            <>
              {/* Desktop */}
              <Link
                href="/nuevo"
                className="hidden sm:inline-flex items-center gap-1.5 rounded-lg bg-pago px-3.5 py-2 text-sm font-semibold text-white hover:bg-cyan-600 transition shadow-sm"
              >
                <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" />
                </svg>
                Nuevo
              </Link>
              {/* Mobile — ícono circular */}
              <Link
                href="/nuevo"
                className="sm:hidden grid h-10 w-10 place-items-center rounded-full bg-pago text-white shadow-glow hover:bg-cyan-600 transition"
                aria-label="Nuevo siniestro"
              >
                <svg className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" />
                </svg>
              </Link>
            </>
          )}

          <UpdatesButton />

          {/* Campana solo en desktop */}
          {usuario && (
            <div className="hidden md:block">
              <NotificationBell />
            </div>
          )}
          <UserSelector />
        </div>
      </div>

      {/* Nav mobile (solo si hay más de 1 ruta visible) */}
      {visibles.length > 1 && (
        <nav className="md:hidden flex items-center gap-0.5 mx-3 mb-2 rounded-lg bg-white/[0.03] border border-white/[0.06] p-1">
          {visibles.map((n) => (
            <Link
              key={n.href}
              href={n.href}
              className={cn(
                'flex-1 text-center rounded-md px-3 py-1.5 text-xs font-medium transition',
                pathname === n.href
                  ? 'bg-white/10 text-white'
                  : 'text-slate-400 hover:text-white hover:bg-white/5'
              )}
            >
              {n.label}
            </Link>
          ))}
        </nav>
      )}
    </header>
  );
}
