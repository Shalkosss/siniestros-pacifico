'use client';

import { useEffect, useMemo, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import type { Siniestro, SiniestroMovimiento, TipoSiniestro } from '@/lib/types';
import { BarChart, LineChart, MetricCard } from '@/components/DashboardCharts';
import { useUser } from '@/components/UserContext';
import { puedeVerRuta, rutaInicialPara } from '@/lib/permissions';
import { ETAPAS_FINALES, TIPO_LABELS } from '@/lib/workflows';

type RangoFiltro = '7d' | '30d' | '90d' | 'mes-actual' | 'año-actual' | 'todo' | 'custom';
type TipoFiltro = TipoSiniestro | 'todos';

function inicioMesActual() {
  const d = new Date();
  return new Date(d.getFullYear(), d.getMonth(), 1);
}
function inicioAñoActual() {
  return new Date(new Date().getFullYear(), 0, 1);
}

export default function DashboardPage() {
  const { usuario, loading: loadingUser } = useUser();
  const router = useRouter();
  const [siniestros, setSiniestros] = useState<Siniestro[]>([]);
  const [movimientos, setMovimientos] = useState<SiniestroMovimiento[]>([]);
  const [loading, setLoading] = useState(true);
  const [rango, setRango] = useState<RangoFiltro>('30d');
  const [desdeCustom, setDesdeCustom] = useState('');
  const [hastaCustom, setHastaCustom] = useState('');
  const [tipoFiltro, setTipoFiltro] = useState<TipoFiltro>('todos');
  const [responsableFiltro, setResponsableFiltro] = useState('');

  useEffect(() => {
    if (!loadingUser && usuario && !puedeVerRuta(usuario, '/dashboard')) {
      router.replace(rutaInicialPara(usuario));
    }
  }, [usuario, loadingUser, router]);

  useEffect(() => {
    async function cargar() {
      const [{ data: s }, { data: m }] = await Promise.all([
        supabase.from('siniestros').select('*'),
        supabase.from('siniestro_movimientos').select('*').order('timestamp', { ascending: true }),
      ]);
      setSiniestros(s ?? []);
      setMovimientos(m ?? []);
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

    const pendientesPorTipo: Record<TipoSiniestro, number> = { pago: 0, reembolso: 0, deducible: 0 };
    for (const s of pendientes) pendientesPorTipo[s.tipo]++;

    return { pendientes, cerrados, promedioCierre, pendientesPorTipo };
  }, [siniestrosFiltrados]);

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
      const d = new Date(s.closed_at!);
      const key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
      buckets.set(key, (buckets.get(key) ?? 0) + 1);
    }
    const sorted = Array.from(buckets.entries()).sort(([a], [b]) => a.localeCompare(b));
    return sorted.map(([k, v]) => {
      const [year, mm] = k.split('-');
      const monthLabel = new Date(Number(year), Number(mm) - 1).toLocaleString('es-PE', { month: 'short' });
      return { label: `${monthLabel} ${year.slice(2)}`, value: v };
    });
  }, [siniestrosFiltrados]);

  // Tendencia: promedio de días de cierre por mes
  const promedioPorMes = useMemo(() => {
    const buckets = new Map<string, { total: number; count: number }>();
    for (const s of siniestrosFiltrados) {
      if (!s.closed_at) continue;
      const d = new Date(s.closed_at);
      const key = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}`;
      const dias = (new Date(s.closed_at).getTime() - new Date(s.created_at).getTime()) / (1000 * 60 * 60 * 24);
      const cur = buckets.get(key) ?? { total: 0, count: 0 };
      cur.total += dias;
      cur.count += 1;
      buckets.set(key, cur);
    }
    const sorted = Array.from(buckets.entries()).sort(([a], [b]) => a.localeCompare(b));
    return sorted.map(([k, v]) => {
      const [year, mm] = k.split('-');
      const monthLabel = new Date(Number(year), Number(mm) - 1).toLocaleString('es-PE', { month: 'short' });
      return { label: `${monthLabel} ${year.slice(2)}`, value: Number((v.total / v.count).toFixed(1)) };
    });
  }, [siniestrosFiltrados]);

  // Pendientes por tipo (bar chart)
  const pendientesChart = useMemo(
    () =>
      (['pago', 'reembolso', 'deducible'] as TipoSiniestro[]).map((t) => ({
        label: TIPO_LABELS[t].plural,
        value: metrics.pendientesPorTipo[t],
      })),
    [metrics]
  );

  if (loadingUser || !usuario) return null;
  if (!puedeVerRuta(usuario, '/dashboard')) return null;

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
              hint={`${metrics.pendientesPorTipo.pago} pagos · ${metrics.pendientesPorTipo.reembolso} reemb · ${metrics.pendientesPorTipo.deducible} deduc`}
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
