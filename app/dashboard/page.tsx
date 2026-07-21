'use client';

import { useEffect, useMemo, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import type { Siniestro, SiniestroMovimiento, TipoSiniestro, Usuario, UsuarioAcceso } from '@/lib/types';
import { BarChart, LineChart, MetricCard } from '@/components/DashboardCharts';
import { useUser } from '@/components/UserContext';
import { puedeVerRuta, rutaInicialPara } from '@/lib/permissions';
import { TIPO_LABELS } from '@/lib/workflows';

type RangoFiltro = '7d' | '30d' | '90d' | 'mes-actual' | 'año-actual' | 'todo' | 'custom';
type TipoFiltro = TipoSiniestro | 'todos';
type Granularidad = 'semana' | 'mes';

function inicioMesActual() {
  const d = new Date();
  return new Date(d.getFullYear(), d.getMonth(), 1);
}
function inicioAñoActual() {
  return new Date(new Date().getFullYear(), 0, 1);
}

// ---------- Helpers de montos (v10) ----------

/** Sumas separadas por moneda */
interface Sumas {
  PEN: number;
  USD: number;
}

function sumarMontos(list: Siniestro[]): Sumas {
  const out: Sumas = { PEN: 0, USD: 0 };
  for (const s of list) {
    if (s.monto == null) continue;
    if (s.moneda === 'USD') out.USD += Number(s.monto);
    else out.PEN += Number(s.monto);
  }
  return out;
}

function fmtMoney(n: number, moneda: 'PEN' | 'USD' = 'PEN'): string {
  const sym = moneda === 'USD' ? '$' : 'S/';
  return `${sym} ${n.toLocaleString('es-PE', { maximumFractionDigits: 0 })}`;
}

/** Valor principal (PEN) + nota si además hay USD */
function moneyDisplay(s: Sumas): { value: string; extra: string | null } {
  if (s.PEN === 0 && s.USD > 0) return { value: fmtMoney(s.USD, 'USD'), extra: null };
  return { value: fmtMoney(s.PEN, 'PEN'), extra: s.USD > 0 ? `+ ${fmtMoney(s.USD, 'USD')}` : null };
}

// ---------- Helpers de buckets de tiempo ----------

function claveMes(d: Date): string {
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
}
function labelMes(clave: string): string {
  const [year, mm] = clave.split('-');
  const monthLabel = new Date(Number(year), Number(mm) - 1).toLocaleString('es-PE', { month: 'short' });
  return `${monthLabel} ${year.slice(2)}`;
}
/** Lunes de la semana de la fecha, como clave YYYY-MM-DD */
function claveSemana(d: Date): string {
  const lunes = new Date(d);
  lunes.setDate(d.getDate() - ((d.getDay() + 6) % 7));
  return `${lunes.getFullYear()}-${String(lunes.getMonth() + 1).padStart(2, '0')}-${String(lunes.getDate()).padStart(2, '0')}`;
}
function labelSemana(clave: string): string {
  const [y, m, dd] = clave.split('-').map(Number);
  const d = new Date(y, m - 1, dd);
  return d.toLocaleDateString('es-PE', { day: 'numeric', month: 'short' });
}

/** Cuenta elementos por bucket temporal y devuelve la serie ordenada */
function serieTemporal(
  fechas: Date[],
  gran: Granularidad
): { label: string; value: number }[] {
  const buckets = new Map<string, number>();
  for (const f of fechas) {
    const key = gran === 'mes' ? claveMes(f) : claveSemana(f);
    buckets.set(key, (buckets.get(key) ?? 0) + 1);
  }
  return Array.from(buckets.entries())
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([k, v]) => ({ label: gran === 'mes' ? labelMes(k) : labelSemana(k), value: v }));
}

