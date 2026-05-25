import { cn } from '@/lib/utils';
import type { TipoSiniestro } from '@/lib/types';
import { ReactNode } from 'react';

type Tone = 'pago' | 'reembolso' | 'deducible' | 'gray' | 'green' | 'yellow' | 'red';

const toneStyles: Record<Tone, string> = {
  pago: 'bg-pacifico-light text-pacifico-primary border-pacifico-primary/20',
  reembolso: 'bg-sky-50 text-sky-700 border-sky-200',
  deducible: 'bg-orange-50 text-orange-700 border-orange-200',
  gray: 'bg-slate-100 text-slate-700 border-slate-200',
  green: 'bg-emerald-50 text-emerald-700 border-emerald-200',
  yellow: 'bg-amber-50 text-amber-700 border-amber-200',
  red: 'bg-red-50 text-red-700 border-red-200',
};

interface BadgeProps {
  tone?: Tone;
  className?: string;
  children: ReactNode;
}

export function Badge({ tone = 'gray', className, children }: BadgeProps) {
  return (
    <span
      className={cn(
        'inline-flex items-center gap-1 rounded-full border px-2 py-0.5 text-[11px] font-medium uppercase tracking-wide',
        toneStyles[tone],
        className
      )}
    >
      {children}
    </span>
  );
}

export function TipoBadge({ tipo }: { tipo: TipoSiniestro }) {
  const label = tipo === 'pago' ? 'Pago' : tipo === 'reembolso' ? 'Reembolso' : 'Deducible';
  return <Badge tone={tipo}>{label}</Badge>;
}
