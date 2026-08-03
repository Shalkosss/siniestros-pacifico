'use client';

import { cn } from '@/lib/utils';

/** Clases compartidas por los formularios del Drive (mismo look que el resto). */
export const baseInput =
  'w-full rounded-lg bg-card border border-white/[0.06] px-3 py-2 text-sm text-slate-200 placeholder:text-slate-500 transition focus:outline-none focus:bg-card-hover focus:border-[#06b6d4]';

export const baseTextarea = cn(baseInput, 'min-h-[72px] resize-y leading-relaxed');

export function FField({
  label,
  hint,
  className,
  children,
}: {
  label: string;
  /** Nota corta debajo del campo (para explicar qué es). */
  hint?: string;
  className?: string;
  children: React.ReactNode;
}) {
  return (
    <div className={className}>
      <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1.5">
        {label}
      </label>
      {children}
      {hint && <p className="mt-1 text-[11px] leading-snug text-slate-500">{hint}</p>}
    </div>
  );
}

/** Checkbox con etiqueta, para los Sí/No del informe. */
export function FCheck({
  label,
  hint,
  checked,
  onChange,
}: {
  label: string;
  hint?: string;
  checked: boolean;
  onChange: (v: boolean) => void;
}) {
  return (
    <label className="flex cursor-pointer items-start gap-2.5 rounded-lg border border-white/[0.06] bg-white/[0.02] px-3 py-2 transition hover:bg-white/[0.04]">
      <input
        type="checkbox"
        checked={checked}
        onChange={(e) => onChange(e.target.checked)}
        className="mt-0.5 h-4 w-4 shrink-0 accent-[#06b6d4]"
      />
      <span className="min-w-0">
        <span className="block text-sm text-slate-200">{label}</span>
        {hint && <span className="mt-0.5 block text-[11px] leading-snug text-slate-500">{hint}</span>}
      </span>
    </label>
  );
}

/** Título de sección dentro de un formulario largo. */
export function FSection({ n, title, children }: { n: string; title: string; children?: React.ReactNode }) {
  return (
    <div className="flex items-center gap-2 pt-1">
      <span className="grid h-5 w-5 shrink-0 place-items-center rounded bg-white/[0.06] text-[10px] font-bold text-slate-400">
        {n}
      </span>
      <h3 className="text-[13px] font-semibold text-slate-200">{title}</h3>
      {children}
      <span className="ml-2 h-px flex-1 bg-white/[0.06]" />
    </div>
  );
}
