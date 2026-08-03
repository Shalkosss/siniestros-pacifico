'use client';

import type { Siniestro } from '@/lib/types';
import { cn, censurar, colorPorDias, diasEfectivos, estaPausado, formatMoneda, type NivelUrgencia } from '@/lib/utils';
import { useMemo } from 'react';
import { useDraggable } from '@dnd-kit/core';
import { CSS } from '@dnd-kit/utilities';
import { useUser } from './UserContext';
import { debeCensurar } from '@/lib/permissions';

export type CardMode = 'compacto' | 'detallado';

interface Props {
  siniestro: Siniestro;
  mode: CardMode;
  draggable: boolean;
  onClick: () => void;
}

/** Color del borde izquierdo según tipo */
const borderByTipo: Record<Siniestro['tipo'], string> = {
  pago:         'border-l-[#06b6d4]',
  deducible:    'border-l-[#f59e0b]',
  valorizacion: 'border-l-[#10b981]',
  info_poliza:  'border-l-[#ec4899]',
  reembolso:    'border-l-[#8b5cf6]',
};

/** Estilos del day badge — discreto, font medium */
const badgeByUrgencia: Record<NivelUrgencia, string> = {
  verde:    'bg-emerald-500/15 text-emerald-400 ring-1 ring-emerald-500/25',
  amarillo: 'bg-amber-500/15 text-amber-400 ring-1 ring-amber-500/25',
  rojo:     'bg-red-500/15 text-red-400 ring-1 ring-red-500/30',
};

