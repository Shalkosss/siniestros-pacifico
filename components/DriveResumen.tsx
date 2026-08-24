'use client';

import { useMemo, useState } from 'react';
import type { DriveSiniestro } from '@/lib/types';
import { cn } from '@/lib/utils';
import { DRIVE_MESES } from '@/lib/drive';

/**
 * v13 — Resumen de abiertos y cerrados del Drive.
 *
 * Se actualiza con el periodo (este mes, 3 meses, 6, 12 o todo) y se puede
 * alternar entre ver el desglose por abogado o por estudio: el corte por
 * estudio no viene fijo, es un toggle.
 *
 * El periodo se calcula sobre la FECHA DE REGISTRO del caso: de los casos
 * ingresados en ese lapso, cuántos siguen abiertos y cuántos ya se cerraron.
 */

type Periodo = 'mes' | '3m' | '6m' | '12m' | 'todo';
type Corte = 'abogado' | 'estudio';

const PERIODOS: { id: Periodo; label: string; meses: number | null }[] = [
  { id: 'mes', label: 'Este mes', meses: 1 },
  { id: '3m', label: '3 meses', meses: 3 },
  { id: '6m', label: '6 meses', meses: 6 },
  { id: '12m', label: '12 meses', meses: 12 },
  { id: 'todo', label: 'Todo', meses: null },
];

const SIN_ASIGNAR = 'Sin asignar';

/** Fecha con la que ubicamos el caso en el tiempo: la de registro, o año/mes. */
function fechaDelCaso(r: DriveSiniestro): Date | null {
  if (r.fecha_registro) {
    const m = r.fecha_registro.slice(0, 10).match(/^(\d{4})-(\d{2})-(\d{2})$/);
    if (m) return new Date(Number(m[1]), Number(m[2]) - 1, Number(m[3]));
  }
  if (r.anio) {
    const idx = r.mes ? (DRIVE_MESES as readonly string[]).indexOf(r.mes) : 0;
    return new Date(r.anio, idx >= 0 ? idx : 0, 1);
  }
  return null;
}

/** Primer día del periodo. null = sin límite (todo el histórico). */
function inicioDePeriodo(p: Periodo): Date | null {
  const meses = PERIODOS.find((x) => x.id === p)?.meses ?? null;
  if (meses == null) return null;
  const hoy = new Date();
  if (meses === 1) return new Date(hoy.getFullYear(), hoy.getMonth(), 1);
  // "3 meses" = el mes actual y los 2 anteriores, completos.
  return new Date(hoy.getFullYear(), hoy.getMonth() - (meses - 1), 1);
}

interface Fila {
  label: string;
  total: number;
  abiertos: number;
  cerrados: number;
}

