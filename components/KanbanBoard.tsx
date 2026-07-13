'use client';

import { useEffect, useMemo, useState } from 'react';
import {
  DndContext,
  DragEndEvent,
  DragOverlay,
  DragStartEvent,
  KeyboardSensor,
  PointerSensor,
  pointerWithin,
  useSensor,
  useSensors,
} from '@dnd-kit/core';
import { supabase } from '@/lib/supabase';
import type { Siniestro, SiniestroMovimiento, TipoSiniestro } from '@/lib/types';
import { esEtapaFinal, getEtapas, getResponsableDeEtapa, TIPO_LABELS } from '@/lib/workflows';
import { KanbanColumn } from './KanbanColumn';
import { SiniestroModal } from './SiniestroModal';
import { SiniestroCard, type CardMode } from './SiniestroCard';
import { cn, diasDesde } from '@/lib/utils';
import { useUser } from './UserContext';
import { puedeMover } from '@/lib/permissions';
import { aplicarScope, scopeAmplio, scopeDefault, scopesDisponibles, type ScopeMode } from '@/lib/scope';
import { aplicarVistaPredeterminada, tieneVistaPredeterminada } from '@/lib/vistas';
import { buildComposeUrl, buildEmailGestion, type EmailProvider } from '@/lib/email';

interface Props {
  /** Si true, se cargan también los siniestros cerrados (histórico). Default false (solo activos + cierres recientes). */
  modoHistorico?: boolean;
}

// Orden final: Pagos → Deducibles → Valorizaciones → Info Póliza → Reembolsos (al final)
const TIPOS_ORDEN: TipoSiniestro[] = ['pago', 'deducible', 'valorizacion', 'info_poliza', 'reembolso'];

const TIPO_CHIPS: { id: TipoSiniestro | 'todos'; label: string; dot: string }[] = [
  { id: 'todos',        label: 'Todos',          dot: 'bg-slate-500' },
  { id: 'pago',         label: 'Pagos',          dot: 'bg-[#06b6d4]' },
  { id: 'deducible',    label: 'Deducibles',     dot: 'bg-[#f59e0b]' },
  { id: 'valorizacion', label: 'Valorizaciones', dot: 'bg-[#10b981]' },
  { id: 'info_poliza',  label: 'Info Póliza',    dot: 'bg-[#ec4899]' },
  { id: 'reembolso',    label: 'Reembolsos',     dot: 'bg-[#8b5cf6]' },
];

/**
 * Tinte por sección — fondo sutil + borde con el color del tipo.
 * 0.05/0.15 para que se note sobre el gris neutro.
 */
const sectionStyleByTipo: Record<TipoSiniestro, string> = {
  pago:         'bg-[rgba(6,182,212,0.05)]   border border-[rgba(6,182,212,0.15)]',
  deducible:    'bg-[rgba(245,158,11,0.05)]  border border-[rgba(245,158,11,0.15)]',
  valorizacion: 'bg-[rgba(16,185,129,0.05)]  border border-[rgba(16,185,129,0.15)]',
  info_poliza:  'bg-[rgba(236,72,153,0.05)]  border border-[rgba(236,72,153,0.15)]',
  reembolso:    'bg-[rgba(139,92,246,0.05)]  border border-[rgba(139,92,246,0.15)]',
};

const sectionAccent: Record<TipoSiniestro, string> = {
  pago:         'bg-[#06b6d4]',
  deducible:    'bg-[#f59e0b]',
  valorizacion: 'bg-[#10b981]',
  info_poliza:  'bg-[#ec4899]',
  reembolso:    'bg-[#8b5cf6]',
};

const sectionAccentText: Record<TipoSiniestro, string> = {
  pago:         'text-[#22d3ee]',
  deducible:    'text-[#fbbf24]',
  valorizacion: 'text-[#34d399]',
  info_poliza:  'text-[#f472b6]',
  reembolso:    'text-[#a78bfa]',
};