export default function DashboardPage() {
  const { usuario, usuarios, loading: loadingUser } = useUser();
  const router = useRouter();
  const [siniestros, setSiniestros] = useState<Siniestro[]>([]);
  const [movimientos, setMovimientos] = useState<SiniestroMovimiento[]>([]);
  const [accesos, setAccesos] = useState<UsuarioAcceso[]>([]);
  const [loading, setLoading] = useState(true);
  const [rango, setRango] = useState<RangoFiltro>('30d');
  const [desdeCustom, setDesdeCustom] = useState('');
  const [hastaCustom, setHastaCustom] = useState('');
  const [tipoFiltro, setTipoFiltro] = useState<TipoFiltro>('todos');
  const [responsableFiltro, setResponsableFiltro] = useState('');
  const [granularidad, setGranularidad] = useState<Granularidad>('semana');

  useEffect(() => {
    if (!loadingUser && usuario && !puedeVerRuta(usuario, '/dashboard')) {
      router.replace(rutaInicialPara(usuario));
    }
  }, [usuario, loadingUser, router]);

  useEffect(() => {
    async function cargar() {
      const [{ data: s }, { data: m }, { data: a }] = await Promise.all([
        supabase.from('siniestros').select('*'),
        supabase.from('siniestro_movimientos').select('*').order('timestamp', { ascending: true }),
        supabase.from('usuario_accesos').select('*').order('fecha', { ascending: false }),
      ]);
      setSiniestros(s ?? []);
      setMovimientos(m ?? []);
      setAccesos(a ?? []);
      setLoading(false);
    }
    void cargar();
  }, []);

  // Resolver rango → [desde, hasta]
  const [desde, hasta] = useMemo<[Date | null, Date | null]>(() => {
    const ahora = new Date();
    if (rango === 'todo') return [null, null];
    if (rango === 'mes-actual') return [inicioMesActual(), ahora];
    if (rango === 'año-actual') return [inicioAñoActual(), ahora];
    if (rango === 'custom') {
      return [desdeCustom ? new Date(desdeCustom) : null, hastaCustom ? new Date(hastaCustom) : null];
    }
    const dias = rango === '7d' ? 7 : rango === '30d' ? 30 : 90;
    const d = new Date(ahora);
    d.setDate(d.getDate() - dias);
    return [d, ahora];
  }, [rango, desdeCustom, hastaCustom]);

  const responsablesPosibles = useMemo(() => {
    const set = new Set<string>();
    for (const m of movimientos) set.add(m.movido_por);
    for (const s of siniestros) if (s.asignado_a) set.add(s.asignado_a);
    return Array.from(set).sort();
  }, [movimientos, siniestros]);

  function pasaFiltros(s: Siniestro): boolean {
    if (tipoFiltro !== 'todos' && s.tipo !== tipoFiltro) return false;
    if (responsableFiltro && s.asignado_a !== responsableFiltro) return false;
    const created = new Date(s.created_at);
    if (desde && created < desde) return false;
    if (hasta && created > hasta) return false;
    return true;
  }

  const siniestrosFiltrados = useMemo(() => siniestros.filter(pasaFiltros), [
    siniestros,
    tipoFiltro,
    responsableFiltro,
    desde,
    hasta,
  ]);

  /** Estudio del solicitante (abogado → su estudio; equipo interno → "Pacífico") */
  const estudioDe = useMemo(() => {
    const map = new Map<string, string>();
    for (const u of usuarios) {
      map.set(u.nombre, u.rol === 'abogado' ? (u.estudio ?? 'Sin estudio') : 'Pacífico');
    }
    return (solicitante: string) => map.get(solicitante) ?? 'Sin estudio';
  }, [usuarios]);

  // Métricas principales
  const metrics = useMemo(() => {
    const pendientes = siniestrosFiltrados.filter((s) => !s.closed_at);
    const cerrados = siniestrosFiltrados.filter((s) => s.closed_at);
    // Promedio de días desde solicitud hasta cierre (closed_at - created_at)
    const promedioCierre =
      cerrados.length === 0
        ? 0
        : cerrados.reduce((acc, s) => {
            const d1 = new Date(s.created_at).getTime();
            const d2 = new Date(s.closed_at!).getTime();
            return acc + (d2 - d1) / (1000 * 60 * 60 * 24);
          }, 0) / cerrados.length;

    const pendientesPorTipo: Record<TipoSiniestro, number> = {
      pago: 0,
      reembolso: 0,
      deducible: 0,
      valorizacion: 0,
      info_poliza: 0,
    };
    for (const s of pendientes) pendientesPorTipo[s.tipo]++;

    return { pendientes, cerrados, promedioCierre, pendientesPorTipo };
  }, [siniestrosFiltrados]);

  // ---------- v10: métricas de montos ----------
  const montos = useMemo(() => {
    const de = (tipo: TipoSiniestro, cerrado: boolean) =>
      siniestrosFiltrados.filter((s) => s.tipo === tipo && (cerrado ? !!s.closed_at : !s.closed_at));

    const pagosCerrados = de('pago', true);
    const pagosPendientes = de('pago', false);
    const dedCerrados = de('deducible', true);
    const dedPendientes = de('deducible', false);
    const reemCerrados = de('reembolso', true);
    const reemPendientes = de('reembolso', false);

    // Pago promedio por siniestro (solo PEN, pagos con monto)
    const pagosConMontoPEN = siniestrosFiltrados.filter(
      (s) => s.tipo === 'pago' && s.monto != null && s.moneda !== 'USD'
    );
    const pagoPromedio =
      pagosConMontoPEN.length === 0
        ? 0
        : pagosConMontoPEN.reduce((acc, s) => acc + Number(s.monto), 0) / pagosConMontoPEN.length;

    return {
      pagadoTerceros: sumarMontos(pagosCerrados),
      pagosPendientes: sumarMontos(pagosPendientes),
      dedCobrado: sumarMontos(dedCerrados),
      dedPendiente: sumarMontos(dedPendientes),
      reembolsado: sumarMontos(reemCerrados),
      reemPendiente: sumarMontos(reemPendientes),
      pagoPromedio,
      pagosConMontoCount: pagosConMontoPEN.length,
    };
  }, [siniestrosFiltrados]);

  // Monto pagado a terceros por mes (PEN, por fecha de cierre)
  const montoPagadoPorMes = useMemo(() => {
    const buckets = new Map<string, number>();
    for (const s of siniestrosFiltrados) {
      if (s.tipo !== 'pago' || !s.closed_at || s.monto == null || s.moneda === 'USD') continue;
      const key = claveMes(new Date(s.closed_at));
      buckets.set(key, (buckets.get(key) ?? 0) + Number(s.monto));
    }
    return Array.from(buckets.entries())
      .sort(([a], [b]) => a.localeCompare(b))
      .map(([k, v]) => ({ label: labelMes(k), value: Math.round(v) }));
  }, [siniestrosFiltrados]);

  // Monto cobrado en deducibles por mes (PEN, por fecha de cierre)
  const montoDeduciblesPorMes = useMemo(() => {
    const buckets = new Map<string, number>();
    for (const s of siniestrosFiltrados) {
      if (s.tipo !== 'deducible' || !s.closed_at || s.monto == null || s.moneda === 'USD') continue;
      const key = claveMes(new Date(s.closed_at));
      buckets.set(key, (buckets.get(key) ?? 0) + Number(s.monto));
    }
    return Array.from(buckets.entries())
      .sort(([a], [b]) => a.localeCompare(b))
      .map(([k, v]) => ({ label: labelMes(k), value: Math.round(v) }));
  }, [siniestrosFiltrados]);

  // Pago promedio por siniestro, por mes (PEN, por fecha de solicitud)
  const pagoPromedioPorMes = useMemo(() => {
    const buckets = new Map<string, { total: number; count: number }>();
    for (const s of siniestrosFiltrados) {
      if (s.tipo !== 'pago' || s.monto == null || s.moneda === 'USD') continue;
      const key = claveMes(new Date(s.created_at));
      const cur = buckets.get(key) ?? { total: 0, count: 0 };
      cur.total += Number(s.monto);
      cur.count += 1;
      buckets.set(key, cur);
    }
    return Array.from(buckets.entries())
      .sort(([a], [b]) => a.localeCompare(b))
      .map(([k, v]) => ({ label: labelMes(k), value: Math.round(v.total / v.count) }));
  }, [siniestrosFiltrados]);

  // Solicitudes por semana/mes por tipo (pagos, deducibles, reembolsos)
  const solicitudesPorTipo = useMemo(() => {
    const fechasDe = (tipo: TipoSiniestro) =>
      siniestrosFiltrados.filter((s) => s.tipo === tipo).map((s) => new Date(s.created_at));
    return {
      pago: serieTemporal(fechasDe('pago'), granularidad),
      deducible: serieTemporal(fechasDe('deducible'), granularidad),
      reembolso: serieTemporal(fechasDe('reembolso'), granularidad),
    };
  }, [siniestrosFiltrados, granularidad]);

  // Solicitudes por estudio (conteo) y monto promedio por estudio / por persona
  const porEstudio = useMemo(() => {
    const conteo = new Map<string, number>();
    const montoPorEstudio = new Map<string, { total: number; count: number }>();
    const montoPorPersona = new Map<string, { total: number; count: number }>();
    for (const s of siniestrosFiltrados) {
      const est = estudioDe(s.solicitante);
      conteo.set(est, (conteo.get(est) ?? 0) + 1);
      if (s.monto != null && s.moneda !== 'USD' && (s.tipo === 'pago' || s.tipo === 'reembolso')) {
        const ce = montoPorEstudio.get(est) ?? { total: 0, count: 0 };
        ce.total += Number(s.monto);
        ce.count += 1;
        montoPorEstudio.set(est, ce);
        const cp = montoPorPersona.get(s.solicitante) ?? { total: 0, count: 0 };
        cp.total += Number(s.monto);
        cp.count += 1;
        montoPorPersona.set(s.solicitante, cp);
      }
    }
    const solicitudes = Array.from(conteo.entries())
      .map(([label, value]) => ({ label, value }))
      .sort((a, b) => b.value - a.value);
    const promedioEstudio = Array.from(montoPorEstudio.entries())
      .map(([label, v]) => ({ label, value: Math.round(v.total / v.count) }))
      .sort((a, b) => b.value - a.value);
    const promedioPersona = Array.from(montoPorPersona.entries())
      .map(([label, v]) => ({ label, value: Math.round(v.total / v.count) }))
      .sort((a, b) => b.value - a.value)
      .slice(0, 12);
    return { solicitudes, promedioEstudio, promedioPersona };
  }, [siniestrosFiltrados, estudioDe]);

  // ---------- v10: accesos de abogados ----------
  const accesosAbogados = useMemo(() => {
    const abogados = usuarios.filter((u) => u.rol === 'abogado');
    const porUsuario = new Map<string, UsuarioAcceso[]>();
    for (const a of accesos) {
      const arr = porUsuario.get(a.usuario_nombre) ?? [];
      arr.push(a);
      porUsuario.set(a.usuario_nombre, arr);
    }
    const enRango = (fecha: string) => {
      const d = new Date(`${fecha}T12:00:00`);
      if (desde && d < desde) return false;
      if (hasta && d > hasta) return false;
      return true;
    };
    return abogados
      .map((u: Usuario) => {
        const suyos = porUsuario.get(u.nombre) ?? [];
        const diasEnRango = suyos.filter((a) => enRango(a.fecha)).length;
        const ultimo = suyos.length > 0 ? suyos.reduce((m, a) => (a.fecha > m ? a.fecha : m), suyos[0].fecha) : null;
        return { nombre: u.nombre, estudio: u.estudio ?? '—', diasEnRango, ultimo };
      })
      .sort((a, b) => {
        if (b.diasEnRango !== a.diasEnRango) return b.diasEnRango - a.diasEnRango;
        return (b.ultimo ?? '').localeCompare(a.ultimo ?? '');
      });
  }, [usuarios, accesos, desde, hasta]);

  // Tiempo promedio por etapa y por responsable (calculado a partir de movimientos)
  // Para cada par de movimientos consecutivos de un siniestro, el "responsable" del tramo es
  // quien tenía la tarjeta DESPUÉS del movimiento previo (o el creador si era el primero).
  // Usamos la duración entre movimientos para imputar tiempo al responsable.
  const tiemposPorResponsable = useMemo(() => {
    const filtradosIds = new Set(siniestrosFiltrados.map((s) => s.id));
    const sinMap = new Map(siniestros.map((s) => [s.id, s]));
    const porSiniestro = new Map<string, SiniestroMovimiento[]>();
    for (const m of movimientos) {
      if (!filtradosIds.has(m.siniestro_id)) continue;
      const arr = porSiniestro.get(m.siniestro_id) ?? [];
      arr.push(m);
      porSiniestro.set(m.siniestro_id, arr);
    }
    const totalPorRespMs = new Map<string, number>();
    const cuentaPorResp = new Map<string, number>();

    porSiniestro.forEach((movs, sid) => {
      const sin = sinMap.get(sid);
      if (!sin) return;
      const sorted = [...movs].sort((a, b) => new Date(a.timestamp).getTime() - new Date(b.timestamp).getTime());
      for (let i = 0; i < sorted.length; i++) {
        const m = sorted[i];
        const siguiente = sorted[i + 1];
        // Responsable de este tramo: el asignado tras este movimiento.
        // Para movimientos pasados podemos usar la regla de workflow estática (responsable de la etapa nueva).
        // Aquí simplificamos usando el responsable conocido si es el último, o derivando.
        const tramoFin = siguiente ? new Date(siguiente.timestamp).getTime() : Date.now();
        const tramoIni = new Date(m.timestamp).getTime();
        const ms = Math.max(0, tramoFin - tramoIni);
        // Quién era responsable en ese tramo: el actor del siguiente movimiento (quien lo movió) o, si no hay siguiente, el asignado actual.
        const resp = siguiente ? siguiente.movido_por : sin.asignado_a;
        if (!resp) continue;
        totalPorRespMs.set(resp, (totalPorRespMs.get(resp) ?? 0) + ms);
        cuentaPorResp.set(resp, (cuentaPorResp.get(resp) ?? 0) + 1);
      }
    });

    const out: { label: string; value: number }[] = [];
    totalPorRespMs.forEach((ms, resp) => {
      const horas = ms / (1000 * 60 * 60);
      const dias = horas / 24;
      out.push({ label: resp, value: Number(dias.toFixed(2)) });
    });
    return out.sort((a, b) => b.value - a.value);
  }, [movimientos, siniestrosFiltrados, siniestros]);

  // Cerrados por mes (últimos 12 meses dentro del rango)
  const cerradosPorMes = useMemo(() => {
    const buckets = new Map<string, number>();
    const cerrados = siniestrosFiltrados.filter((s) => s.closed_at);
    for (const s of cerrados) {
      const key = claveMes(new Date(s.closed_at!));
      buckets.set(key, (buckets.get(key) ?? 0) + 1);
    }
    const sorted = Array.from(buckets.entries()).sort(([a], [b]) => a.localeCompare(b));
    return sorted.map(([k, v]) => ({ label: labelMes(k), value: v }));
  }, [siniestrosFiltrados]);

  // Tendencia: promedio de días de cierre por mes
  const promedioPorMes = useMemo(() => {
    const buckets = new Map<string, { total: number; count: number }>();
    for (const s of siniestrosFiltrados) {
      if (!s.closed_at) continue;
      const key = claveMes(new Date(s.closed_at));
      const dias = (new Date(s.closed_at).getTime() - new Date(s.created_at).getTime()) / (1000 * 60 * 60 * 24);
      const cur = buckets.get(key) ?? { total: 0, count: 0 };
      cur.total += dias;
      cur.count += 1;
      buckets.set(key, cur);
    }
    const sorted = Array.from(buckets.entries()).sort(([a], [b]) => a.localeCompare(b));
    return sorted.map(([k, v]) => ({ label: labelMes(k), value: Number((v.total / v.count).toFixed(1)) }));
  }, [siniestrosFiltrados]);

  // Pendientes por tipo (bar chart)
  const pendientesChart = useMemo(
    () =>
      (['pago', 'deducible', 'valorizacion', 'info_poliza', 'reembolso'] as TipoSiniestro[]).map((t) => ({
        label: TIPO_LABELS[t].plural,
        value: metrics.pendientesPorTipo[t],
      })),
    [metrics]
  );

  if (loadingUser || !usuario) return null;
  if (!puedeVerRuta(usuario, '/dashboard')) return null;

  const dispPagado = moneyDisplay(montos.pagadoTerceros);
  const dispDedCobrado = moneyDisplay(montos.dedCobrado);
  const dispDedPendiente = moneyDisplay(montos.dedPendiente);
  const dispReembolsado = moneyDisplay(montos.reembolsado);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-white">KPIs</h1>
        <p className="text-sm text-white/60">
          Métricas y tendencias del área legal.
        </p>
      </div>

      {/* Filtros */}
      <div className="flex flex-wrap items-center gap-2 rounded-2xl panel p-3">
        <label className="text-[10px] font-semibold uppercase tracking-wider text-white/50">Rango</label>
        <select
          value={rango}
          onChange={(e) => setRango(e.target.value as RangoFiltro)}
          className="rounded-lg bg-white/5 border border-white/10 px-3 py-1.5 text-sm text-white focus:outline-none focus:border-pacifico-secondary"
        >
          <option value="7d" className="bg-ink-800">Últimos 7 días</option>
          <option value="30d" className="bg-ink-800">Últimos 30 días</option>
          <option value="90d" className="bg-ink-800">Últimos 90 días</option>
          <option value="mes-actual" className="bg-ink-800">Mes actual</option>
          <option value="año-actual" className="bg-ink-800">Año actual</option>
          <option value="todo" className="bg-ink-800">Todo</option>
          <option value="custom" className="bg-ink-800">Personalizado…</option>
        </select>
        {rango === 'custom' && (
          <>
            <input
              type="date"
              value={desdeCustom}
              onChange={(e) => setDesdeCustom(e.target.value)}
              className="rounded-lg bg-white/5 border border-white/10 px-2 py-1.5 text-sm text-white"
            />
            <span className="text-xs text-white/50">→</span>
            <input
              type="date"
              value={hastaCustom}
              onChange={(e) => setHastaCustom(e.target.value)}
              className="rounded-lg bg-white/5 border border-white/10 px-2 py-1.5 text-sm text-white"
            />
          </>
        )}
        <span className="mx-2 h-5 w-px bg-white/10" />
        <label className="text-[10px] font-semibold uppercase tracking-wider text-white/50">Tipo</label>
        <select
          value={tipoFiltro}
          onChange={(e) => setTipoFiltro(e.target.value as TipoFiltro)}
          className="rounded-lg bg-white/5 border border-white/10 px-3 py-1.5 text-sm text-white focus:outline-none focus:border-pacifico-secondary"
        >
          <option value="todos" className="bg-ink-800">Todos</option>
          <option value="pago" className="bg-ink-800">Pagos</option>
          <option value="reembolso" className="bg-ink-800">Reembolsos</option>
          <option value="deducible" className="bg-ink-800">Deducibles</option>
        </select>
        <label className="text-[10px] font-semibold uppercase tracking-wider text-white/50">Responsable</label>
        <select
          value={responsableFiltro}
          onChange={(e) => setResponsableFiltro(e.target.value)}
          className="rounded-lg bg-white/5 border border-white/10 px-3 py-1.5 text-sm text-white focus:outline-none focus:border-pacifico-secondary"
        >
          <option value="" className="bg-ink-800">Todos</option>
          {responsablesPosibles.map((r) => (
            <option key={r} value={r} className="bg-ink-800">{r}</option>
          ))}
        </select>
        <span className="ml-auto text-xs text-white/50">
          {siniestrosFiltrados.length} siniestros en el rango
        </span>
      </div>

      {loading ? (
        <div className="grid place-items-center py-16 text-white/40">Calculando KPIs…</div>
      ) : (
        <>
          {/* Cards de métricas principales */}
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            <MetricCard
              label="Pendientes"
              value={metrics.pendientes.length}
              hint={`${metrics.pendientesPorTipo.pago} pag · ${metrics.pendientesPorTipo.deducible} ded · ${metrics.pendientesPorTipo.valorizacion} val · ${metrics.pendientesPorTipo.info_poliza} ipo · ${metrics.pendientesPorTipo.reembolso} ree`}
              tone="primary"
              icon={
                <svg className="h-7 w-7" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" />
                </svg>
              }
            />
            <MetricCard
              label="Cerrados"
              value={metrics.cerrados.length}
              hint="En el rango seleccionado"
              tone="success"
              icon={
                <svg className="h-7 w-7" viewBox="0 0 20 20" fill="currentColor">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                </svg>
              }
            />
            <MetricCard
              label="Promedio cierre"
              value={`${metrics.promedioCierre.toFixed(1)}d`}
              hint="Desde solicitud a cierre"
            />
            <MetricCard
              label="Total"
              value={siniestrosFiltrados.length}
              hint="Filtrados en el rango"
            />
          </div>

          {/* v10 — Cards de montos */}
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            <MetricCard
              label="Pagado a terceros"
              value={dispPagado.value}
              hint={dispPagado.extra ?? 'Pagos cerrados en el rango'}
              tone="success"
            />
            <MetricCard
              label="Cobrado en deducibles"
              value={dispDedCobrado.value}
              hint={dispDedCobrado.extra ?? 'Deducibles cobrados en el rango'}
              tone="success"
            />
            <MetricCard
              label="Pendiente de cobro (ded.)"
              value={dispDedPendiente.value}
              hint={dispDedPendiente.extra ?? 'Deducibles aún no cobrados'}
              tone="warning"
            />
            <MetricCard
              label="Reembolsado"
              value={dispReembolsado.value}
              hint={dispReembolsado.extra ?? 'Reembolsos pagados en el rango'}
            />
          </div>
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            <MetricCard
              label="Pago promedio x siniestro"
              value={fmtMoney(Math.round(montos.pagoPromedio))}
              hint={`Sobre ${montos.pagosConMontoCount} pagos con monto (PEN)`}
              tone="primary"
            />
            <MetricCard
              label="Pagos por pagar"
              value={moneyDisplay(montos.pagosPendientes).value}
              hint={moneyDisplay(montos.pagosPendientes).extra ?? 'Pagos en curso (no cerrados)'}
            />
            <MetricCard
              label="Reembolsos por pagar"
              value={moneyDisplay(montos.reemPendiente).value}
              hint={moneyDisplay(montos.reemPendiente).extra ?? 'Reembolsos en curso'}
            />
            <MetricCard
              label="Solicitudes en el rango"
              value={siniestrosFiltrados.length}
              hint="Todas las gestiones solicitadas"
            />
          </div>

          {/* v10 — Montos en el tiempo */}
          <div className="grid gap-4 lg:grid-cols-2">
            <ChartCard title="Monto pagado a terceros por mes (S/)">
              <BarChart
                data={montoPagadoPorMes}
                color="#10B981"
                formatValue={(v) => fmtMoney(v)}
                emptyMessage="No hay pagos cerrados con monto en el rango."
              />
            </ChartCard>
            <ChartCard title="Monto cobrado en deducibles por mes (S/)">
              <BarChart
                data={montoDeduciblesPorMes}
                color="#F59E0B"
                formatValue={(v) => fmtMoney(v)}
                emptyMessage="No hay deducibles cobrados con monto en el rango."
              />
            </ChartCard>
            <ChartCard title="Pago promedio por siniestro, por mes (S/)" full>
              <LineChart
                data={pagoPromedioPorMes}
                color="#2EA1FF"
                formatValue={(v) => fmtMoney(Math.round(v))}
              />
            </ChartCard>
          </div>

          {/* v10 — Solicitudes por semana/mes por tipo */}
          <div className="rounded-2xl panel p-5 space-y-4">
            <div className="flex flex-wrap items-center justify-between gap-2">
              <h3 className="text-xs font-semibold uppercase tracking-[0.12em] text-white/60">
                Solicitudes por {granularidad === 'semana' ? 'semana' : 'mes'}
              </h3>
              <div className="flex rounded-lg bg-white/5 border border-white/10 p-0.5 text-xs">
                {(['semana', 'mes'] as Granularidad[]).map((g) => (
                  <button
                    key={g}
                    onClick={() => setGranularidad(g)}
                    className={`rounded-md px-3 py-1 font-semibold transition ${
                      granularidad === g ? 'bg-pacifico-secondary text-white' : 'text-white/50 hover:text-white'
                    }`}
                  >
                    {g === 'semana' ? 'Semana' : 'Mes'}
                  </button>
                ))}
              </div>
            </div>
            <div className="grid gap-6 lg:grid-cols-3">
              <div>
                <div className="mb-2 text-[11px] font-semibold uppercase tracking-wider text-white/40">Pagos</div>
                <BarChart data={solicitudesPorTipo.pago} color="#2EA1FF" emptyMessage="Sin pagos en el rango." />
              </div>
              <div>
                <div className="mb-2 text-[11px] font-semibold uppercase tracking-wider text-white/40">Deducibles</div>
                <BarChart data={solicitudesPorTipo.deducible} color="#F59E0B" emptyMessage="Sin deducibles en el rango." />
              </div>
              <div>
                <div className="mb-2 text-[11px] font-semibold uppercase tracking-wider text-white/40">Reembolsos</div>
                <BarChart data={solicitudesPorTipo.reembolso} color="#A78BFA" emptyMessage="Sin reembolsos en el rango." />
              </div>
            </div>
          </div>

          {/* v10 — Por estudio / por persona */}
          <div className="grid gap-4 lg:grid-cols-2">
            <ChartCard title="Solicitudes por estudio">
              <BarChart
                data={porEstudio.solicitudes}
                color="#0058D4"
                emptyMessage="Sin solicitudes en el rango."
              />
            </ChartCard>
            <ChartCard title="Monto promedio por estudio (pagos y reembolsos, S/)">
              <BarChart
                data={porEstudio.promedioEstudio}
                color="#10B981"
                formatValue={(v) => fmtMoney(v)}
                emptyMessage="Sin montos en el rango."
              />
            </ChartCard>
            <ChartCard title="Monto promedio por persona (pagos y reembolsos, S/)" full>
              <BarChart
                data={porEstudio.promedioPersona}
                color="#2EA1FF"
                formatValue={(v) => fmtMoney(v)}
                emptyMessage="Sin montos en el rango."
              />
            </ChartCard>
          </div>

          {/* v10 — Accesos de abogados */}
          <div className="rounded-2xl panel p-5">
            <h3 className="text-xs font-semibold uppercase tracking-[0.12em] text-white/60 mb-1">
              Accesos de abogados a la plataforma
            </h3>
            <p className="text-xs text-white/40 mb-4">
              Se registra un acceso por día cuando el abogado entra con su usuario. “Días activos” cuenta dentro del rango seleccionado.
            </p>
            {accesosAbogados.length === 0 ? (
              <div className="py-6 text-center text-sm text-white/40">No hay abogados registrados.</div>
            ) : (
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="text-left text-[10px] font-semibold uppercase tracking-wider text-white/40 border-b border-white/10">
                      <th className="py-2 pr-4">Abogado</th>
                      <th className="py-2 pr-4">Estudio</th>
                      <th className="py-2 pr-4">Días activos (rango)</th>
                      <th className="py-2 pr-4">Último acceso</th>
                      <th className="py-2">Estado</th>
                    </tr>
                  </thead>
                  <tbody>
                    {accesosAbogados.map((a) => {
                      const nunca = !a.ultimo;
                      const activoEnRango = a.diasEnRango > 0;
                      return (
                        <tr key={a.nombre} className="border-b border-white/5">
                          <td className="py-2 pr-4 text-white">{a.nombre}</td>
                          <td className="py-2 pr-4 text-white/70">{a.estudio}</td>
                          <td className="py-2 pr-4 text-white/70">{a.diasEnRango}</td>
                          <td className="py-2 pr-4 text-white/70">
                            {a.ultimo
                              ? new Date(`${a.ultimo}T12:00:00`).toLocaleDateString('es-PE', {
                                  day: 'numeric',
                                  month: 'short',
                                  year: 'numeric',
                                })
                              : 'Nunca'}
                          </td>
                          <td className="py-2">
                            <span
                              className={`inline-flex items-center gap-1.5 rounded-full px-2.5 py-0.5 text-[11px] font-semibold ${
                                activoEnRango
                                  ? 'bg-emerald-500/15 text-emerald-300'
                                  : nunca
                                    ? 'bg-red-500/15 text-red-300'
                                    : 'bg-amber-500/15 text-amber-300'
                              }`}
                            >
                              <span
                                className={`h-1.5 w-1.5 rounded-full ${
                                  activoEnRango ? 'bg-emerald-400' : nunca ? 'bg-red-400' : 'bg-amber-400'
                                }`}
                              />
                              {activoEnRango ? 'Activo' : nunca ? 'Nunca entró' : 'Sin actividad en el rango'}
                            </span>
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            )}
          </div>

          {/* Grid de gráficos */}
          <div className="grid gap-4 lg:grid-cols-2">
            <ChartCard title="Pendientes por tipo">
              <BarChart data={pendientesChart} color="#2EA1FF" />
            </ChartCard>

            <ChartCard title="Promedio de días por responsable">
              <BarChart
                data={tiemposPorResponsable}
                color="#0058D4"
                formatValue={(v) => `${v.toFixed(1)}d`}
                emptyMessage="No hay movimientos suficientes para calcular."
              />
            </ChartCard>

            <ChartCard title="Siniestros cerrados por mes" full>
              <BarChart
                data={cerradosPorMes}
                color="#10B981"
                emptyMessage="No hay siniestros cerrados en el rango."
              />
            </ChartCard>

            <ChartCard title="Tendencia de tiempo promedio de cierre" full>
              <LineChart
                data={promedioPorMes}
                color="#2EA1FF"
                formatValue={(v) => `${v.toFixed(0)}d`}
              />
            </ChartCard>
          </div>
        </>
      )}
    </div>
  );
}

function ChartCard({ title, full, children }: { title: string; full?: boolean; children: React.ReactNode }) {
  return (
    <div className={`rounded-2xl panel p-5 ${full ? 'lg:col-span-2' : ''}`}>
      <h3 className="text-xs font-semibold uppercase tracking-[0.12em] text-white/60 mb-4">{title}</h3>
      {children}
    </div>
  );
}
