'use client';

import { FormEvent, useEffect, useMemo, useState } from 'react';
import { supabase } from '@/lib/supabase';
import type { DriveSiniestro } from '@/lib/types';
import { useUser } from './UserContext';
import { cn, formatFechaCorta } from '@/lib/utils';
import {
  DRIVE_ESTADOS,
  DRIVE_ESTUDIOS,
  DRIVE_GRAVEDADES,
  DRIVE_LESIONES,
  DRIVE_MESES,
  DRIVE_SUB_ESTADOS,
  esFallecido,
  esUnidadRetenida,
  estudioDriveDe,
} from '@/lib/drive';
import {
  claveDuplicado,
  exportDriveExcel,
  parseDriveExcel,
  type DriveImportResult,
} from '@/lib/driveExcel';

const baseInput =
  'w-full rounded-lg bg-card border border-white/[0.06] px-3 py-2 text-sm text-slate-200 placeholder:text-slate-500 transition focus:outline-none focus:bg-card-hover focus:border-[#06b6d4]';

const baseSelect =
  'rounded-lg bg-white/[0.03] border border-white/[0.06] px-3 py-1.5 text-sm text-slate-200 focus:outline-none focus:border-white/20';

function fmtMonto(v: number | null): string {
  if (v == null) return '—';
  return new Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN', minimumFractionDigits: 0 }).format(v);
}