export function SiniestroCard({ siniestro, mode, draggable, onClick }: Props) {
  const { usuario } = useUser();
  const censura = debeCensurar(usuario);
  const pausado = estaPausado(siniestro);
  const urgente = !!siniestro.urgente;
  const diasAbierto = useMemo(() => diasEfectivos(siniestro), [siniestro]);
  const urgencia = useMemo(() => colorPorDias(diasAbierto), [diasAbierto]);
  // El nombre del abogado (reembolso a abogado) no es dato personal de terceros: no se censura
  const nombreMostrado = censurar(siniestro.asegurado_nombre, censura && !siniestro.reembolso_abogado);

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
          siniestro.es_pago_cuenta && 'ring-1 ring-teal-400/40 bg-teal-500/[0.05]',
          pausado && 'ring-1 ring-amber-400/50 bg-amber-500/[0.06]',
          urgente && 'ring-2 ring-red-500/70 bg-red-500/[0.07]',
          draggable && 'cursor-grab active:cursor-grabbing',
          isDragging && 'dragging'
        )}
      >
        <button
          onClick={onClick}
          {...dragProps}
          className="flex w-full items-center gap-2 px-3 py-2.5 text-left"
          title={`${siniestro.codigo} · ${nombreMostrado} · ${pausado ? 'contador pausado' : `${diasAbierto}d abierto`}${urgente ? ' · URGENTE' : ''}${siniestro.es_pago_cuenta ? ' · pago en cuenta' : ''}${siniestro.correo_enviado ? ' · correo enviado' : ''}`}
        >
          {urgente && <UrgentDot />}
          <span className="font-mono text-sm font-semibold tracking-tight text-slate-100 flex-1">
            {siniestro.codigo}
          </span>
          {pausado && <PauseDot />}
          {siniestro.es_pago_cuenta && <BankDot />}
          {siniestro.correo_enviado && <MailDot />}
          <DayBadge dias={diasAbierto} urgencia={urgencia} pausado={pausado} />
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
        siniestro.es_pago_cuenta && 'ring-1 ring-teal-400/40 bg-teal-500/[0.05]',
        pausado && 'ring-1 ring-amber-400/50 bg-amber-500/[0.06]',
        urgente && 'ring-2 ring-red-500/70 bg-red-500/[0.07]',
        draggable && 'cursor-grab active:cursor-grabbing',
        isDragging && 'dragging'
      )}
    >
      <button onClick={onClick} {...dragProps} className="block w-full text-left p-3">
        {urgente && (
          <div className="mb-1.5 inline-flex items-center gap-1 rounded px-1.5 py-0.5 text-[10px] font-bold uppercase tracking-wider bg-red-500/20 text-red-300 ring-1 ring-red-500/40">
            <svg className="h-2.5 w-2.5" viewBox="0 0 20 20" fill="currentColor">
              <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
            </svg>
            Urgente
          </div>
        )}
        <div className="flex items-start justify-between gap-2">
          <span className="font-mono text-sm font-semibold tracking-tight text-slate-100 flex items-center gap-1.5">
            {siniestro.codigo}
            {pausado && <PauseDot />}
            {siniestro.es_pago_cuenta && <BankDot />}
            {siniestro.correo_enviado && <MailDot />}
          </span>
          <DayBadge dias={diasAbierto} urgencia={urgencia} pausado={pausado} />
        </div>

        <div className="mt-1.5 space-y-0.5">
          {siniestro.asegurado_nombre && (
            <div className="text-[13px] text-slate-300 truncate">{nombreMostrado}</div>
          )}
          {siniestro.monto != null && (
            <div className="text-[13px] font-semibold text-slate-100">{formatMoneda(siniestro.monto, siniestro.moneda)}</div>
          )}
          {siniestro.es_pago_cuenta && (
            <div className="inline-flex items-center gap-1 rounded px-1.5 py-0.5 text-[10px] font-medium bg-teal-500/15 text-teal-300 mr-1">
              <svg className="h-2.5 w-2.5" viewBox="0 0 20 20" fill="currentColor">
                <path d="M10 2L2 7h16l-8-5z" />
                <path d="M4 8v6h2V8H4zm5 0v6h2V8H9zm5 0v6h2V8h-2zM2 16h16v2H2v-2z" />
              </svg>
              Pago en cuenta
            </div>
          )}
          {pausado && (
            <div className="mt-1 rounded-md border border-amber-500/30 bg-amber-500/10 px-2 py-1 text-[10px] text-amber-200">
              <div className="flex items-center gap-1 font-semibold">
                <svg className="h-2.5 w-2.5" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M6 4h3v12H6zM11 4h3v12h-3z" />
                </svg>
                Contador pausado
              </div>
              {siniestro.nota_pausa && (
                <div className="mt-0.5 line-clamp-2 text-amber-100/70 font-normal">{siniestro.nota_pausa}</div>
              )}
            </div>
          )}
          {siniestro.tipo === 'pago' && siniestro.deducible_pagado != null && (
            <div
              className={cn(
                'inline-flex items-center gap-1 rounded px-1.5 py-0.5 text-[10px] font-medium',
                siniestro.deducible_pagado
                  ? 'bg-emerald-500/15 text-emerald-400'
                  : 'bg-red-500/15 text-red-400'
              )}
            >
              Deducible {siniestro.deducible_pagado ? 'pagado' : 'no pagado'}
            </div>
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

function DayBadge({ dias, urgencia, pausado }: { dias: number; urgencia: NivelUrgencia; pausado?: boolean }) {
  if (pausado) {
    return (
      <span
        className="inline-flex items-center gap-1 rounded-md px-1.5 py-0.5 text-[11px] font-semibold bg-amber-500/15 text-amber-300 ring-1 ring-amber-500/30"
        title={`Contador pausado (${dias}d congelados)`}
      >
        <svg className="h-2.5 w-2.5" viewBox="0 0 20 20" fill="currentColor">
          <path d="M6 4h3v12H6zM11 4h3v12h-3z" />
        </svg>
        —
      </span>
    );
  }
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

/** Indicador de caso urgente (triángulo de alerta rojo) */
function UrgentDot() {
  return (
    <span
      className="inline-grid h-4 w-4 place-items-center rounded-sm text-red-400"
      title="Caso urgente"
    >
      <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
        <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
      </svg>
    </span>
  );
}

/** Indicador de contador pausado por Pacífico (ícono de pausa ámbar) */
function PauseDot() {
  return (
    <span
      className="inline-grid h-4 w-4 place-items-center rounded-sm text-amber-300"
      title="Contador pausado por Pacífico"
    >
      <svg className="h-3 w-3" viewBox="0 0 20 20" fill="currentColor">
        <path d="M6 4h3v12H6zM11 4h3v12h-3z" />
      </svg>
    </span>
  );
}

/** Indicador de pago en cuenta bancaria (ícono de banco teal) */
function BankDot() {
  return (
    <span
      className="inline-grid h-4 w-4 place-items-center rounded-sm text-teal-300"
      title="Pago en cuenta bancaria (ficha de matrícula adjunta)"
    >
      <svg className="h-3 w-3" viewBox="0 0 20 20" fill="currentColor">
        <path d="M10 2L2 7h16l-8-5z" />
        <path d="M4 8v6h2V8H4zm5 0v6h2V8H9zm5 0v6h2V8h-2zM2 16h16v2H2v-2z" />
      </svg>
    </span>
  );
}

/** Indicador discreto: el correo de notificación ya fue enviado */
function MailDot() {
  return (
    <span
      className="inline-grid h-4 w-4 place-items-center rounded-sm text-emerald-400/80"
      title="Correo de notificación enviado"
    >
      <svg className="h-3 w-3" viewBox="0 0 20 20" fill="currentColor">
        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
      </svg>
    </span>
  );
}
