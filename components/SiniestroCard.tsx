'use client';

import type { Siniestro } from '@/lib/types';
import { cn, colorPorDias, diasDesde, formatMoneda, type NivelUrgencia } from '@/lib/utils';
import { useMemo } from 'react';
import { useDraggable } from '@dnd-kit/core';
import { CSS } from '@dnd-kit/utilities';

export type CardMode = 'compacto' | 'detallado';

interface Props {
  siniestro: Siniestro;
  mode: CardMode;
  draggable: boolean;
  onClick: () => void;
}

/** Color del borde izquierdo según tipo */
const borderByTipo: Record<Siniestro['tipo'], string> = {
  pago:      'border-l-pago',
  deducible: 'border-l-deducible',
  reembolso: 'border-l-reembolso',
};

/** Estilos del day badge — discreto, font medium */
const badgeByUrgencia: Record<NivelUrgencia, string> = {
  verde:    'bg-emerald-500/15 text-emerald-400 ring-1 ring-emerald-500/25',
  amarillo: 'bg-amber-500/15 text-amber-400 ring-1 ring-amber-500/25',
  rojo:     'bg-red-500/15 text-red-400 ring-1 ring-red-500/30',
};

export function SiniestroCard({ siniestro, mode, draggable, onClick }: Props) {
  const diasAbierto = useMemo(() => diasDesde(siniestro.created_at), [siniestro.created_at]);
  const urgencia = useMemo(() => colorPorDias(diasAbierto), [diasAbierto]);

  const { attributes, listeners, setNodeRef, transform, isDragging } = useDraggable({
    id: siniestro.id,
    data: { siniestro },
    disabled: !draggable,
  });

  const style = transform
    ? { transform: CSS.Translate.toString(transform), zIndex: 50 }
    : undefined;

  const dragProps = draggable ? { ...listeners, ...attributes } : {};

  if (mode === 'compacto') {
    return (
      <div
        ref={setNodeRef}
        style={style}
        className={cn(
          'card-base rounded-lg border-l-[3px] overflow-hidden',
          borderByTipo[siniestro.tipo],
          draggable && 'cursor-grab active:cursor-grabbing',
          isDragging && 'dragging'
        )}
      >
        <button
          onClick={onClick}
          {...dragProps}
          className="flex w-full items-center gap-2 px-3 py-2.5 text-left"
          title={`${siniestro.codigo} · ${siniestro.asegurado_nombre ?? ''} · ${diasAbierto}d abierto`}
        >
          <span className="font-mono text-sm font-semibold tracking-tight text-slate-100 flex-1">
            {siniestro.codigo}
          </span>
          <DayBadge dias={diasAbierto} urgencia={urgencia} />
        </button>
      </div>
    );
  }

  return (
    <div
      ref={setNodeRef}
      style={style}
      className={cn(
        'card-base rounded-lg border-l-[3px] overflow-hidden',
        borderByTipo[siniestro.tipo],
        draggable && 'cursor-grab active:cursor-grabbing',
        isDragging && 'dragging'
      )}
    >
      <button onClick={onClick} {...dragProps} className="block w-full text-left p-3">
        <div className="flex items-start justify-between gap-2">
          <span className="font-mono text-sm font-semibold tracking-tight text-slate-100">
            {siniestro.codigo}
          </span>
          <DayBadge dias={diasAbierto} urgencia={urgencia} />
        </div>

        <div className="mt-1.5 space-y-0.5">
          {siniestro.asegurado_nombre && (
            <div className="text-[13px] text-slate-300 truncate">{siniestro.asegurado_nombre}</div>
          )}
          {siniestro.monto != null && (
            <div className="text-[13px] font-semibold text-slate-100">{formatMoneda(siniestro.monto)}</div>
          )}
        </div>

        {siniestro.asignado_a && (
          <div className="mt-2 pt-2 border-t border-white/5 text-[11px] text-slate-500 truncate">
            → {siniestro.asignado_a}
          </div>
        )}
      </button>
    </div>
  );
}

function DayBadge({ dias, urgencia }: { dias: number; urgencia: NivelUrgencia }) {
  return (
    <span
      className={cn(
        'inline-flex items-baseline gap-0.5 rounded-md px-1.5 py-0.5 text-[11px] font-medium tabular-nums',
        badgeByUrgencia[urgencia]
      )}
      title={`${dias} días abierto`}
    >
      <span className="font-semibold">{dias}</span>
      <span className="opacity-70">d</span>
    </span>
  );
}
