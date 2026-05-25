'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { UserSelector } from './UserSelector';
import { NotificationBell } from './NotificationBell';
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

  return (
    <header className="sticky top-0 z-30 border-b border-white/[0.06] bg-base/80 backdrop-blur-md">
      <div className="mx-auto flex max-w-[1600px] items-center gap-6 px-6 py-4">
        <Link href="/" className="flex items-center gap-2.5">
          <div className="grid h-9 w-9 place-items-center rounded-lg bg-grad-pago text-white font-bold text-sm">
            P
          </div>
          <div className="leading-tight">
            <div className="text-sm font-semibold text-slate-100">Pacífico Seguros</div>
            <div className="text-[10px] uppercase tracking-[0.12em] text-slate-500">Siniestros · Legal</div>
          </div>
        </Link>

        <nav className="ml-4 hidden md:flex items-center gap-0.5 rounded-lg bg-white/[0.03] border border-white/[0.06] p-1">
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

        <div className="ml-auto flex items-center gap-2.5">
          {puedeCrearSiniestro(usuario) && (
            <Link
              href="/nuevo"
              className="hidden sm:inline-flex items-center gap-1.5 rounded-lg bg-pago px-3.5 py-2 text-sm font-semibold text-white hover:bg-blue-600 transition shadow-sm"
            >
              <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                <path d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" />
              </svg>
              Nuevo
            </Link>
          )}
          {usuario && <NotificationBell />}
          <UserSelector />
        </div>
      </div>
    </header>
  );
}