const MODE_STORAGE_KEY = 'pacifico:card-mode';
// Bump al cambiar defaults (v2 = default es 'todos'/'estudio', no 'mios')
const SCOPE_STORAGE_KEY = 'pacifico:scope-v2';
const VISTA_STORAGE_KEY = 'pacifico:vista-predeterminada';

export function KanbanBoard({ modoHistorico = false }: Props) {
  const { usuario, usuarios } = useUser();

  const [filtroTipo, setFiltroTipo] = useState<TipoSiniestro | 'todos'>('todos');
  const [siniestros, setSiniestros] = useState<Siniestro[]>([]);
  const [movimientos, setMovimientos] = useState<SiniestroMovimiento[]>([]);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [filtroSolicitante, setFiltroSolicitante] = useState('');
  const [filtroAsignado, setFiltroAsignado] = useState('');
  const [busqueda, setBusqueda] = useState('');
  const [mode, setMode] = useState<CardMode>('compacto');
  const [filtrosAbiertos, setFiltrosAbiertos] = useState(false);
  const [scope, setScope] = useState<ScopeMode>('todos');
  const [draggingId, setDraggingId] = useState<string | null>(null);
  // Vista predeterminada (Jack/Rosa/Christian): true = mi vista, false = todo Pacífico
  const [vistaPropia, setVistaPropia] = useState(true);
  // Tras mover una tarjeta, Pacífico puede avisar por correo al abogado (opcional)
  const [avisoGestion, setAvisoGestion] = useState<{
    siniestro: Siniestro;
    etapaAnterior: string;
    etapaNueva: string;
  } | null>(null);

  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 5 } }),
    useSensor(KeyboardSensor)
  );

  useEffect(() => {
    const savedMode = (typeof window !== 'undefined' && localStorage.getItem(MODE_STORAGE_KEY)) as CardMode | null;
    if (savedMode === 'compacto' || savedMode === 'detallado') setMode(savedMode);
    const savedScope = (typeof window !== 'undefined' && localStorage.getItem(SCOPE_STORAGE_KEY)) as ScopeMode | null;
    if (savedScope === 'mios' || savedScope === 'estudio' || savedScope === 'todos') setScope(savedScope);
    const savedVista = typeof window !== 'undefined' ? localStorage.getItem(VISTA_STORAGE_KEY) : null;
    if (savedVista === '0') setVistaPropia(false);
  }, []);

  useEffect(() => {
    if (typeof window !== 'undefined') localStorage.setItem(VISTA_STORAGE_KEY, vistaPropia ? '1' : '0');
  }, [vistaPropia]);

  useEffect(() => {
    if (typeof window !== 'undefined') localStorage.setItem(MODE_STORAGE_KEY, mode);
  }, [mode]);
  useEffect(() => {
    if (typeof window !== 'undefined') localStorage.setItem(SCOPE_STORAGE_KEY, scope);
  }, [scope]);

  useEffect(() => {
    if (!usuario) return;
    const saved = typeof window !== 'undefined' ? localStorage.getItem(SCOPE_STORAGE_KEY) : null;
    const disponibles = scopesDisponibles(usuario);
    if (!saved || !disponibles.includes((saved as ScopeMode) ?? '')) {
      setScope(scopeDefault(usuario));
    } else if (!disponibles.includes(scope)) {
      setScope(scopeDefault(usuario));
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [usuario?.id]);

  async function cargar() {
    const [{ data: sins }, { data: movs }] = await Promise.all([
      supabase.from('siniestros').select('*').order('created_at', { ascending: false }),
      supabase.from('siniestro_movimientos').select('*').order('timestamp', { ascending: true }),
    ]);
    setSiniestros(sins ?? []);
    setMovimientos(movs ?? []);
    setLoading(false);
  }

  useEffect(() => {
    void cargar();
    const ch = supabase
      .channel('kanban-realtime')
      .on('postgres_changes', { event: '*', schema: 'public', table: 'siniestros' }, () => cargar())
      .on('postgres_changes', { event: '*', schema: 'public', table: 'siniestro_movimientos' }, () => cargar())
      .subscribe();
    return () => { void supabase.removeChannel(ch); };
  }, []);

  const movimientosPorSiniestro = useMemo(() => {
    const map: Record<string, SiniestroMovimiento[]> = {};
    for (const m of movimientos) {
      if (!map[m.siniestro_id]) map[m.siniestro_id] = [];
      map[m.siniestro_id].push(m);
    }
    return map;
  }, [movimientos]);

  const solicitantes = useMemo(
    () => Array.from(new Set(siniestros.map((s) => s.solicitante))).sort(),
    [siniestros]
  );
  const asignados = useMemo(
    () => Array.from(new Set(siniestros.map((s) => s.asignado_a).filter((x): x is string => !!x))).sort(),
    [siniestros]
  );

  const siniestrosEnScope = useMemo(
    () => aplicarScope(siniestros, usuario, scope, usuarios),
    [siniestros, usuario, scope, usuarios]
  );

  const tieneVista = tieneVistaPredeterminada(usuario);

  // Aplica la vista predeterminada del usuario (si la tiene y está activada).
  const siniestrosEnVista = useMemo(() => {
    if (!tieneVista || !vistaPropia) return siniestrosEnScope;
    return aplicarVistaPredeterminada(siniestrosEnScope, usuario);
  }, [siniestrosEnScope, tieneVista, vistaPropia, usuario]);

  const siniestrosTemporal = useMemo(() => {
    if (modoHistorico) return siniestrosEnVista;
    return siniestrosEnVista.filter((s) => {
      if (s.archived_at) return false;
      if (!s.closed_at) return true;
      return diasDesde(s.closed_at) <= 7;
    });
  }, [siniestrosEnVista, modoHistorico]);

  const siniestrosFiltrados = useMemo(() => {
    return siniestrosTemporal.filter((s) => {
      if (filtroSolicitante && s.solicitante !== filtroSolicitante) return false;
      if (filtroAsignado && s.asignado_a !== filtroAsignado) return false;
      if (busqueda) {
        const q = busqueda.toLowerCase();
        const hay =
          s.codigo.includes(q) ||
          (s.asegurado_nombre ?? '').toLowerCase().includes(q) ||
          (s.notas ?? '').toLowerCase().includes(q);
        if (!hay) return false;
      }
      return true;
    });
  }, [siniestrosTemporal, filtroSolicitante, filtroAsignado, busqueda]);

  // Qué tipos renderizamos como secciones
  const tiposARenderizar: TipoSiniestro[] = useMemo(() => {
    if (filtroTipo === 'todos') return TIPOS_ORDEN;
    return [filtroTipo];
  }, [filtroTipo]);

  const selected = selectedId ? siniestros.find((s) => s.id === selectedId) ?? null : null;
  const hayFiltrosActivos = !!(filtroSolicitante || filtroAsignado || busqueda);
  const scopesUsuario = scopesDisponibles(usuario);
  const draggableActivo =
    !modoHistorico && !!usuario && (usuario.rol === 'admin' || usuario.rol === 'terceros');
  // Los abogados ven una vista simplificada: solo chips de tipo, sin buscar/filtros/vistas
  const vistaSimplificada = !!usuario && usuario.rol === 'abogado';

  // ---------- Drag & drop ----------
  function onDragStart(e: DragStartEvent) {
    setDraggingId(String(e.active.id));
  }

  async function onDragEnd(e: DragEndEvent) {
    setDraggingId(null);
    const { active, over } = e;
    if (!over || !usuario) return;

    const siniestro = siniestros.find((s) => s.id === active.id);
    if (!siniestro) return;

    // El ID del droppable es `${tipo}::${estado}`
    const [destTipo, destEstado] = String(over.id).split('::');
    if (!destTipo || !destEstado) return;
    if (destTipo !== siniestro.tipo) return; // no se permite cambiar de tipo
    if (siniestro.estado === destEstado) return;

    const etapasValidas = getEtapas(siniestro.tipo);
    if (!etapasValidas.includes(destEstado)) return;
    if (!puedeMover(usuario, siniestro)) return;

    const nuevoResponsable = getResponsableDeEtapa(siniestro.tipo, destEstado, siniestro);
    const isFinalNuevo = esEtapaFinal(siniestro.tipo, destEstado);

    // Update optimista
    setSiniestros((prev) =>
      prev.map((s) =>
        s.id === siniestro.id
          ? { ...s, estado: destEstado, asignado_a: nuevoResponsable, closed_at: isFinalNuevo ? new Date().toISOString() : null }
          : s
      )
    );

    const { error } = await supabase
      .from('siniestros')
      .update({
        estado: destEstado,
        asignado_a: nuevoResponsable,
        closed_at: isFinalNuevo ? new Date().toISOString() : null,
      })
      .eq('id', siniestro.id);

    if (error) { await cargar(); return; }

    await supabase.from('siniestro_movimientos').insert({
      siniestro_id: siniestro.id,
      estado_anterior: siniestro.estado,
      estado_nuevo: destEstado,
      movido_por: usuario.nombre,
    });

    if (nuevoResponsable && nuevoResponsable !== usuario.nombre) {
      await supabase.from('notificaciones').insert({
        usuario_destino: nuevoResponsable,
        mensaje: `Siniestro ${siniestro.codigo} llegó a "${destEstado}"`,
        siniestro_id: siniestro.id,
      });
    }

    // Ofrece avisar por correo al abogado solicitante (opcional, solo Pacífico)
    setAvisoGestion({ siniestro, etapaAnterior: siniestro.estado, etapaNueva: destEstado });
  }

  const siniestroArrastrando = draggingId ? siniestros.find((s) => s.id === draggingId) : null;

  return (
    <div className="space-y-4">
      {/* Barra de control */}
      <div className="flex flex-wrap items-center gap-2">
        <ChipGroup>
          {TIPO_CHIPS.map((c) => {
            const count = c.id === 'todos' ? siniestrosEnVista.length : siniestrosEnVista.filter((s) => s.tipo === c.id).length;
            const active = filtroTipo === c.id;
            return (
              <Chip key={c.id} active={active} onClick={() => setFiltroTipo(c.id)}>
                <span className={cn('h-1.5 w-1.5 rounded-full', c.dot)} />
                {c.label}
                <ChipCount active={active}>{count}</ChipCount>
              </Chip>
            );
          })}
        </ChipGroup>

        {!vistaSimplificada && (
          <ChipGroup>
            <button
              onClick={() => setMode('compacto')}
              className={cn(
                'grid place-items-center rounded-md h-7 w-8 transition',
                mode === 'compacto' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white hover:bg-white/5'
              )}
              title="Vista compacta"
            >
              <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor"><path fillRule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clipRule="evenodd" /></svg>
            </button>
            <button
              onClick={() => setMode('detallado')}
              className={cn(
                'grid place-items-center rounded-md h-7 w-8 transition',
                mode === 'detallado' ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white hover:bg-white/5'
              )}
              title="Vista detallada"
            >
              <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor"><path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v4a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm0 9a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-1 1H4a1 1 0 01-1-1v-3z" /></svg>
            </button>
          </ChipGroup>
        )}

        {!vistaSimplificada && (
          <div className="relative">
            <svg className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-slate-500" viewBox="0 0 20 20" fill="currentColor"><path fillRule="evenodd" d="M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z" clipRule="evenodd" /></svg>
            <input
              type="text"
              placeholder="Buscar..."
              value={busqueda}
              onChange={(e) => setBusqueda(e.target.value)}
              className="w-48 rounded-lg bg-white/[0.03] border border-white/[0.06] px-9 py-1.5 text-sm text-slate-200 placeholder:text-slate-500 focus:outline-none focus:border-white/20 focus:bg-white/[0.05]"
            />
          </div>
        )}

        {!vistaSimplificada && (
          <button
            onClick={() => setFiltrosAbiertos((v) => !v)}
            className={cn(
              'flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-xs font-medium border transition',
              filtrosAbiertos || hayFiltrosActivos
                ? 'border-pago/40 bg-pago/10 text-pago'
                : 'border-white/[0.06] bg-white/[0.03] text-slate-300 hover:bg-white/[0.05]'
            )}
          >
            <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor"><path fillRule="evenodd" d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z" clipRule="evenodd" /></svg>
            Filtros
            {hayFiltrosActivos && <span className="h-1.5 w-1.5 rounded-full bg-pago" />}
          </button>
        )}

        <div className="ml-auto flex items-center gap-4 text-[11px] font-medium">
          {/* Toggle vista predeterminada (Jack/Rosa/Christian) */}
          {tieneVista && (
            <div className="inline-flex rounded-md bg-white/[0.03] border border-white/[0.06] p-0.5">
              <button
                onClick={() => setVistaPropia(true)}
                className={cn(
                  'rounded px-2 py-1 transition',
                  vistaPropia ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
                )}
                title="Ver solo los casos de mi vista"
              >
                Mi vista
              </button>
              <button
                onClick={() => setVistaPropia(false)}
                className={cn(
                  'rounded px-2 py-1 transition',
                  !vistaPropia ? 'bg-white/10 text-white' : 'text-slate-400 hover:text-white'
                )}
                title="Ver todos los casos de Pacífico"
              >
                Todo Pacífico
              </button>
            </div>
          )}
          {/* Toggle discreto "Solo míos" — secundario al lado del contador */}
          {!vistaSimplificada && scopesUsuario.includes('mios') && (
            <button
              onClick={() => setScope(scope === 'mios' ? scopeAmplio(usuario) : 'mios')}
              className={cn(
                'inline-flex items-center gap-1.5 rounded-md px-2 py-1 transition',
                scope === 'mios'
                  ? 'bg-pago/15 text-pago ring-1 ring-pago/30'
                  : 'text-slate-500 hover:text-slate-200 hover:bg-white/[0.04]'
              )}
              title={scope === 'mios' ? 'Quitar filtro (ver todos)' : 'Ver solo los míos'}
            >
              <span
                className={cn(
                  'grid h-3.5 w-3.5 place-items-center rounded-sm border transition',
                  scope === 'mios' ? 'border-pago bg-pago' : 'border-slate-600'
                )}
              >
                {scope === 'mios' && (
                  <svg className="h-2.5 w-2.5 text-white" viewBox="0 0 20 20" fill="currentColor">
                    <path fillRule="evenodd" d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z" clipRule="evenodd" />
                  </svg>
                )}
              </span>
              Solo míos
              <span className="text-slate-500/80 tabular-nums">
                ({aplicarScope(siniestros, usuario, 'mios', usuarios).length})
              </span>
            </button>
          )}
          <span className="text-slate-500">
            {modoHistorico ? <>Histórico · {siniestrosFiltrados.length}</> : <>Últimos 7d · {siniestrosFiltrados.length} de {siniestrosEnVista.length}</>}
          </span>
        </div>
      </div>

      {!vistaSimplificada && filtrosAbiertos && (
        <div className="flex flex-wrap items-center gap-2 rounded-2xl panel p-3 slide-in">
          <select
            value={filtroSolicitante}
            onChange={(e) => setFiltroSolicitante(e.target.value)}
            className="rounded-lg bg-white/5 border border-white/10 px-3 py-1.5 text-sm text-white"
          >
            <option value="" className="bg-ink-800">Todos los abogados</option>
            {solicitantes.map((s) => <option key={s} value={s} className="bg-ink-800">{s}</option>)}
          </select>
          <select
            value={filtroAsignado}
            onChange={(e) => setFiltroAsignado(e.target.value)}
            className="rounded-lg bg-white/5 border border-white/10 px-3 py-1.5 text-sm text-white"
          >
            <option value="" className="bg-ink-800">Todos los responsables</option>
            {asignados.map((s) => <option key={s} value={s} className="bg-ink-800">{s}</option>)}
          </select>
          {hayFiltrosActivos && (
            <button onClick={() => { setFiltroSolicitante(''); setFiltroAsignado(''); setBusqueda(''); }} className="text-xs text-white/60 underline hover:text-white">
              Limpiar
            </button>
          )}
        </div>
      )}

      {/* Secciones por tipo */}
      {loading ? (
        <div className="grid place-items-center py-20 text-slate-500">Cargando siniestros…</div>
      ) : (
        <DndContext sensors={sensors} collisionDetection={pointerWithin} onDragStart={onDragStart} onDragEnd={onDragEnd}>
          <div className="space-y-5">
            {tiposARenderizar.map((tipo) => {
              const sinDeTipo = siniestrosFiltrados.filter((s) => s.tipo === tipo);
              const etapas = getEtapas(tipo);
              return (
                <section key={tipo} className={cn('rounded-xl p-3', sectionStyleByTipo[tipo])}>
                  <header className="flex items-center gap-2.5 px-1 pb-3">
                    <span className={cn('h-2 w-2 rounded-full', sectionAccent[tipo])} />
                    <h2 className={cn('text-[15px] font-semibold tracking-tight', sectionAccentText[tipo])}>
                      {TIPO_LABELS[tipo].plural}
                    </h2>
                    <span className="rounded-full bg-white/5 px-2 py-0.5 text-[10px] font-medium text-slate-500">
                      {sinDeTipo.length}
                    </span>
                  </header>
                  <div className="flex gap-3 overflow-x-auto pb-1">
                    {etapas.map((estado) => (
                      <KanbanColumn
                        key={`${tipo}-${estado}`}
                        tipo={tipo}
                        estado={estado}
                        siniestros={sinDeTipo.filter((s) => s.estado === estado)}
                        mode={mode}
                        draggable={draggableActivo}
                        onCardClick={(s) => setSelectedId(s.id)}
                      />
                    ))}
                  </div>
                </section>
              );
            })}
          </div>

          <DragOverlay>
            {siniestroArrastrando ? (
              <div className="opacity-90 rotate-2">
                <SiniestroCard siniestro={siniestroArrastrando} mode={mode} draggable={false} onClick={() => {}} />
              </div>
            ) : null}
          </DragOverlay>
        </DndContext>
      )}

      {selected && (
        <SiniestroModal
          siniestro={selected}
          movimientos={(movimientosPorSiniestro[selected.id] ?? []).slice().reverse()}
          onClose={() => setSelectedId(null)}
          onChanged={() => void cargar()}
        />
      )}

      {avisoGestion && usuario && (usuario.rol === 'admin' || usuario.rol === 'terceros') && (
        <AvisoGestionToast
          aviso={avisoGestion}
          movidoPor={usuario.nombre}
          emailSolicitante={
            usuarios.find((u) => u.nombre === avisoGestion.siniestro.solicitante)?.email ?? null
          }
          onClose={() => setAvisoGestion(null)}
        />
      )}
    </div>
  );
}

/* ---------------- Toast: avisar por correo tras mover una tarjeta ---------------- */

const EMAIL_PROVIDER_KEY = 'pacifico:email-provider';

function AvisoGestionToast({
  aviso,
  movidoPor,
  emailSolicitante,
  onClose,
}: {
  aviso: { siniestro: Siniestro; etapaAnterior: string; etapaNueva: string };
  movidoPor: string;
  emailSolicitante: string | null;
  onClose: () => void;
}) {
  // Se autodescarta a los 20s para no estorbar
  useEffect(() => {
    const t = setTimeout(onClose, 20000);
    return () => clearTimeout(t);
  }, [aviso, onClose]);

  function enviar() {
    const saved = typeof window !== 'undefined' ? localStorage.getItem(EMAIL_PROVIDER_KEY) : null;
    const provider: EmailProvider =
      saved === 'outlook' || saved === 'yahoo' ? saved : 'gmail';
    const contenido = buildEmailGestion(
      aviso.siniestro,
      aviso.etapaAnterior,
      aviso.etapaNueva,
      movidoPor,
      emailSolicitante
    );
    window.open(buildComposeUrl(provider, contenido), '_blank', 'noopener');
    onClose();
  }

  return (
    <div className="fixed bottom-4 right-4 z-50 w-80 rounded-xl border border-white/10 bg-ink-800 shadow-2xl p-3.5 slide-in">
      <div className="flex items-start gap-2.5">
        <svg className="h-4 w-4 shrink-0 text-cyan-300 mt-0.5" viewBox="0 0 20 20" fill="currentColor">
          <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
          <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
        </svg>
        <div className="min-w-0 flex-1">
          <div className="text-xs font-semibold text-slate-100">
            <span className="font-mono">{aviso.siniestro.codigo}</span> movido a "{aviso.etapaNueva}"
          </div>
          <p className="mt-0.5 text-[11px] text-slate-400 leading-snug">
            ¿Avisar por correo a <span className="text-slate-200">{aviso.siniestro.solicitante}</span> que
            su solicitud fue gestionada?
            {!emailSolicitante && (
              <span className="block text-amber-300/80 mt-0.5">
                (No tiene correo registrado: se abrirá el borrador para que pongas el destinatario.)
              </span>
            )}
          </p>
          <div className="mt-2 flex gap-2">
            <button
              onClick={enviar}
              className="inline-flex items-center gap-1 rounded-md border border-cyan-500/50 bg-cyan-500/15 px-2.5 py-1 text-[11px] font-semibold text-cyan-300 hover:bg-cyan-500/25 transition"
            >
              Enviar aviso
            </button>
            <button
              onClick={onClose}
              className="inline-flex items-center rounded-md border border-white/[0.08] px-2.5 py-1 text-[11px] font-medium text-slate-400 hover:text-slate-200 hover:bg-white/[0.04] transition"
            >
              Omitir
            </button>
          </div>
        </div>
        <button
          onClick={onClose}
          className="rounded p-0.5 text-slate-500 hover:text-white transition"
          aria-label="Cerrar"
        >
          <svg className="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor">
            <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
          </svg>
        </button>
      </div>
    </div>
  );
}

/* ---------------- Chip primitives ---------------- */

function ChipGroup({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex items-center gap-0.5 rounded-lg bg-white/[0.03] border border-white/[0.06] p-1">
      {children}
    </div>
  );
}

function Chip({
  active,
  onClick,
  children,
}: {
  active: boolean;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      onClick={onClick}
      className={cn(
        'inline-flex items-center gap-1.5 rounded-md px-2.5 py-1 text-xs font-medium transition',
        active
          ? 'bg-white/10 text-white'
          : 'text-slate-400 hover:text-white hover:bg-white/5'
      )}
    >
      {children}
    </button>
  );
}

function ChipCount({ active, children }: { active: boolean; children: React.ReactNode }) {
  return (
    <span
      className={cn(
        'rounded px-1 text-[10px] tabular-nums',
        active ? 'bg-white/10 text-white/80' : 'bg-white/5 text-slate-500'
      )}
    >
      {children}
    </span>
  );
}
