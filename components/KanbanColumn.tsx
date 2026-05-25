'use client';

import type { Siniestro, TipoSiniestro } from '@/lib/types';
import { SiniestroCard, type CardMode } from './SiniestroCard';
import { cn } from '@/lib/utils';
import { useDroppable } from '@dnd-kit/core';

interface Props {
  tipo: TipoSiniestro;
  estado: string;
  siniestros: Siniestro[];
  mode: CardMode;
  draggable: boolean;
  onCardClick: (s: Siniestro) => void;
}

export function KanbanColumn({ tipo, estado, siniestros, mode, draggable, onCardClick }: Props) {
  const dropId = `${tipo}::${estado}`;
  const { setNodeRef, isOver } = useDroppable({ id: dropId, data: { tipo, estado } });

  return (
    <div
      ref={setNodeRef}
      className={cn(
        'flex w-[240px] shrink-0 flex-col rounded-xl bg-column/70 border border-white/[0.04] transition',
        isOver && 'drop-target'
      )}
    >
      <div className="flex items-center justify-between px-3 py-2.5">
        <h3 className="text-[11px] font-medium tracking-[0.04em] text-slate-400 truncate">
          {estado}
        </h3>
        <span className="grid h-4 min-w-[18px] place-items-center rounded-full bg-white/5 px-1.5 text-[10px] font-medium text-slate-500">
          {siniestros.length}
        </span>
      </div>

      <div className="flex-1 space-y-2 overflow-y-auto px-2 pb-2 min-h-[140px] max-h-[60vh]">
        {siniestros.map((s) => (
          <SiniestroCard
            key={s.id}
            siniestro={s}
            mode={mode}
            draggable={draggable}
            onClick={() => onCardClick(s)}
          />
        ))}
        {siniestros.length === 0 && (
          <div className="py-6 text-center text-xs text-slate-600 select-none">—</div>
        )}
      </div>
    </div>
  );
}
