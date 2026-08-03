'use client';

import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import type { DriveSiniestro, Usuario } from '@/lib/types';
import { cn } from '@/lib/utils';
import { DRIVE_ESTADOS, DRIVE_GRAVEDADES, DRIVE_LESIONES, DRIVE_SUB_ESTADOS } from '@/lib/drive';
import { buildCuerpoInforme, fechaDMY } from '@/lib/informe';
import { baseInput, FField } from './ui/FormField';
import { InformeEmailPanel } from './DriveInformeEmail';

/**
 * Detalle de un caso del Drive.
 *
 * Aquí vive todo lo que NO se muestra en la tabla: nombres de lesionados y su
 * diagnóstico, conductor/asegurado, teléfonos, correo, oficial a cargo,
 * observaciones y recomendación. La tabla solo muestra datos operativos.
 *
 * Además es el lugar donde se completa la métrica legal (reserva inicial/final,
 * ahorro, gravedad) y se cierra el caso.
 */
export function DriveDetalleModal({
  registro,
  usuario,
  puedeEditar,
  onClose,
  onUpdated,
}: {
  registro: DriveSiniestro;
  usuario: Usuario | null;
  puedeEditar: boolean;
  onClose: () => void;
  onUpdated: (r: DriveSiniestro) => void;
}) {
  const [tab, setTab] = useState<'informe' | 'metrica'>('informe');

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose]);

  return (
    <div
      className="fade-in fixed inset-0 z-50 flex items-start justify-center overflow-y-auto bg-black/60 p-4 backdrop-blur-sm sm:p-8"
      onClick={onClose}
    >
      <div
        className="w-full max-w-3xl rounded-2xl border border-white/10 bg-ink-800 text-slate-200 shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-start justify-between gap-3 border-b border-white/[0.06] px-5 py-4">
          <div className="min-w-0">
            <h2 className="flex flex-wrap items-center gap-2 text-base font-semibold text-white">
              <span className="font-mono">{registro.siniestro}</span>
              {registro.placa_asegurado && (
                <span className="rounded bg-white/[0.06] px-1.5 py-0.5 font-mono text-[11px] text-slate-300">
                  {registro.placa_asegurado}
                </span>
              )}
            </h2>
            <p className="mt-0.5 text-[11px] text-slate-500">
              {registro.estudio}
              {registro.abogado && <> · {registro.abogado}</>}
              {registro.fecha_registro && <> · reportado {fechaDMY(registro.fecha_registro)}</>}
            </p>
          </div>
          <button
            type="button"
            onClick={onClose}
            className="rounded-full p-1.5 text-slate-400 transition hover:bg-white/10 hover:text-white"
            aria-label="Cerrar"
          >
            <svg className="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
              <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
            </svg>
          </button>
        </div>

        <div className="flex gap-1 border-b border-white/[0.06] px-5">
          <TabBtn activo={tab === 'informe'} onClick={() => setTab('informe')}>
            Informe de caso
          </TabBtn>
          <TabBtn activo={tab === 'metrica'} onClick={() => setTab('metrica')}>
            Métrica legal
          </TabBtn>
        </div>

        <div className="max-h-[70vh] overflow-y-auto px-5 py-4">
          {tab === 'informe' ? (
            <div className="space-y-4">
              <p className="text-[11px] leading-snug text-slate-500">
                Estos datos no aparecen en la tabla del Drive. Se usan para armar el informe que se
                envía a Pacífico.
              </p>
              <pre className="overflow-auto whitespace-pre-wrap rounded-lg border border-white/[0.06] bg-black/30 p-4 text-[12px] leading-relaxed text-slate-300">
                {buildCuerpoInforme(registro)}
              </pre>
              <InformeEmailPanel registro={registro} usuario={usuario} />
            </div>
          ) : (
            <MetricaForm
              registro={registro}
              puedeEditar={puedeEditar}
              onUpdated={onUpdated}
            />
          )}
        </div>
      </div>
    </div>
  );
}

function TabBtn({
  activo,
  onClick,
  children,
}: {
  activo: boolean;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={cn(
        '-mb-px border-b-2 px-3 py-2.5 text-[13px] font-medium transition',
        activo
          ? 'border-[#06b6d4] text-white'
          : 'border-transparent text-slate-500 hover:text-slate-300'
      )}
    >
      {children}
    </button>
  );
}

/* ---------------- Métrica legal (lo que ya no se pide al crear) ---------------- */