export function DriveResumen({
  registros,
  /** Los abogados no eligen corte por estudio: solo ven el suyo */
  mostrarCorte = true,
}: {
  registros: DriveSiniestro[];
  mostrarCorte?: boolean;
}) {
  const [periodo, setPeriodo] = useState<Periodo>('3m');
  const [corte, setCorte] = useState<Corte>('abogado');

  const enPeriodo = useMemo(() => {
    const desde = inicioDePeriodo(periodo);
    if (!desde) return registros;
    return registros.filter((r) => {
      const f = fechaDelCaso(r);
      return f != null && f >= desde;
    });
  }, [registros, periodo]);

  const totales = useMemo(() => {
    const abiertos = enPeriodo.filter((r) => r.estado !== 'CERRADO').length;
    return { total: enPeriodo.length, abiertos, cerrados: enPeriodo.length - abiertos };
  }, [enPeriodo]);

  const filas: Fila[] = useMemo(() => {
    const map = new Map<string, Fila>();
    for (const r of enPeriodo) {
      const label = (corte === 'abogado' ? r.abogado : r.estudio)?.trim() || SIN_ASIGNAR;
      const fila = map.get(label) ?? { label, total: 0, abiertos: 0, cerrados: 0 };
      fila.total += 1;
      if (r.estado === 'CERRADO') fila.cerrados += 1;
      else fila.abiertos += 1;
      map.set(label, fila);
    }
    return Array.from(map.values()).sort((a, b) => {
      // Primero quien más pendientes tiene: es lo que hay que mirar.
      if (b.abiertos !== a.abiertos) return b.abiertos - a.abiertos;
      return b.total - a.total;
    });
  }, [enPeriodo, corte]);

  const maxTotal = Math.max(1, ...filas.map((f) => f.total));
  const pctCierre = totales.total > 0 ? Math.round((totales.cerrados / totales.total) * 100) : 0;

  return (
    <section className="rounded-xl border border-white/[0.06] bg-white/[0.02] p-4 space-y-4">
      {/* Encabezado + controles */}
      <div className="flex flex-wrap items-center gap-2">
        <div className="mr-auto">
          <h2 className="text-[15px] font-semibold text-slate-100">Abiertos y cerrados</h2>
          <p className="text-[11px] text-slate-500">
            Casos registrados en el periodo · no usa los filtros de año y mes de abajo
          </p>
        </div>

        <div className="inline-flex rounded-lg bg-white/[0.03] border border-white/[0.06] p-0.5">
          {PERIODOS.map((p) => (
            <button
              key={p.id}
              onClick={() => setPeriodo(p.id)}
              className={cn(
                'rounded-md px-2.5 py-1 text-[11px] font-medium transition',
                periodo === p.id ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
              )}
            >
              {p.label}
            </button>
          ))}
        </div>

        {mostrarCorte && (
          <div className="inline-flex rounded-lg bg-white/[0.03] border border-white/[0.06] p-0.5">
            <button
              onClick={() => setCorte('abogado')}
              className={cn(
                'rounded-md px-2.5 py-1 text-[11px] font-medium transition',
                corte === 'abogado' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
              )}
              title="Ver el desglose por abogado"
            >
              Por abogado
            </button>
            <button
              onClick={() => setCorte('estudio')}
              className={cn(
                'rounded-md px-2.5 py-1 text-[11px] font-medium transition',
                corte === 'estudio' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
              )}
              title="Ver el desglose por estudio"
            >
              Por estudio
            </button>
          </div>
        )}
      </div>

      {/* Totales */}
      <div className="grid grid-cols-2 gap-2.5 sm:grid-cols-4">
        <Tarjeta label="Casos" valor={totales.total} />
        <Tarjeta label="Abiertos" valor={totales.abiertos} tono="abierto" />
        <Tarjeta label="Cerrados" valor={totales.cerrados} tono="cerrado" />
        <Tarjeta label="% cerrados" valor={`${pctCierre}%`} tono="neutro" />
      </div>

      {/* Desglose */}
      {filas.length === 0 ? (
        <div className="py-8 text-center text-sm text-slate-500">
          Sin casos registrados en este periodo.
        </div>
      ) : (
        <div className="space-y-1.5">
          <div className="flex items-center gap-3 px-1 text-[10px] font-semibold uppercase tracking-wider text-slate-500">
            <span className="w-40 shrink-0">{corte === 'abogado' ? 'Abogado' : 'Estudio'}</span>
            <span className="flex-1">Abiertos / cerrados</span>
            <span className="w-24 shrink-0 text-right">Total</span>
          </div>
          {filas.map((f) => {
            const ancho = (f.total / maxTotal) * 100;
            const pctAbiertos = f.total > 0 ? (f.abiertos / f.total) * 100 : 0;
            return (
              <div key={f.label} className="flex items-center gap-3">
                <span
                  className="w-40 shrink-0 truncate text-xs text-slate-300"
                  title={f.label}
                >
                  {f.label}
                </span>
                <div className="flex-1 min-w-0">
                  <div className="h-5 w-full rounded-md bg-white/[0.03] overflow-hidden">
                    <div className="flex h-full rounded-md overflow-hidden" style={{ width: `${ancho}%` }}>
                      <div
                        className="bg-rose-500/45 h-full"
                        style={{ width: `${pctAbiertos}%` }}
                        title={`${f.abiertos} abiertos`}
                      />
                      <div
                        className="bg-emerald-500/45 h-full flex-1"
                        title={`${f.cerrados} cerrados`}
                      />
                    </div>
                  </div>
                </div>
                <span className="w-24 shrink-0 text-right text-[11px] tabular-nums">
                  <span className="text-rose-300">{f.abiertos}</span>
                  <span className="text-slate-600"> / </span>
                  <span className="text-emerald-300">{f.cerrados}</span>
                  <span className="ml-1.5 text-slate-500">({f.total})</span>
                </span>
              </div>
            );
          })}
        </div>
      )}
    </section>
  );
}

function Tarjeta({
  label,
  valor,
  tono = 'neutro',
}: {
  label: string;
  valor: number | string;
  tono?: 'neutro' | 'abierto' | 'cerrado';
}) {
  const estilo: Record<string, string> = {
    neutro: 'border-white/[0.06] bg-white/[0.02] text-slate-100',
    abierto: 'border-rose-500/20 bg-rose-500/[0.07] text-rose-200',
    cerrado: 'border-emerald-500/20 bg-emerald-500/[0.07] text-emerald-200',
  };
  return (
    <div className={cn('rounded-lg border px-3 py-2.5', estilo[tono])}>
      <div className="text-[10px] font-semibold uppercase tracking-[0.12em] opacity-70">{label}</div>
      <div className="mt-0.5 text-2xl font-bold tabular-nums tracking-tight">{valor}</div>
    </div>
  );
}