export function DriveBoard() {
  const { usuario } = useUser();
  const [registros, setRegistros] = useState<DriveSiniestro[]>([]);
  const [loading, setLoading] = useState(true);
  const [agregando, setAgregando] = useState(false);
  const [importando, setImportando] = useState(false);
  const [exportando, setExportando] = useState(false);

  // Filtros
  const [filtroAnio, setFiltroAnio] = useState<string>('');
  const [filtroMes, setFiltroMes] = useState<string>('');
  const [filtroEstado, setFiltroEstado] = useState<string>('');
  const [filtroEstudio, setFiltroEstudio] = useState<string>('');
  const [busqueda, setBusqueda] = useState('');

  const estudioUsuario = estudioDriveDe(usuario);
  const esPacifico = estudioUsuario === null;

  async function cargar() {
    // Supabase limita cada `.select()` a 1000 filas por defecto. La base
    // consolidada supera ese tope, así que paginamos con `.range()` hasta
    // traer todos los registros.
    const PAGE = 1000;
    const todos: DriveSiniestro[] = [];
    for (let desde = 0; ; desde += PAGE) {
      const { data, error } = await supabase
        .from('drive_siniestros')
        .select('*')
        .order('anio', { ascending: false })
        .order('fecha_registro', { ascending: false, nullsFirst: false })
        .order('id', { ascending: true }) // desempate único → paginación estable
        .range(desde, desde + PAGE - 1);
      if (error) {
        console.error('Error cargando drive', error);
        setLoading(false);
        return;
      }
      const lote = (data as DriveSiniestro[]) ?? [];
      todos.push(...lote);
      if (lote.length < PAGE) break; // última página
    }
    setRegistros(todos);
    setLoading(false);
  }

  useEffect(() => {
    void cargar();
  }, []);

  /**
   * Alterna la alerta (fallecido / unidad retenida) de un registro.
   * Guarda el opuesto del estado efectivo actual como flag manual.
   */
  async function toggleFlag(r: DriveSiniestro, campo: 'flag_fallecido' | 'flag_unidad_retenida') {
    const efectivo = campo === 'flag_fallecido' ? esFallecido(r) : esUnidadRetenida(r);
    // Update optimista para que el cambio se sienta inmediato
    setRegistros((prev) => prev.map((x) => (x.id === r.id ? { ...x, [campo]: !efectivo } : x)));
    const { error } = await supabase
      .from('drive_siniestros')
      .update({ [campo]: !efectivo })
      .eq('id', r.id);
    if (error) {
      alert('Error: ' + error.message);
      void cargar();
    }
  }

  // Visibilidad por estudio: abogados solo ven su estudio; Pacífico ve todo.
  const visibles = useMemo(() => {
    if (estudioUsuario === null) return registros;
    return registros.filter((r) => r.estudio === estudioUsuario);
  }, [registros, estudioUsuario]);

  const anios = useMemo(
    () =>
      Array.from(new Set(visibles.map((r) => r.anio).filter((a): a is number => a != null))).sort(
        (a, b) => b - a
      ),
    [visibles]
  );

  // Default: año más reciente con datos
  useEffect(() => {
    if (filtroAnio === '' && anios.length > 0) setFiltroAnio(String(anios[0]));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [anios.length]);

  const filtrados = useMemo(() => {
    return visibles.filter((r) => {
      if (filtroAnio && String(r.anio ?? '') !== filtroAnio) return false;
      if (filtroMes && r.mes !== filtroMes) return false;
      if (filtroEstado && r.estado !== filtroEstado) return false;
      if (esPacifico && filtroEstudio && r.estudio !== filtroEstudio) return false;
      if (busqueda) {
        const q = busqueda.toLowerCase();
        const hay =
          r.siniestro.toLowerCase().includes(q) ||
          (r.abogado ?? '').toLowerCase().includes(q) ||
          (r.distrito ?? '').toLowerCase().includes(q) ||
          (r.lesion_principal ?? '').toLowerCase().includes(q);
        if (!hay) return false;
      }
      return true;
    });
  }, [visibles, filtroAnio, filtroMes, filtroEstado, filtroEstudio, esPacifico, busqueda]);

  // Agrupar por mes (orden calendario). Los sin mes van a "Sin mes" al final.
  const grupos = useMemo(() => {
    const map = new Map<string, DriveSiniestro[]>();
    for (const mes of DRIVE_MESES) map.set(mes, []);
    map.set('Sin mes', []);
    for (const r of filtrados) {
      const key = r.mes && (DRIVE_MESES as readonly string[]).includes(r.mes) ? r.mes : 'Sin mes';
      map.get(key)!.push(r);
    }
    return Array.from(map.entries()).filter(([, v]) => v.length > 0);
  }, [filtrados]);

  /** Exporta lo que se está viendo (con los filtros activos) a un .xlsx */
  async function onExportar() {
    if (filtrados.length === 0 || exportando) return;
    setExportando(true);
    try {
      const partes = ['drive_siniestros'];
      if (filtroAnio) partes.push(filtroAnio);
      if (filtroMes) partes.push(filtroMes.toLowerCase());
      if (filtroEstado) partes.push(filtroEstado.toLowerCase() + 's');
      if (esPacifico && filtroEstudio) partes.push(filtroEstudio.toLowerCase().replace(/\s+/g, '_'));
      if (!esPacifico && estudioUsuario && estudioUsuario !== '__ninguno__') {
        partes.push(estudioUsuario.toLowerCase().replace(/\s+/g, '_'));
      }
      await exportDriveExcel(filtrados, partes.join('_'));
    } catch (e) {
      alert('Error al exportar: ' + (e instanceof Error ? e.message : String(e)));
    } finally {
      setExportando(false);
    }
  }

  return (
    <div className="space-y-4">
      {/* Título + acción */}
      <div className="flex flex-wrap items-center gap-3">
        <div>
          <h1 className="text-lg font-semibold text-white">Drive de Siniestros</h1>
          <p className="text-xs text-slate-500">
            Base consolidada de la métrica legal
            {!esPacifico && estudioUsuario !== '__ninguno__' && (
              <> · <span className="text-slate-300">{estudioUsuario}</span></>
            )}
            {' '}· {visibles.length.toLocaleString('es-PE')} registros
          </p>
        </div>
        <div className="ml-auto flex flex-wrap items-center gap-2">
          <button
            onClick={onExportar}
            disabled={exportando || filtrados.length === 0}
            title="Descargar en Excel los casos visibles (según los filtros)"
            className="inline-flex items-center gap-1.5 rounded-lg border border-white/[0.08] bg-white/[0.03] px-3.5 py-2 text-sm font-medium text-slate-300 hover:bg-white/[0.06] hover:text-white transition disabled:opacity-50"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M10 3a1 1 0 011 1v6.586l1.793-1.793a1 1 0 111.414 1.414l-3.5 3.5a1 1 0 01-1.414 0l-3.5-3.5a1 1 0 111.414-1.414L9 10.586V4a1 1 0 011-1z" />
              <path d="M4 14a1 1 0 011 1v1h10v-1a1 1 0 112 0v1a2 2 0 01-2 2H5a2 2 0 01-2-2v-1a1 1 0 011-1z" />
            </svg>
            {exportando ? 'Exportando…' : 'Exportar Excel'}
          </button>
          <button
            onClick={() => setImportando(true)}
            title="Subir un Excel con siniestros y registrarlos en lote"
            className="inline-flex items-center gap-1.5 rounded-lg border border-white/[0.08] bg-white/[0.03] px-3.5 py-2 text-sm font-medium text-slate-300 hover:bg-white/[0.06] hover:text-white transition"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M10 17a1 1 0 01-1-1V9.414l-1.793 1.793a1 1 0 11-1.414-1.414l3.5-3.5a1 1 0 011.414 0l3.5 3.5a1 1 0 11-1.414 1.414L11 9.414V16a1 1 0 01-1 1z" />
              <path d="M4 4a1 1 0 011-1h10a1 1 0 110 2H5a1 1 0 01-1-1z" />
            </svg>
            Importar Excel
          </button>
          <button
            onClick={() => setAgregando(true)}
            className="inline-flex items-center gap-1.5 rounded-lg bg-pago px-3.5 py-2 text-sm font-semibold text-white hover:bg-cyan-600 transition shadow-sm"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" />
            </svg>
            Agregar siniestro
          </button>
        </div>
      </div>

      {/* Filtros */}
      <div className="flex flex-wrap items-center gap-2">
        <select value={filtroAnio} onChange={(e) => setFiltroAnio(e.target.value)} className={baseSelect}>
          <option value="" className="bg-ink-800">Todos los años</option>
          {anios.map((a) => (
            <option key={a} value={String(a)} className="bg-ink-800">{a}</option>
          ))}
        </select>
        <select value={filtroMes} onChange={(e) => setFiltroMes(e.target.value)} className={baseSelect}>
          <option value="" className="bg-ink-800">Todos los meses</option>
          {DRIVE_MESES.map((m) => (
            <option key={m} value={m} className="bg-ink-800">{m}</option>
          ))}
        </select>
        <select value={filtroEstado} onChange={(e) => setFiltroEstado(e.target.value)} className={baseSelect}>
          <option value="" className="bg-ink-800">Abiertos y cerrados</option>
          {DRIVE_ESTADOS.map((e) => (
            <option key={e} value={e} className="bg-ink-800">{e === 'ABIERTO' ? 'Abiertos' : 'Cerrados'}</option>
          ))}
        </select>
        {esPacifico && (
          <select value={filtroEstudio} onChange={(e) => setFiltroEstudio(e.target.value)} className={baseSelect}>
            <option value="" className="bg-ink-800">Todos los estudios</option>
            {DRIVE_ESTUDIOS.map((e) => (
              <option key={e} value={e} className="bg-ink-800">{e}</option>
            ))}
          </select>
        )}
        <div className="relative">
          <svg className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-slate-500" viewBox="0 0 20 20" fill="currentColor"><path fillRule="evenodd" d="M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z" clipRule="evenodd" /></svg>
          <input
            type="text"
            placeholder="Buscar código, abogado…"
            value={busqueda}
            onChange={(e) => setBusqueda(e.target.value)}
            className="w-52 rounded-lg bg-white/[0.03] border border-white/[0.06] px-9 py-1.5 text-sm text-slate-200 placeholder:text-slate-500 focus:outline-none focus:border-white/20"
          />
        </div>
        <span className="ml-auto text-[11px] font-medium text-slate-500">
          {filtrados.length.toLocaleString('es-PE')} resultados
        </span>
      </div>

      {/* Tabla por mes */}
      {loading ? (
        <div className="grid place-items-center py-20 text-slate-500">Cargando registros…</div>
      ) : estudioUsuario === '__ninguno__' ? (
        <div className="rounded-xl border border-amber-500/30 bg-amber-500/10 p-4 text-sm text-amber-200">
          Tu usuario no tiene un estudio asociado en el Drive. Contacta a Pacífico.
        </div>
      ) : grupos.length === 0 ? (
        <div className="grid place-items-center py-20 text-slate-500">Sin registros para estos filtros.</div>
      ) : (
        <div className="space-y-5">
          {grupos.map(([mes, items]) => (
            <MesSection
              key={mes}
              mes={mes}
              items={items}
              esPacifico={esPacifico}
              mostrarAnio={!filtroAnio}
              onToggleFlag={toggleFlag}
            />
          ))}
        </div>
      )}

      {agregando && (
        <AgregarDriveModal
          estudioFijo={esPacifico ? null : estudioUsuario === '__ninguno__' ? null : estudioUsuario}
          creadoPor={usuario?.nombre ?? 'desconocido'}
          onClose={() => setAgregando(false)}
          onCreated={() => {
            setAgregando(false);
            void cargar();
          }}
        />
      )}

      {importando && (
        <ImportarDriveModal
          estudioFijo={esPacifico ? null : estudioUsuario === '__ninguno__' ? null : estudioUsuario}
          creadoPor={usuario?.nombre ?? 'desconocido'}
          registrosExistentes={registros}
          onClose={() => setImportando(false)}
          onImported={() => {
            setImportando(false);
            void cargar();
          }}
        />
      )}
    </div>
  );
}

/* ---------------- Sección por mes ---------------- */

function MesSection({
  mes,
  items,
  esPacifico,
  mostrarAnio,
  onToggleFlag,
}: {
  mes: string;
  items: DriveSiniestro[];
  esPacifico: boolean;
  mostrarAnio: boolean;
  onToggleFlag: (r: DriveSiniestro, campo: 'flag_fallecido' | 'flag_unidad_retenida') => void;
}) {
  const [abierto, setAbierto] = useState(true);
  const abiertos = items.filter((r) => r.estado === 'ABIERTO').length;
  const fallecidos = items.filter((r) => esFallecido(r)).length;

  // Totales del mes para la métrica legal
  const totReservaIni = items.reduce((s, r) => s + (r.reserva_inicial ?? 0), 0);
  const totReservaFin = items.reduce((s, r) => s + (r.reserva_final ?? 0), 0);
  const totAhorro = items.reduce((s, r) => s + (r.ahorro ?? 0), 0);

  return (
    <section className="rounded-xl border border-white/[0.06] bg-white/[0.02] overflow-hidden">
      <button
        onClick={() => setAbierto((v) => !v)}
        className="flex w-full items-center gap-2.5 px-4 py-3 text-left hover:bg-white/[0.02] transition"
      >
        <svg
          className={cn('h-3 w-3 text-slate-400 transition-transform', abierto && 'rotate-90')}
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path fillRule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.06 10 7.23 6.29a.75.75 0 111.04-1.08l4.39 4.25a.75.75 0 010 1.08l-4.39 4.25a.75.75 0 01-1.06-.02z" clipRule="evenodd" />
        </svg>
        <h2 className="text-[15px] font-semibold text-slate-100">{mes}</h2>
        <span className="rounded-full bg-white/5 px-2 py-0.5 text-[10px] font-medium text-slate-400">
          {items.length}
        </span>
        {abiertos > 0 && (
          <span className="rounded-full bg-amber-500/15 px-2 py-0.5 text-[10px] font-medium text-amber-300">
            {abiertos} abiertos
          </span>
        )}
        {fallecidos > 0 && (
          <span className="rounded-full bg-red-500/15 px-2 py-0.5 text-[10px] font-medium text-red-300">
            {fallecidos} con fallecido
          </span>
        )}
        {/* Totales del mes (desktop) */}
        <span className="ml-auto hidden lg:flex items-center gap-3 text-[11px] tabular-nums text-slate-500">
          <span>Reserva ini. <span className="text-slate-300">{fmtMonto(totReservaIni)}</span></span>
          <span>Reserva fin. <span className="text-slate-300">{fmtMonto(totReservaFin)}</span></span>
          <span>Ahorro <span className="text-emerald-300/90">{fmtMonto(totAhorro)}</span></span>
        </span>
      </button>

      {abierto && (
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs">
            <thead>
              <tr className="border-t border-white/[0.06] text-[10px] font-semibold uppercase tracking-wider text-slate-500">
                <Th>Alertas</Th>
                <Th>Siniestro</Th>
                {mostrarAnio && <Th>Año</Th>}
                <Th>F. registro</Th>
                <Th>Distrito</Th>
                <Th>Abogado</Th>
                <Th>Lesión principal</Th>
                <Th>Gravedad</Th>
                <Th className="text-right">Reserva inicial</Th>
                <Th className="text-right">Reserva final</Th>
                <Th className="text-right">Ahorro</Th>
                <Th>Sub estado</Th>
                <Th>Estado</Th>
                {esPacifico && <Th>Estudio</Th>}
              </tr>
            </thead>
            <tbody className="divide-y divide-white/[0.04]">
              {items.map((r) => {
                const fallecido = esFallecido(r);
                const retenida = esUnidadRetenida(r);
                return (
                <tr
                  key={r.id}
                  className={cn(
                    'transition border-l-2',
                    // Prioridad: fallecido (rojo fuerte) > unidad retenida (ámbar) > tinte por estado
                    fallecido
                      ? 'bg-red-500/[0.12] border-l-red-500 hover:bg-red-500/[0.18]'
                      : retenida
                      ? 'bg-amber-500/[0.10] border-l-amber-500 hover:bg-amber-500/[0.16]'
                      : r.estado === 'ABIERTO'
                      ? 'bg-rose-500/[0.04] border-l-rose-500/40 hover:bg-rose-500/[0.08]'
                      : 'bg-emerald-500/[0.04] border-l-emerald-500/40 hover:bg-emerald-500/[0.08]'
                  )}
                >
                  <Td>
                    <span className="inline-flex items-center gap-1">
                      <FlagButton
                        activo={fallecido}
                        titulo={fallecido ? 'Caso con fallecido — clic para quitar' : 'Marcar caso con fallecido'}
                        colorActivo="text-red-400 bg-red-500/20 ring-1 ring-red-500/40"
                        onClick={() => onToggleFlag(r, 'flag_fallecido')}
                      >
                        <FallecidoIcon />
                      </FlagButton>
                      <FlagButton
                        activo={retenida}
                        titulo={retenida ? 'Unidad retenida — clic para quitar' : 'Marcar unidad retenida'}
                        colorActivo="text-amber-400 bg-amber-500/20 ring-1 ring-amber-500/40"
                        onClick={() => onToggleFlag(r, 'flag_unidad_retenida')}
                      >
                        <VehiculoIcon />
                      </FlagButton>
                    </span>
                  </Td>
                  <Td className="font-mono font-semibold text-slate-100">
                    <span className="inline-flex items-center gap-1.5">
                      {r.siniestro}
                      {fallecido && <FallecidoIcon className="h-3.5 w-3.5 text-red-400" />}
                      {retenida && <VehiculoIcon className="h-3.5 w-3.5 text-amber-400" />}
                    </span>
                  </Td>
                  {mostrarAnio && <Td>{r.anio ?? '—'}</Td>}
                  <Td>{r.fecha_registro ? formatFechaCorta(r.fecha_registro) : '—'}</Td>
                  <Td>{r.distrito ?? '—'}</Td>
                  <Td>{r.abogado ?? '—'}</Td>
                  <Td>{r.lesion_principal ?? '—'}</Td>
                  <Td>
                    {r.gravedad ? (
                      <span
                        className={cn(
                          'rounded px-1.5 py-0.5 text-[10px] font-medium',
                          r.gravedad === 'Grave'
                            ? 'bg-red-500/15 text-red-300'
                            : 'bg-emerald-500/15 text-emerald-300'
                        )}
                      >
                        {r.gravedad}
                      </span>
                    ) : (
                      '—'
                    )}
                  </Td>
                  <Td className="text-right tabular-nums">{fmtMonto(r.reserva_inicial)}</Td>
                  <Td className="text-right tabular-nums">{fmtMonto(r.reserva_final)}</Td>
                  <Td className="text-right tabular-nums text-emerald-300/90">{fmtMonto(r.ahorro)}</Td>
                  <Td>{r.sub_estado ?? '—'}</Td>
                  <Td>
                    <span
                      className={cn(
                        'rounded px-1.5 py-0.5 text-[10px] font-semibold',
                        r.estado === 'ABIERTO'
                          ? 'bg-rose-500/15 text-rose-300'
                          : 'bg-emerald-500/15 text-emerald-300'
                      )}
                    >
                      {r.estado ?? '—'}
                    </span>
                  </Td>
                  {esPacifico && <Td>{r.estudio}</Td>}
                </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      )}
    </section>
  );
}

/** Botón de alerta clicable (editable por cualquier usuario que vea el registro) */
function FlagButton({
  activo,
  titulo,
  colorActivo,
  onClick,
  children,
}: {
  activo: boolean;
  titulo: string;
  colorActivo: string;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      onClick={onClick}
      title={titulo}
      className={cn(
        'grid h-6 w-6 place-items-center rounded-md transition',
        activo ? colorActivo : 'text-slate-600 hover:text-slate-300 hover:bg-white/[0.06]'
      )}
    >
      {children}
    </button>
  );
}

/** Icono de fallecido (calavera estilizada) */
function FallecidoIcon({ className = 'h-4 w-4' }: { className?: string }) {
  return (
    <svg className={className} viewBox="0 0 20 20" fill="currentColor">
      <path d="M10 2a6.5 6.5 0 00-6.5 6.5c0 2.1 1 3.96 2.55 5.14V16a1.5 1.5 0 001.5 1.5h.45v-1.75a.5.5 0 011 0v1.75h2v-1.75a.5.5 0 011 0v1.75h.45a1.5 1.5 0 001.5-1.5v-2.36A6.48 6.48 0 0016.5 8.5 6.5 6.5 0 0010 2zM7.25 10.5a1.75 1.75 0 110-3.5 1.75 1.75 0 010 3.5zm5.5 0a1.75 1.75 0 110-3.5 1.75 1.75 0 010 3.5zM10 13.2l-1.1-1.9h2.2L10 13.2z" />
    </svg>
  );
}

/** Icono de vehículo (unidad retenida) */
function VehiculoIcon({ className = 'h-4 w-4' }: { className?: string }) {
  return (
    <svg className={className} viewBox="0 0 20 20" fill="currentColor">
      <path d="M4.9 5.5A2 2 0 016.8 4h6.4a2 2 0 011.9 1.5l.9 3H4l.9-3z" />
      <path fillRule="evenodd" d="M3 9.5h14a1 1 0 011 1V14a1 1 0 01-1 1h-.5v.75a1.25 1.25 0 01-2.5 0V15H6v.75a1.25 1.25 0 01-2.5 0V15H3a1 1 0 01-1-1v-3.5a1 1 0 011-1zm2.25 3.75a1 1 0 100-2 1 1 0 000 2zm9.5 0a1 1 0 100-2 1 1 0 000 2z" clipRule="evenodd" />
    </svg>
  );
}

function Th({ children, className }: { children?: React.ReactNode; className?: string }) {
  return <th className={cn('px-3 py-2 whitespace-nowrap', className)}>{children}</th>;
}

function Td({ children, className }: { children?: React.ReactNode; className?: string }) {
  return <td className={cn('px-3 py-2 whitespace-nowrap text-slate-300', className)}>{children}</td>;
}

/* ---------------- Modal Agregar ---------------- */

function AgregarDriveModal({
  estudioFijo,
  creadoPor,
  onClose,
  onCreated,
}: {
  /** null = Pacífico elige el estudio; string = estudio fijo del abogado */
  estudioFijo: string | null;
  creadoPor: string;
  onClose: () => void;
  onCreated: () => void;
}) {
  const [siniestro, setSiniestro] = useState('');
  const [fechaRegistro, setFechaRegistro] = useState('');
  const [fechaSiniestro, setFechaSiniestro] = useState('');
  const [provincia, setProvincia] = useState('');
  const [distrito, setDistrito] = useState('');
  const [comisaria, setComisaria] = useState('');
  const [abogado, setAbogado] = useState('');
  const [cantLesionados, setCantLesionados] = useState('1');
  const [lesiones, setLesiones] = useState('');
  const [lesionPrincipal, setLesionPrincipal] = useState('');
  const [reservaInicial, setReservaInicial] = useState('');
  const [gravedad, setGravedad] = useState('Leve');
  const [reservaFinal, setReservaFinal] = useState('');
  const [ahorro, setAhorro] = useState('');
  const [fechaCierre, setFechaCierre] = useState('');
  const [subEstado, setSubEstado] = useState('');
  const [estado, setEstado] = useState('ABIERTO');
  const [estudio, setEstudio] = useState(estudioFijo ?? '');
  const [error, setError] = useState<string | null>(null);
  const [guardando, setGuardando] = useState(false);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose]);

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    if (!siniestro.trim()) { setError('Indica el código del siniestro.'); return; }
    if (!fechaRegistro) { setError('Indica la fecha de registro.'); return; }
    if (!lesionPrincipal) { setError('Selecciona la lesión principal.'); return; }
    if (!subEstado) { setError('Selecciona el sub estado.'); return; }
    if (!estudio) { setError('Selecciona el estudio.'); return; }
    if (estado === 'CERRADO' && !fechaCierre) { setError('Un siniestro cerrado necesita fecha de cierre.'); return; }

    setGuardando(true);

    // Año y mes se derivan de la fecha de registro para mantener el formato del Excel.
    const fr = new Date(fechaRegistro + 'T00:00:00');
    const anio = fr.getFullYear();
    const mes = DRIVE_MESES[fr.getMonth()];

    // Tiempo de cierre en días (si está cerrado y hay ambas fechas)
    let tiempoCierre: number | null = null;
    if (estado === 'CERRADO' && fechaCierre) {
      const fc = new Date(fechaCierre + 'T00:00:00');
      tiempoCierre = Math.max(0, Math.round((fc.getTime() - fr.getTime()) / (1000 * 60 * 60 * 24)));
    }

    const { error: insErr } = await supabase.from('drive_siniestros').insert({
      siniestro: siniestro.trim(),
      anio,
      mes,
      provincia: provincia.trim() || null,
      distrito: distrito.trim() || null,
      comisaria: comisaria.trim() || null,
      fecha_registro: fechaRegistro,
      fecha_siniestro: fechaSiniestro || null,
      abogado: abogado.trim() || null,
      cant_lesionados: cantLesionados ? Number(cantLesionados) : null,
      lesiones: lesiones.trim() || lesionPrincipal,
      lesion_principal: lesionPrincipal,
      reserva_inicial: reservaInicial ? Number(reservaInicial) : null,
      gravedad,
      reserva_final: reservaFinal ? Number(reservaFinal) : null,
      ahorro: ahorro ? Number(ahorro) : null,
      fecha_cierre: estado === 'CERRADO' && fechaCierre ? fechaCierre : null,
      tiempo_cierre: tiempoCierre,
      sub_estado: subEstado,
      estado,
      estudio,
      creado_por: creadoPor,
    });

    setGuardando(false);
    if (insErr) { setError('Error al guardar: ' + insErr.message); return; }
    onCreated();
  }

  return (
    <div
      className="fixed inset-0 z-50 flex items-start justify-center bg-black/60 backdrop-blur-sm fade-in p-4 sm:p-8 overflow-y-auto"
      onClick={onClose}
    >
      <form
        onSubmit={onSubmit}
        className="w-full max-w-2xl rounded-2xl border border-white/10 bg-ink-800 shadow-2xl text-slate-200"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-white/[0.06] px-5 py-4">
          <div>
            <h2 className="text-base font-semibold text-white">Agregar siniestro al Drive</h2>
            <p className="text-[11px] text-slate-500 mt-0.5">
              Mismo formato de la base consolidada. Año y mes se calculan de la fecha de registro.
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="rounded-full p-1.5 text-slate-400 hover:bg-white/10 hover:text-white transition"
            aria-label="Cerrar"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>
        </div>

        <div className="max-h-[70vh] overflow-y-auto px-5 py-4 space-y-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <FField label="Código del siniestro *">
              <input value={siniestro} onChange={(e) => setSiniestro(e.target.value)} className={cn(baseInput, 'font-mono')} placeholder="Ej. 1234567890" />
            </FField>
            <FField label="Estudio *">
              {estudioFijo ? (
                <input value={estudioFijo} disabled className={cn(baseInput, 'opacity-60 cursor-not-allowed')} />
              ) : (
                <select value={estudio} onChange={(e) => setEstudio(e.target.value)} className={baseInput}>
                  <option value="" className="bg-ink-800">— Selecciona —</option>
                  {DRIVE_ESTUDIOS.map((es) => (
                    <option key={es} value={es} className="bg-ink-800">{es}</option>
                  ))}
                </select>
              )}
            </FField>
            <FField label="Fecha de registro *">
              <input type="date" value={fechaRegistro} onChange={(e) => setFechaRegistro(e.target.value)} className={baseInput} />
            </FField>
            <FField label="Fecha del siniestro">
              <input type="date" value={fechaSiniestro} onChange={(e) => setFechaSiniestro(e.target.value)} className={baseInput} />
            </FField>
            <FField label="Provincia">
              <input value={provincia} onChange={(e) => setProvincia(e.target.value)} className={baseInput} placeholder="Ej. LIMA" />
            </FField>
            <FField label="Distrito">
              <input value={distrito} onChange={(e) => setDistrito(e.target.value)} className={baseInput} />
            </FField>
            <FField label="Comisaría">
              <input value={comisaria} onChange={(e) => setComisaria(e.target.value)} className={baseInput} />
            </FField>
            <FField label="Abogado">
              <input value={abogado} onChange={(e) => setAbogado(e.target.value)} className={baseInput} />
            </FField>
            <FField label="Cant. lesionados">
              <input type="number" min={0} value={cantLesionados} onChange={(e) => setCantLesionados(e.target.value)} className={baseInput} />
            </FField>
            <FField label="Lesión principal *">
              <select value={lesionPrincipal} onChange={(e) => setLesionPrincipal(e.target.value)} className={baseInput}>
                <option value="" className="bg-ink-800">— Selecciona —</option>
                {DRIVE_LESIONES.map((l) => (
                  <option key={l} value={l} className="bg-ink-800">{l}</option>
                ))}
              </select>
            </FField>
            <FField label="Detalle de lesiones">
              <input value={lesiones} onChange={(e) => setLesiones(e.target.value)} className={baseInput} placeholder="Si difiere de la principal" />
            </FField>
            <FField label="Gravedad *">
              <select value={gravedad} onChange={(e) => setGravedad(e.target.value)} className={baseInput}>
                {DRIVE_GRAVEDADES.map((g) => (
                  <option key={g} value={g} className="bg-ink-800">{g}</option>
                ))}
              </select>
            </FField>
            <FField label="Reserva inicial (S/)">
              <input type="number" step="0.01" value={reservaInicial} onChange={(e) => setReservaInicial(e.target.value)} className={baseInput} placeholder="0.00" />
            </FField>
            <FField label="Reserva final (S/)">
              <input type="number" step="0.01" value={reservaFinal} onChange={(e) => setReservaFinal(e.target.value)} className={baseInput} placeholder="0.00" />
            </FField>
            <FField label="Ahorro (S/)">
              <input type="number" step="0.01" value={ahorro} onChange={(e) => setAhorro(e.target.value)} className={baseInput} placeholder="0.00" />
            </FField>
            <FField label="Sub estado *">
              <select value={subEstado} onChange={(e) => setSubEstado(e.target.value)} className={baseInput}>
                <option value="" className="bg-ink-800">— Selecciona —</option>
                {DRIVE_SUB_ESTADOS.map((s) => (
                  <option key={s} value={s} className="bg-ink-800">{s}</option>
                ))}
              </select>
            </FField>
            <FField label="Estado *">
              <select value={estado} onChange={(e) => setEstado(e.target.value)} className={baseInput}>
                {DRIVE_ESTADOS.map((s) => (
                  <option key={s} value={s} className="bg-ink-800">{s}</option>
                ))}
              </select>
            </FField>
            {estado === 'CERRADO' && (
              <FField label="Fecha de cierre *">
                <input type="date" value={fechaCierre} onChange={(e) => setFechaCierre(e.target.value)} className={baseInput} />
              </FField>
            )}
          </div>

          {error && (
            <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-sm text-red-300">
              {error}
            </div>
          )}
        </div>

        <div className="flex gap-2 border-t border-white/[0.06] px-5 py-4">
          <button
            type="submit"
            disabled={guardando}
            className="inline-flex items-center rounded-lg bg-pago px-4 py-2 text-sm font-semibold text-white hover:bg-cyan-600 transition disabled:opacity-50"
          >
            {guardando ? 'Guardando…' : 'Agregar al Drive'}
          </button>
          <button
            type="button"
            onClick={onClose}
            className="inline-flex items-center rounded-lg border border-white/[0.08] px-4 py-2 text-sm font-medium text-slate-400 hover:bg-white/[0.03] hover:text-slate-200 transition"
          >
            Cancelar
          </button>
        </div>
      </form>
    </div>
  );
}

function FField({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div>
      <label className="block text-[10px] font-semibold uppercase tracking-[0.12em] text-slate-400 mb-1.5">
        {label}
      </label>
      {children}
    </div>
  );
}

/* ---------------- Modal Importar Excel ---------------- */

function ImportarDriveModal({
  estudioFijo,
  creadoPor,
  registrosExistentes,
  onClose,
  onImported,
}: {
  /** null = Pacífico (elige estudio default); string = estudio fijo del abogado */
  estudioFijo: string | null;
  creadoPor: string;
  registrosExistentes: DriveSiniestro[];
  onClose: () => void;
  onImported: () => void;
}) {
  const [nombreArchivo, setNombreArchivo] = useState<string | null>(null);
  const [buffer, setBuffer] = useState<ArrayBuffer | string | null>(null);
  const [resultado, setResultado] = useState<DriveImportResult | null>(null);
  const [estudioDefault, setEstudioDefault] = useState('');
  const [analizando, setAnalizando] = useState(false);
  const [guardando, setGuardando] = useState(false);
  const [progreso, setProgreso] = useState(0);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape' && !guardando) onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose, guardando]);

  // Claves estudio::siniestro ya presentes en la base, para omitir duplicados
  const existentes = useMemo(() => {
    const set = new Set<string>();
    for (const r of registrosExistentes) set.add(claveDuplicado(r.estudio, r.siniestro));
    return set;
  }, [registrosExistentes]);

  async function analizar(buf: ArrayBuffer | string, estudioDef: string) {
    setAnalizando(true);
    setError(null);
    setResultado(null);
    try {
      const res = await parseDriveExcel(buf, {
        estudioDefault: estudioFijo ?? (estudioDef || null),
        forzarEstudio: estudioFijo !== null,
        creadoPor,
        existentes,
      });
      setResultado(res);
    } catch (e) {
      setError('No se pudo leer el archivo: ' + (e instanceof Error ? e.message : String(e)));
    } finally {
      setAnalizando(false);
    }
  }

  async function onArchivo(e: React.ChangeEvent<HTMLInputElement>) {
    const f = e.target.files?.[0];
    if (!f) return;
    setNombreArchivo(f.name);
    // CSV se lee como texto para respetar UTF-8 (tildes, Ñ, °); Excel como binario
    const buf = f.name.toLowerCase().endsWith('.csv') ? await f.text() : await f.arrayBuffer();
    setBuffer(buf);
    void analizar(buf, estudioDefault);
  }

  function onCambioEstudio(v: string) {
    setEstudioDefault(v);
    if (buffer) void analizar(buffer, v);
  }

  async function onImportar() {
    if (!resultado || resultado.filas.length === 0 || guardando) return;
    setGuardando(true);
    setError(null);
    const LOTE = 500;
    try {
      for (let i = 0; i < resultado.filas.length; i += LOTE) {
        const { error: insErr } = await supabase
          .from('drive_siniestros')
          .insert(resultado.filas.slice(i, i + LOTE));
        if (insErr) throw new Error(insErr.message);
        setProgreso(Math.min(resultado.filas.length, i + LOTE));
      }
      onImported();
    } catch (e) {
      setError(
        'Error al guardar: ' + (e instanceof Error ? e.message : String(e)) +
        (progreso > 0 ? ` (se alcanzaron a guardar ${progreso} casos; corrige el archivo y vuelve a subirlo — los ya guardados se omitirán como duplicados)` : '')
      );
      setGuardando(false);
    }
  }

  const listos = resultado?.filas.length ?? 0;

  return (
    <div
      className="fixed inset-0 z-50 flex items-start justify-center bg-black/60 backdrop-blur-sm fade-in p-4 sm:p-8 overflow-y-auto"
      onClick={() => !guardando && onClose()}
    >
      <div
        className="w-full max-w-2xl rounded-2xl border border-white/10 bg-ink-800 shadow-2xl text-slate-200"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between border-b border-white/[0.06] px-5 py-4">
          <div>
            <h2 className="text-base font-semibold text-white">Importar siniestros desde Excel</h2>
            <p className="text-[11px] text-slate-500 mt-0.5">
              Sube el reporte mensual (.xlsx, .xls o .csv). Reconocemos las columnas automáticamente y
              adaptamos los datos al formato de la base. Los casos ya registrados se omiten.
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            disabled={guardando}
            className="rounded-full p-1.5 text-slate-400 hover:bg-white/10 hover:text-white transition disabled:opacity-40"
            aria-label="Cerrar"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>
        </div>

        <div className="max-h-[70vh] overflow-y-auto px-5 py-4 space-y-4">
          {/* Paso 1: estudio (solo Pacífico) + archivo */}
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
            {estudioFijo === null && (
              <FField label="Estudio (si el Excel no lo indica)">
                <select value={estudioDefault} onChange={(e) => onCambioEstudio(e.target.value)} className={baseInput}>
                  <option value="" className="bg-ink-800">— Usar columna ESTUDIO del Excel —</option>
                  {DRIVE_ESTUDIOS.map((es) => (
                    <option key={es} value={es} className="bg-ink-800">{es}</option>
                  ))}
                </select>
              </FField>
            )}
            <FField label="Archivo Excel *">
              <label className={cn(
                baseInput,
                'flex items-center gap-2 cursor-pointer hover:bg-card-hover',
                guardando && 'pointer-events-none opacity-50'
              )}>
                <svg className="h-4 w-4 shrink-0 text-slate-400" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M10 17a1 1 0 01-1-1V9.414l-1.793 1.793a1 1 0 11-1.414-1.414l3.5-3.5a1 1 0 011.414 0l3.5 3.5a1 1 0 11-1.414 1.414L11 9.414V16a1 1 0 01-1 1z" />
                  <path d="M4 4a1 1 0 011-1h10a1 1 0 110 2H5a1 1 0 01-1-1z" />
                </svg>
                <span className="truncate text-slate-300">{nombreArchivo ?? 'Elegir archivo…'}</span>
                <input type="file" accept=".xlsx,.xls,.csv" onChange={onArchivo} className="hidden" />
              </label>
            </FField>
          </div>

          {estudioFijo !== null && (
            <p className="text-[11px] text-slate-500">
              Todos los casos se registrarán a nombre de <span className="text-slate-300">{estudioFijo}</span>.
            </p>
          )}

          {analizando && <div className="py-6 text-center text-sm text-slate-500">Analizando el archivo…</div>}

          {/* Paso 2: resumen del análisis */}
          {resultado && !analizando && (
            <div className="space-y-3">
              <div className="flex flex-wrap gap-2">
                <span className="rounded-full bg-emerald-500/15 px-2.5 py-1 text-[11px] font-medium text-emerald-300">
                  {listos} casos listos para importar
                </span>
                {resultado.duplicados.length > 0 && (
                  <span className="rounded-full bg-amber-500/15 px-2.5 py-1 text-[11px] font-medium text-amber-300"
                        title={resultado.duplicados.slice(0, 20).join(', ')}>
                    {resultado.duplicados.length} ya registrados (se omiten)
                  </span>
                )}
                {resultado.errores.length > 0 && (
                  <span className="rounded-full bg-red-500/15 px-2.5 py-1 text-[11px] font-medium text-red-300">
                    {resultado.errores.length} filas con problemas
                  </span>
                )}
              </div>

              {resultado.columnasIgnoradas.length > 0 && (
                <p className="text-[11px] text-slate-500">
                  Columnas no reconocidas (se ignoran): {resultado.columnasIgnoradas.join(' · ')}
                </p>
              )}

              {resultado.errores.length > 0 && (
                <div className="rounded-lg border border-red-500/20 bg-red-500/5 p-3 space-y-1">
                  {resultado.errores.slice(0, 5).map((e, i) => (
                    <p key={i} className="text-[12px] text-red-300/90">{e}</p>
                  ))}
                  {resultado.errores.length > 5 && (
                    <p className="text-[11px] text-red-300/60">…y {resultado.errores.length - 5} más.</p>
                  )}
                </div>
              )}

              {/* Vista previa */}
              {listos > 0 && (
                <div className="rounded-lg border border-white/[0.06] overflow-x-auto">
                  <table className="w-full text-left text-xs">
                    <thead>
                      <tr className="text-[10px] font-semibold uppercase tracking-wider text-slate-500 border-b border-white/[0.06]">
                        <Th>Siniestro</Th><Th>Año</Th><Th>Mes</Th><Th>Abogado</Th><Th>Lesión principal</Th><Th>Estado</Th><Th>Estudio</Th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-white/[0.04]">
                      {resultado.filas.slice(0, 5).map((f, i) => (
                        <tr key={i}>
                          <Td className="font-mono">{f.siniestro}</Td>
                          <Td>{f.anio ?? '—'}</Td>
                          <Td>{f.mes ?? '—'}</Td>
                          <Td>{f.abogado ?? '—'}</Td>
                          <Td>{f.lesion_principal ?? '—'}</Td>
                          <Td>{f.estado}</Td>
                          <Td>{f.estudio}</Td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                  {listos > 5 && (
                    <p className="px-3 py-2 text-[11px] text-slate-500 border-t border-white/[0.06]">
                      …y {(listos - 5).toLocaleString('es-PE')} casos más.
                    </p>
                  )}
                </div>
              )}
            </div>
          )}

          {error && (
            <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-sm text-red-300">{error}</div>
          )}
        </div>

        <div className="flex items-center gap-2 border-t border-white/[0.06] px-5 py-4">
          <button
            type="button"
            onClick={onImportar}
            disabled={listos === 0 || guardando || analizando}
            className="inline-flex items-center rounded-lg bg-pago px-4 py-2 text-sm font-semibold text-white hover:bg-cyan-600 transition disabled:opacity-50"
          >
            {guardando
              ? `Guardando… ${progreso}/${listos}`
              : listos > 0
              ? `Importar ${listos.toLocaleString('es-PE')} casos`
              : 'Importar'}
          </button>
          <button
            type="button"
            onClick={onClose}
            disabled={guardando}
            className="inline-flex items-center rounded-lg border border-white/[0.08] px-4 py-2 text-sm font-medium text-slate-400 hover:bg-white/[0.03] hover:text-slate-200 transition disabled:opacity-40"
          >
            Cancelar
          </button>
        </div>
      </div>
    </div>
  );
}