function MetricaForm({
  registro,
  puedeEditar,
  onUpdated,
}: {
  registro: DriveSiniestro;
  puedeEditar: boolean;
  onUpdated: (r: DriveSiniestro) => void;
}) {
  const [reservaInicial, setReservaInicial] = useState(registro.reserva_inicial?.toString() ?? '');
  const [reservaFinal, setReservaFinal] = useState(registro.reserva_final?.toString() ?? '');
  const [ahorro, setAhorro] = useState(registro.ahorro?.toString() ?? '');
  const [gravedad, setGravedad] = useState(registro.gravedad ?? '');
  const [lesionPrincipal, setLesionPrincipal] = useState(registro.lesion_principal ?? '');
  const [subEstado, setSubEstado] = useState(registro.sub_estado ?? '');
  const [estado, setEstado] = useState(registro.estado ?? 'ABIERTO');
  const [fechaCierre, setFechaCierre] = useState(registro.fecha_cierre ?? '');
  const [guardando, setGuardando] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [ok, setOk] = useState(false);

  const num = (s: string): number | null => {
    const v = Number(s);
    return s.trim() !== '' && isFinite(v) ? v : null;
  };

  async function guardar() {
    setError(null);
    if (estado === 'CERRADO' && !fechaCierre) {
      setError('Un caso cerrado necesita fecha de cierre.');
      return;
    }
    setGuardando(true);

    // Tiempo de cierre en días, igual que en el alta y el import.
    let tiempoCierre: number | null = registro.tiempo_cierre;
    if (estado === 'CERRADO' && fechaCierre && registro.fecha_registro) {
      const d =
        (new Date(fechaCierre + 'T00:00:00').getTime() -
          new Date(registro.fecha_registro + 'T00:00:00').getTime()) /
        86400000;
      tiempoCierre = Math.max(0, Math.round(d));
    } else if (estado === 'ABIERTO') {
      tiempoCierre = null;
    }

    const patch = {
      reserva_inicial: num(reservaInicial),
      reserva_final: num(reservaFinal),
      ahorro: num(ahorro),
      gravedad: gravedad || null,
      lesion_principal: lesionPrincipal || null,
      sub_estado: subEstado || null,
      estado,
      fecha_cierre: estado === 'CERRADO' ? fechaCierre : null,
      tiempo_cierre: tiempoCierre,
    };

    const { data, error: updErr } = await supabase
      .from('drive_siniestros')
      .update(patch)
      .eq('id', registro.id)
      .select()
      .single();

    setGuardando(false);
    if (updErr) {
      setError('Error al guardar: ' + updErr.message);
      return;
    }
    setOk(true);
    setTimeout(() => setOk(false), 2000);
    onUpdated(data as DriveSiniestro);
  }

  if (!puedeEditar) {
    return (
      <p className="text-sm text-slate-500">
        Solo Pacífico y el estudio a cargo pueden completar la métrica de este caso.
      </p>
    );
  }

  return (
    <div className="space-y-4">
      <p className="text-[11px] leading-snug text-slate-500">
        Estos campos ya no se piden al registrar el informe: se completan aquí conforme avanza el
        caso y son los que alimentan la tabla, los totales por mes y el Excel consolidado.
      </p>

      <div className="grid grid-cols-1 gap-3 sm:grid-cols-3">
        <FField label="Reserva inicial (S/)">
          <input type="number" step="0.01" value={reservaInicial} onChange={(e) => setReservaInicial(e.target.value)} className={baseInput} placeholder="0.00" />
        </FField>
        <FField label="Reserva final (S/)">
          <input type="number" step="0.01" value={reservaFinal} onChange={(e) => setReservaFinal(e.target.value)} className={baseInput} placeholder="0.00" />
        </FField>
        <FField label="Ahorro (S/)">
          <input type="number" step="0.01" value={ahorro} onChange={(e) => setAhorro(e.target.value)} className={baseInput} placeholder="0.00" />
        </FField>
        <FField label="Gravedad">
          <select value={gravedad} onChange={(e) => setGravedad(e.target.value)} className={baseInput}>
            <option value="" className="bg-ink-800">— Sin definir —</option>
            {DRIVE_GRAVEDADES.map((g) => (
              <option key={g} value={g} className="bg-ink-800">{g}</option>
            ))}
          </select>
        </FField>
        <FField
          label="Lesión principal"
          hint="Es el único dato de las lesiones que se ve en la tabla; los nombres y diagnósticos quedan en el informe."
        >
          <select value={lesionPrincipal} onChange={(e) => setLesionPrincipal(e.target.value)} className={baseInput}>
            <option value="" className="bg-ink-800">— Sin definir —</option>
            {DRIVE_LESIONES.map((l) => (
              <option key={l} value={l} className="bg-ink-800">{l}</option>
            ))}
          </select>
        </FField>
        <FField label="Sub estado">
          <select value={subEstado} onChange={(e) => setSubEstado(e.target.value)} className={baseInput}>
            <option value="" className="bg-ink-800">— Sin definir —</option>
            {DRIVE_SUB_ESTADOS.map((s) => (
              <option key={s} value={s} className="bg-ink-800">{s}</option>
            ))}
          </select>
        </FField>
        <FField label="Estado">
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
        <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-sm text-red-300">{error}</div>
      )}

      <button
        type="button"
        onClick={guardar}
        disabled={guardando}
        className="inline-flex items-center rounded-lg bg-pago px-4 py-2 text-sm font-semibold text-white transition hover:bg-cyan-600 disabled:opacity-50"
      >
        {guardando ? 'Guardando…' : ok ? 'Guardado' : 'Guardar métrica'}
      </button>
    </div>
  );
}
