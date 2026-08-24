'use client';

import { FormEvent, useEffect, useMemo, useState } from 'react';
import { supabase } from '@/lib/supabase';
import type { DriveSiniestro } from '@/lib/types';
import { useUser } from './UserContext';
import { cn, formatFechaSolo } from '@/lib/utils';
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
  esCodigoSiniestroValido,
  exportDriveExcel,
  indexarExistentes,
  parseDriveExcel,
  type DriveImportResult,
} from '@/lib/driveExcel';
import { DriveResumen } from './DriveResumen';
import { baseInput, FField } from './ui/FormField';
import { DriveInformeModal } from './DriveInformeModal';
import { DriveDetalleModal } from './DriveDetalleModal';

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
  /** Caso abierto en el detalle (ahí vive la info que la tabla no muestra) */
  const [detalle, setDetalle] = useState<DriveSiniestro | null>(null);
  /** Panel de limpieza de filas basura de importaciones viejas */
  const [limpiando, setLimpiando] = useState(false);
  const [mostrarResumen, setMostrarResumen] = useState(true);

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

  /**
   * Filas que no son casos: importaciones viejas metieron bajo la columna
   * SINIESTRO textos del informe (direcciones, "PLACA DEL VEHÍCULO TERCERO…").
   * Se listan aparte para poder borrarlas de una vez.
   */
  const invalidos = useMemo(
    () => visibles.filter((r) => !esCodigoSiniestroValido(r.siniestro)),
    [visibles]
  );

  /** Borra las filas basura (solo Pacífico, que ve toda la base). */
  async function borrarInvalidos() {
    if (invalidos.length === 0) return;
    const ids = invalidos.map((r) => r.id);
    setLimpiando(false);
    const LOTE = 200;
    for (let i = 0; i < ids.length; i += LOTE) {
      const { error } = await supabase
        .from('drive_siniestros')
        .delete()
        .in('id', ids.slice(i, i + LOTE));
      if (error) {
        alert('Error al limpiar: ' + error.message);
        break;
      }
    }
    await cargar();
  }

  /**
   * Lo que alimenta el resumen: todo lo que el usuario puede ver, acotado al
   * estudio elegido. No usa los filtros de año/mes porque el resumen tiene su
   * propio selector de periodo.
   */
  const registrosResumen = useMemo(() => {
    if (esPacifico && filtroEstudio) return visibles.filter((r) => r.estudio === filtroEstudio);
    return visibles;
  }, [visibles, esPacifico, filtroEstudio]);

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
          (r.placa_asegurado ?? '').toLowerCase().includes(q) ||
          (r.nro_caso ?? '').toLowerCase().includes(q) ||
          (r.nro_caso_estudio ?? '').toLowerCase().includes(q) ||
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
            onClick={() => setMostrarResumen((v) => !v)}
            title="Mostrar u ocultar el resumen de abiertos y cerrados"
            className={cn(
              'inline-flex items-center gap-1.5 rounded-lg border px-3.5 py-2 text-sm font-medium transition',
              mostrarResumen
                ? 'border-white/[0.16] bg-white/[0.07] text-white'
                : 'border-white/[0.08] bg-white/[0.03] text-slate-300 hover:bg-white/[0.06] hover:text-white'
            )}
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M3 12h3v5H3v-5zm5.5-5h3v10h-3V7zM14 3h3v14h-3V3z" />
            </svg>
            Resumen
          </button>
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
            placeholder="Buscar código, placa, abogado…"
            value={busqueda}
            onChange={(e) => setBusqueda(e.target.value)}
            className="w-52 rounded-lg bg-white/[0.03] border border-white/[0.06] px-9 py-1.5 text-sm text-slate-200 placeholder:text-slate-500 focus:outline-none focus:border-white/20"
          />
        </div>
        <span className="ml-auto text-[11px] font-medium text-slate-500">
          {filtrados.length.toLocaleString('es-PE')} resultados
        </span>
      </div>

      {/* Resumen de abiertos y cerrados (v13) */}
      {!loading && mostrarResumen && estudioUsuario !== '__ninguno__' && (
        <DriveResumen registros={registrosResumen} mostrarCorte={esPacifico} />
      )}

      {/* Filas basura de importaciones anteriores */}
      {!loading && invalidos.length > 0 && (
        <div className="rounded-xl border border-amber-500/25 bg-amber-500/[0.07] p-3.5">
          <div className="flex flex-wrap items-start gap-3">
            <svg className="h-4 w-4 shrink-0 text-amber-300 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
              <path fillRule="evenodd" d="M8.485 2.495c.673-1.167 2.357-1.167 3.03 0l6.28 10.875c.673 1.167-.17 2.625-1.516 2.625H3.72c-1.347 0-2.189-1.458-1.515-2.625L8.485 2.495zM10 6a.75.75 0 01.75.75v3.5a.75.75 0 01-1.5 0v-3.5A.75.75 0 0110 6zm0 9a1 1 0 100-2 1 1 0 000 2z" clipRule="evenodd" />
            </svg>
            <div className="min-w-0 flex-1">
              <div className="text-xs font-semibold text-amber-200">
                {invalidos.length.toLocaleString('es-PE')}{' '}
                {invalidos.length === 1 ? 'fila no es un caso' : 'filas no son casos'}
              </div>
              <p className="mt-0.5 text-[11px] text-slate-400 leading-snug">
                Entraron en una importación anterior: bajo la columna del número de siniestro venía
                texto del informe (direcciones, placas de terceros). Ya no vuelve a pasar, pero
                conviene sacarlas de la base.
              </p>
              <ul className="mt-1.5 space-y-0.5">
                {invalidos.slice(0, 3).map((r) => (
                  <li key={r.id} className="truncate text-[11px] text-slate-500">
                    · {r.siniestro}
                  </li>
                ))}
                {invalidos.length > 3 && (
                  <li className="text-[11px] text-slate-600">
                    …y {(invalidos.length - 3).toLocaleString('es-PE')} más.
                  </li>
                )}
              </ul>
            </div>
            {esPacifico && (
              <button
                onClick={() => setLimpiando(true)}
                className="shrink-0 rounded-lg border border-amber-500/40 bg-amber-500/15 px-3 py-1.5 text-xs font-semibold text-amber-200 hover:bg-amber-500/25 transition"
              >
                Limpiar
              </button>
            )}
          </div>
        </div>
      )}

      {limpiando && (
        <ConfirmarLimpieza
          cantidad={invalidos.length}
          ejemplos={invalidos.slice(0, 8).map((r) => r.siniestro)}
          onCancelar={() => setLimpiando(false)}
          onConfirmar={borrarInvalidos}
        />
      )}

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
              onAbrirDetalle={setDetalle}
            />
          ))}
        </div>
      )}

      {agregando && (
        <DriveInformeModal
          estudioFijo={esPacifico ? null : estudioUsuario === '__ninguno__' ? null : estudioUsuario}
          // El abogado se autocompleta con el usuario logueado (Pacífico lo escribe a mano).
          abogadoFijo={esPacifico ? null : usuario?.nombre ?? null}
          creadoPor={usuario?.nombre ?? 'desconocido'}
          usuario={usuario ?? null}
          onClose={() => setAgregando(false)}
          onCreated={() => {
            setAgregando(false);
            void cargar();
          }}
        />
      )}

      {detalle && (
        <DriveDetalleModal
          registro={detalle}
          usuario={usuario ?? null}
          puedeEditar={esPacifico || detalle.estudio === estudioUsuario}
          onClose={() => setDetalle(null)}
          onUpdated={(r) => {
            setDetalle(r);
            setRegistros((prev) => prev.map((x) => (x.id === r.id ? r : x)));
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

/* ---------------- Confirmación de limpieza ---------------- */

function ConfirmarLimpieza({
  cantidad,
  ejemplos,
  onCancelar,
  onConfirmar,
}: {
  cantidad: number;
  ejemplos: string[];
  onCancelar: () => void;
  onConfirmar: () => void;
}) {
  return (
    <div
      className="fixed inset-0 z-50 grid place-items-center bg-black/60 backdrop-blur-sm fade-in p-4"
      onClick={onCancelar}
    >
      <div
        className="w-full max-w-md rounded-2xl border border-white/10 bg-ink-800 p-5 shadow-2xl text-slate-200"
        onClick={(e) => e.stopPropagation()}
      >
        <h2 className="text-base font-semibold text-white">
          Borrar {cantidad.toLocaleString('es-PE')} {cantidad === 1 ? 'fila' : 'filas'} del Drive
        </h2>
        <p className="mt-1 text-xs text-slate-400 leading-relaxed">
          No son casos: en la columna del número de siniestro tienen texto suelto. Se borran de la
          base y no se pueden recuperar. Los casos con número válido no se tocan.
        </p>
        <div className="mt-3 max-h-44 space-y-1 overflow-y-auto rounded-lg border border-white/[0.06] bg-white/[0.02] p-2.5">
          {ejemplos.map((e, i) => (
            <p key={i} className="truncate text-[11px] text-slate-400">{e}</p>
          ))}
          {cantidad > ejemplos.length && (
            <p className="text-[11px] text-slate-600">
              …y {(cantidad - ejemplos.length).toLocaleString('es-PE')} más.
            </p>
          )}
        </div>
        <div className="mt-4 flex gap-2">
          <button
            onClick={onConfirmar}
            className="inline-flex items-center rounded-lg border border-red-500/40 bg-red-500/15 px-4 py-2 text-sm font-semibold text-red-300 hover:bg-red-500/25 transition"
          >
            Sí, borrarlas
          </button>
          <button
            onClick={onCancelar}
            className="inline-flex items-center rounded-lg border border-white/[0.08] px-4 py-2 text-sm font-medium text-slate-400 hover:bg-white/[0.03] hover:text-slate-200 transition"
          >
            Cancelar
          </button>
        </div>
      </div>
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
  onAbrirDetalle,
}: {
  mes: string;
  items: DriveSiniestro[];
  esPacifico: boolean;
  mostrarAnio: boolean;
  onToggleFlag: (r: DriveSiniestro, campo: 'flag_fallecido' | 'flag_unidad_retenida') => void;
  onAbrirDetalle: (r: DriveSiniestro) => void;
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
        <div className="max-h-[70vh] overflow-auto">
          <table className="w-full text-left text-xs">
            <thead className="sticky top-0 z-10 bg-ink-800/95 backdrop-blur-sm">
              <tr className="border-t border-white/[0.06] text-[10px] font-semibold uppercase tracking-wider text-slate-500">
                <Th>Alertas</Th>
                <Th>Siniestro</Th>
                <Th>Placa</Th>
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
                <Th />

              </tr>
            </thead>
            <tbody className="divide-y divide-white/[0.04]">
              {items.map((r) => {
                const fallecido = esFallecido(r);
                const retenida = esUnidadRetenida(r);
                return (
                <tr
                  key={r.id}
                  onClick={() => onAbrirDetalle(r)}
                  title="Ver el informe completo del caso"
                  className={cn(
                    'transition border-l-2 cursor-pointer',
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
                    <span className="inline-flex max-w-[12rem] items-center gap-1.5">
                      <span className="truncate" title={r.siniestro}>{r.siniestro}</span>
                      {fallecido && <FallecidoIcon className="h-3.5 w-3.5 text-red-400" />}
                      {retenida && <VehiculoIcon className="h-3.5 w-3.5 text-amber-400" />}
                    </span>
                  </Td>
                  <TdTexto valor={r.placa_asegurado} ancho="max-w-[9rem]" className="font-mono text-slate-200" />
                  {mostrarAnio && <Td>{r.anio ?? '—'}</Td>}
                  <Td>{r.fecha_registro ? formatFechaSolo(r.fecha_registro) : '—'}</Td>
                  <TdTexto valor={r.distrito} ancho="max-w-[10rem]" />
                  <TdTexto valor={r.abogado} ancho="max-w-[11rem]" />
                  <TdTexto valor={r.lesion_principal} ancho="max-w-[12rem]" />
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
                  <TdTexto valor={r.sub_estado} ancho="max-w-[12rem]" />
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
                  {esPacifico && <TdTexto valor={r.estudio} ancho="max-w-[12rem]" />}
                  <Td className="text-right text-slate-500">
                    <span className="whitespace-nowrap text-[11px] font-medium">Ver detalle →</span>
                  </Td>
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
      // La fila abre el detalle: el toggle de alerta no debe dispararlo.
      onClick={(e) => {
        e.stopPropagation();
        onClick();
      }}
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

/**
 * Celda de texto libre (placa, distrito, lesión, sub estado). Corta lo que no
 * entra en vez de estirar la fila: un valor sucio no descuadra toda la tabla.
 */
function TdTexto({
  valor,
  ancho = 'max-w-[14rem]',
  className,
}: {
  valor: string | null | undefined;
  ancho?: string;
  className?: string;
}) {
  const v = valor?.trim() || '—';
  return (
    <td className={cn('px-3 py-2 text-slate-300', className)}>
      <span className={cn('block truncate', ancho)} title={v === '—' ? undefined : v}>
        {v}
      </span>
    </td>
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

  // Casos ya registrados: los nuevos se insertan y los repetidos se actualizan.
  const existentes = useMemo(() => indexarExistentes(registrosExistentes), [registrosExistentes]);

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
    if (!resultado || guardando) return;
    const totalNuevos = resultado.filas.length;
    const totalCambios = resultado.actualizaciones.length;
    if (totalNuevos + totalCambios === 0) return;

    setGuardando(true);
    setError(null);
    let hechos = 0;
    const LOTE = 500;
    try {
      // 1) Altas
      for (let i = 0; i < totalNuevos; i += LOTE) {
        const { error: insErr } = await supabase
          .from('drive_siniestros')
          .insert(resultado.filas.slice(i, i + LOTE));
        if (insErr) throw new Error(insErr.message);
        hechos = Math.min(totalNuevos, i + LOTE);
        setProgreso(hechos);
      }
      // 2) Actualizaciones — una por caso, en tandas para no saturar la conexión.
      const TANDA = 20;
      for (let i = 0; i < totalCambios; i += TANDA) {
        const tanda = resultado.actualizaciones.slice(i, i + TANDA);
        const res = await Promise.all(
          tanda.map((u) => supabase.from('drive_siniestros').update(u.patch).eq('id', u.id))
        );
        const fallo = res.find((r) => r.error);
        if (fallo?.error) throw new Error(fallo.error.message);
        hechos = totalNuevos + Math.min(totalCambios, i + TANDA);
        setProgreso(hechos);
      }
      onImported();
    } catch (e) {
      setError(
        'Error al guardar: ' + (e instanceof Error ? e.message : String(e)) +
        (hechos > 0
          ? ` (se alcanzaron a procesar ${hechos} casos; corrige el archivo y vuelve a subirlo — los ya guardados se detectarán como existentes)`
          : '')
      );
      setGuardando(false);
    }
  }

  const listos = resultado?.filas.length ?? 0;
  const aActualizar = resultado?.actualizaciones.length ?? 0;
  const total = listos + aActualizar;

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
              adaptamos los datos al formato de la base. Los casos nuevos se agregan y los que ya
              estaban se actualizan con lo que diga el Excel.
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
                  {listos} casos nuevos
                </span>
                {aActualizar > 0 && (
                  <span className="rounded-full bg-cyan-500/15 px-2.5 py-1 text-[11px] font-medium text-cyan-300">
                    {aActualizar} casos ya registrados se actualizarán
                  </span>
                )}
                {resultado.sinCambios > 0 && (
                  <span className="rounded-full bg-white/[0.06] px-2.5 py-1 text-[11px] font-medium text-slate-400">
                    {resultado.sinCambios} sin cambios
                  </span>
                )}
                {resultado.omitidasSinCodigo > 0 && (
                  <span className="rounded-full bg-amber-500/15 px-2.5 py-1 text-[11px] font-medium text-amber-300">
                    {resultado.omitidasSinCodigo} filas omitidas (no son casos)
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

              {resultado.omitidasSinCodigo > 0 && (
                <p className="text-[11px] text-slate-500 leading-snug">
                  Las filas omitidas traían texto donde va el número de siniestro (líneas del
                  informe, notas al pie, encabezados repetidos). No entran al Drive.
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

              {/* Casos existentes que el Excel va a pisar */}
              {aActualizar > 0 && (
                <div className="rounded-lg border border-cyan-500/20 bg-cyan-500/[0.06] p-3 space-y-2">
                  <p className="text-[12px] font-medium text-cyan-200">
                    Se detectaron {aActualizar} casos ya registrados con datos distintos. Manda el
                    Excel: se van a actualizar. Las celdas vacías no borran lo que ya estaba.
                  </p>
                  <div className="max-h-40 space-y-1.5 overflow-y-auto">
                    {resultado.actualizaciones.slice(0, 12).map((u) => (
                      <div key={u.id} className="text-[11.5px] leading-snug">
                        <span className="font-mono font-semibold text-slate-200">{u.siniestro}</span>
                        <span className="text-slate-500"> · {u.cambios.join(' · ')}</span>
                      </div>
                    ))}
                    {aActualizar > 12 && (
                      <p className="text-[11px] text-slate-500">
                        …y {(aActualizar - 12).toLocaleString('es-PE')} casos más.
                      </p>
                    )}
                  </div>
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
            disabled={total === 0 || guardando || analizando}
            className="inline-flex items-center rounded-lg bg-pago px-4 py-2 text-sm font-semibold text-white hover:bg-cyan-600 transition disabled:opacity-50"
          >
            {guardando
              ? `Guardando… ${progreso}/${total}`
              : total > 0
              ? `Importar ${listos.toLocaleString('es-PE')} y actualizar ${aActualizar.toLocaleString('es-PE')}`
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
