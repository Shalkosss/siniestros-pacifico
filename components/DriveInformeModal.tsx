'use client';

import { FormEvent, useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import type { ContactoTelefono, DriveSiniestro, Lesionado, Usuario } from '@/lib/types';
import { cn } from '@/lib/utils';
import { DRIVE_ESTUDIOS, DRIVE_MESES } from '@/lib/drive';
import {
  INFORME_CAUSAS,
  INFORME_RESPONSABILIDAD,
  INFORME_ROLES_LESIONADO,
  derivarLesiones,
} from '@/lib/informe';
import { baseInput, baseTextarea, FCheck, FField, FSection } from './ui/FormField';
import { InformeEmailPanel } from './DriveInformeEmail';

const hoyISO = () => new Date().toISOString().slice(0, 10);

function nuevoLesionado(): Lesionado {
  return { rol: 'Conductor Tercero', nombre: '', edad: null, diagnostico: '', lugar_atencion: '' };
}

function nuevoContacto(grupo: ContactoTelefono['grupo']): ContactoTelefono {
  return { grupo, etiqueta: '', telefono: '' };
}

/**
 * Formulario del INFORME DE CASO (24 puntos) para dar de alta un siniestro
 * en el Drive. Reemplaza al formulario anterior de la base consolidada.
 *
 * Lo que ya no se pide y se llena después desde el detalle del caso:
 * reserva inicial, reserva final, ahorro y gravedad.
 * Lo que se deriva solo: año y mes (de la fecha del reporte), estado (ABIERTO),
 * sub estado, cantidad de lesionados y lesión principal.
 */
export function DriveInformeModal({
  estudioFijo,
  abogadoFijo,
  creadoPor,
  usuario,
  onClose,
  onCreated,
}: {
  /** null = Pacífico elige el estudio; string = estudio del abogado logueado */
  estudioFijo: string | null;
  /** Nombre del abogado logueado (se autocompleta el punto 11) */
  abogadoFijo: string | null;
  creadoPor: string;
  usuario: Usuario | null;
  onClose: () => void;
  onCreated: () => void;
}) {
  /* --- 1. Identificación --- */
  const [siniestro, setSiniestro] = useState('');
  const [usaNroCaso, setUsaNroCaso] = useState(false);
  const [nroCasoEstudio, setNroCasoEstudio] = useState('');
  const [nroCaso, setNroCaso] = useState('');

  /* --- 2 y 3. Fechas --- */
  const [fechaRegistro, setFechaRegistro] = useState(hoyISO());
  const [horaReporte, setHoraReporte] = useState('');
  const [fechaLlegada, setFechaLlegada] = useState('');
  const [horaLlegada, setHoraLlegada] = useState('');
  const [fechaSiniestro, setFechaSiniestro] = useState('');
  const [horaSiniestro, setHoraSiniestro] = useState('');
  const [fechaActualizacion, setFechaActualizacion] = useState(hoyISO());

  /* --- 4 a 14. Datos del siniestro --- */
  const [asesor, setAsesor] = useState('');
  const [coberturaAprobada, setCoberturaAprobada] = useState(false);
  const [lugar, setLugar] = useState('');
  const [provincia, setProvincia] = useState('');
  const [distrito, setDistrito] = useState('');
  const [comisaria, setComisaria] = useState('');
  const [oficialCargo, setOficialCargo] = useState('');
  const [oficialTelefono, setOficialTelefono] = useState('');
  const [causa, setCausa] = useState('');
  const [conductorAsegurado, setConductorAsegurado] = useState('');
  const [responsabilidad, setResponsabilidad] = useState('');
  const [abogado, setAbogado] = useState(abogadoFijo ?? '');
  const [placaAsegurado, setPlacaAsegurado] = useState('');
  const [placaTercero, setPlacaTercero] = useState('');
  const [daniosMateriales, setDaniosMateriales] = useState(false);

  /* --- 15. Lesionados --- */
  const [lesionados, setLesionados] = useState<Lesionado[]>([]);

  /* --- 16. Montos --- */
  const [montoCierre, setMontoCierre] = useState('');
  const [montoLesiones, setMontoLesiones] = useState('');
  const [montoDanios, setMontoDanios] = useState('');

  /* --- 17, 18, 21. Gestión --- */
  const [enNegociacion, setEnNegociacion] = useState(false);
  const [comunicaciones, setComunicaciones] = useState(false);
  const [procesoPenal, setProcesoPenal] = useState(false);
  const [procesoCivil, setProcesoCivil] = useState(false);

  /* --- 19 y 20. Contactos --- */
  const [contactos, setContactos] = useState<ContactoTelefono[]>([]);
  const [correoAsegurado, setCorreoAsegurado] = useState('');

  /* --- 22 y 23 --- */
  const [observaciones, setObservaciones] = useState('');
  const [recomendacion, setRecomendacion] = useState('');

  const [estudio, setEstudio] = useState(estudioFijo ?? '');
  const [error, setError] = useState<string | null>(null);
  const [guardando, setGuardando] = useState(false);
  /** Cuando se guarda, pasamos a la pantalla de "informe creado" con el correo */
  const [creado, setCreado] = useState<DriveSiniestro | null>(null);

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape' && !guardando) (creado ? onCreated : onClose)();
    }
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [onClose, onCreated, guardando, creado]);

  function setLesionado(i: number, patch: Partial<Lesionado>) {
    setLesionados((prev) => prev.map((l, j) => (j === i ? { ...l, ...patch } : l)));
  }
  function setContacto(i: number, patch: Partial<ContactoTelefono>) {
    setContactos((prev) => prev.map((c, j) => (j === i ? { ...c, ...patch } : c)));
  }

  const num = (s: string): number | null => {
    const v = Number(s);
    return s.trim() !== '' && isFinite(v) ? v : null;
  };
  const str = (s: string): string | null => (s.trim() === '' ? null : s.trim());

  async function onSubmit(e: FormEvent) {
    e.preventDefault();
    setError(null);
    if (!siniestro.trim()) return setError('Indica el N° de siniestro.');
    if (!fechaRegistro) return setError('Indica la fecha del reporte.');
    if (!estudio) return setError('Selecciona el estudio.');

    setGuardando(true);

    // Año y mes salen de la fecha del reporte, como en la base consolidada.
    const fr = new Date(fechaRegistro + 'T00:00:00');
    const anio = fr.getFullYear();
    const mes = DRIVE_MESES[fr.getMonth()];

    const limpios = lesionados.filter((l) => l.nombre.trim() || l.diagnostico.trim());
    const derivado = derivarLesiones(limpios);
    const contactosLimpios = contactos.filter((c) => c.telefono.trim() || c.etiqueta.trim());

    const fila = {
      siniestro: siniestro.trim(),
      anio,
      mes,
      // Un caso recién reportado siempre entra abierto.
      estado: 'ABIERTO',
      sub_estado: enNegociacion ? 'En Negociación' : 'En Evaluación',
      estudio,
      creado_por: creadoPor,

      // Informe
      nro_caso_estudio: usaNroCaso ? str(nroCasoEstudio) : null,
      nro_caso: str(nroCaso),
      fecha_registro: fechaRegistro,
      hora_reporte: str(horaReporte),
      fecha_llegada: fechaLlegada || null,
      hora_llegada: str(horaLlegada),
      fecha_siniestro: fechaSiniestro || null,
      hora_siniestro: str(horaSiniestro),
      asesor: str(asesor),
      cobertura_aprobada: coberturaAprobada,
      lugar: str(lugar),
      provincia: str(provincia),
      distrito: str(distrito),
      comisaria: str(comisaria),
      oficial_cargo: str(oficialCargo),
      oficial_telefono: str(oficialTelefono),
      causa: str(causa),
      conductor_asegurado: str(conductorAsegurado),
      responsabilidad: str(responsabilidad),
      abogado: str(abogado),
      placa_asegurado: str(placaAsegurado)?.toUpperCase() ?? null,
      placa_tercero: str(placaTercero),
      danios_materiales: daniosMateriales,
      lesionados: limpios.length > 0 ? limpios : null,
      monto_cierre: num(montoCierre),
      monto_lesiones: num(montoLesiones),
      monto_danios: num(montoDanios),
      en_negociacion: enNegociacion,
      comunicaciones,
      contactos: contactosLimpios.length > 0 ? contactosLimpios : null,
      correo_asegurado: str(correoAsegurado),
      proceso_penal: procesoPenal,
      proceso_civil: procesoCivil,
      observaciones: str(observaciones),
      recomendacion: str(recomendacion),
      fecha_actualizacion: fechaActualizacion || fechaRegistro,

      // Derivados para la métrica legal (reserva/ahorro/gravedad se llenan después)
      cant_lesionados: derivado.cant_lesionados,
      lesiones: derivado.lesiones,
      lesion_principal: derivado.lesion_principal,
    };

    const { data, error: insErr } = await supabase
      .from('drive_siniestros')
      .insert(fila)
      .select()
      .single();

    setGuardando(false);
    if (insErr) return setError('Error al guardar: ' + insErr.message);
    setCreado(data as DriveSiniestro);
  }

  /* ---------------- Pantalla posterior: informe creado + correo ---------------- */

  if (creado) {
    return (
      <Shell
        titulo="Informe registrado"
        subtitulo={`Siniestro ${creado.siniestro} agregado al Drive de ${creado.estudio}.`}
        onClose={onCreated}
      >
        <div className="px-5 py-4">
          <InformeEmailPanel registro={creado} usuario={usuario} />
        </div>
        <div className="flex gap-2 border-t border-white/[0.06] px-5 py-4">
          <button
            type="button"
            onClick={onCreated}
            className="inline-flex items-center rounded-lg border border-white/[0.08] px-4 py-2 text-sm font-medium text-slate-300 hover:bg-white/[0.03] hover:text-white transition"
          >
            Listo
          </button>
        </div>
      </Shell>
    );
  }

  /* ---------------- Formulario ---------------- */

  return (
    <Shell
      titulo="Nuevo informe de caso"
      subtitulo="Los campos que falten salen como “-” en el correo. Año, mes y estado se calculan solos."
      onClose={onClose}
      onSubmit={onSubmit}
    >
      <div className="max-h-[70vh] space-y-5 overflow-y-auto px-5 py-4">
        {/* ---- Identificación ---- */}
        <FSection n="1" title="Identificación del caso" />
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          <FField label="N° de siniestro *">
            <input
              value={siniestro}
              onChange={(e) => setSiniestro(e.target.value)}
              className={cn(baseInput, 'font-mono')}
              placeholder="Ej. 1001526235"
            />
          </FField>
          <FField label="N° de caso" hint="El que asigna Pacífico. Ej. 442783.">
            <input
              value={nroCaso}
              onChange={(e) => setNroCaso(e.target.value)}
              className={cn(baseInput, 'font-mono')}
              placeholder="Ej. 442783"
            />
          </FField>
          <div className="sm:col-span-2">
            <FCheck
              label="Mi estudio usa numeración propia de informes"
              hint="Es un correlativo interno con el que algunos estudios (por ejemplo RVC) numeran sus informes: el caso 147 del año. Va en el asunto del correo como “ASESORÍA LEGAL N° 147/06”. Si tu equipo no lo usa, deja esto sin marcar."
              checked={usaNroCaso}
              onChange={setUsaNroCaso}
            />
          </div>
          {usaNroCaso && (
            <FField label="N° de caso del estudio" hint="Solo el número, ej. 147.">
              <input
                value={nroCasoEstudio}
                onChange={(e) => setNroCasoEstudio(e.target.value)}
                className={cn(baseInput, 'font-mono')}
                placeholder="Ej. 147"
              />
            </FField>
          )}
          <FField label="Estudio *">
            {estudioFijo ? (
              <input value={estudioFijo} disabled className={cn(baseInput, 'cursor-not-allowed opacity-60')} />
            ) : (
              <select value={estudio} onChange={(e) => setEstudio(e.target.value)} className={baseInput}>
                <option value="" className="bg-ink-800">— Selecciona —</option>
                {DRIVE_ESTUDIOS.map((es) => (
                  <option key={es} value={es} className="bg-ink-800">{es}</option>
                ))}
              </select>
            )}
          </FField>
        </div>

        {/* ---- Fechas ---- */}
        <FSection n="2" title="Fechas y horas" />
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-4">
          <FField label="Fecha del reporte *" className="sm:col-span-2">
            <input type="date" value={fechaRegistro} onChange={(e) => setFechaRegistro(e.target.value)} className={baseInput} />
          </FField>
          <FField label="Hora del reporte" className="sm:col-span-2">
            <input type="time" value={horaReporte} onChange={(e) => setHoraReporte(e.target.value)} className={baseInput} />
          </FField>
          <FField label="Fecha de llegada" className="sm:col-span-2">
            <input type="date" value={fechaLlegada} onChange={(e) => setFechaLlegada(e.target.value)} className={baseInput} />
          </FField>
          <FField label="Hora de llegada" className="sm:col-span-2">
            <input type="time" value={horaLlegada} onChange={(e) => setHoraLlegada(e.target.value)} className={baseInput} />
          </FField>
          <FField label="Fecha del siniestro" className="sm:col-span-2">
            <input type="date" value={fechaSiniestro} onChange={(e) => setFechaSiniestro(e.target.value)} className={baseInput} />
          </FField>
          <FField label="Hora del siniestro" className="sm:col-span-2">
            <input type="time" value={horaSiniestro} onChange={(e) => setHoraSiniestro(e.target.value)} className={baseInput} />
          </FField>
        </div>

        {/* ---- Siniestro ---- */}
        <FSection n="3" title="Datos del siniestro" />
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          <FField label="Asesor">
            <input value={asesor} onChange={(e) => setAsesor(e.target.value)} className={baseInput} placeholder="Ej. Jonathan Lecca" />
          </FField>
          <div className="flex items-end">
            <FCheck label="Cobertura aprobada" checked={coberturaAprobada} onChange={setCoberturaAprobada} />
          </div>
          <FField label="Lugar del siniestro" className="sm:col-span-2">
            <input value={lugar} onChange={(e) => setLugar(e.target.value)} className={baseInput} placeholder="Ej. Avenida Universitaria cuadra 12" />
          </FField>
          <FField label="Provincia">
            <input value={provincia} onChange={(e) => setProvincia(e.target.value)} className={baseInput} placeholder="Ej. LIMA" />
          </FField>
          <FField label="Distrito">
            <input value={distrito} onChange={(e) => setDistrito(e.target.value)} className={baseInput} placeholder="Ej. Cercado de Lima" />
          </FField>
          <FField label="Comisaría">
            <input value={comisaria} onChange={(e) => setComisaria(e.target.value)} className={baseInput} placeholder="Ej. Unidad Vecinal 3" />
          </FField>
          <div className="grid grid-cols-2 gap-3">
            <FField label="Oficial a cargo">
              <input value={oficialCargo} onChange={(e) => setOficialCargo(e.target.value)} className={baseInput} placeholder="Ej. SO Pareja" />
            </FField>
            <FField label="Teléfono">
              <input value={oficialTelefono} onChange={(e) => setOficialTelefono(e.target.value)} className={baseInput} placeholder="Opcional" />
            </FField>
          </div>
          <FField label="Causa">
            <select value={causa} onChange={(e) => setCausa(e.target.value)} className={baseInput}>
              <option value="" className="bg-ink-800">— Selecciona —</option>
              {INFORME_CAUSAS.map((c) => (
                <option key={c} value={c} className="bg-ink-800">{c}</option>
              ))}
            </select>
          </FField>
          <FField label="Responsabilidad">
            <select value={responsabilidad} onChange={(e) => setResponsabilidad(e.target.value)} className={baseInput}>
              <option value="" className="bg-ink-800">— Selecciona —</option>
              {INFORME_RESPONSABILIDAD.map((c) => (
                <option key={c} value={c} className="bg-ink-800">{c}</option>
              ))}
            </select>
          </FField>
          <FField label="Conductor y/o asegurado" className="sm:col-span-2">
            <input value={conductorAsegurado} onChange={(e) => setConductorAsegurado(e.target.value)} className={baseInput} placeholder="Nombre completo" />
          </FField>
          <FField
            label="Abogado asignado"
            hint={abogadoFijo ? 'Se toma de tu usuario.' : undefined}
          >
            <input value={abogado} onChange={(e) => setAbogado(e.target.value)} className={baseInput} />
          </FField>
          <FField label="Placa del vehículo asegurado">
            <input
              value={placaAsegurado}
              onChange={(e) => setPlacaAsegurado(e.target.value.toUpperCase())}
              className={cn(baseInput, 'font-mono uppercase')}
              placeholder="Ej. BDS940"
            />
          </FField>
          <FField label="Placa del vehículo tercero" hint="Si no tiene, describe el vehículo (ej. “No, moto eléctrica”).">
            <input value={placaTercero} onChange={(e) => setPlacaTercero(e.target.value)} className={baseInput} placeholder="Ej. ABC123" />
          </FField>
          <div className="flex items-end">
            <FCheck label="Hay daños materiales" checked={daniosMateriales} onChange={setDaniosMateriales} />
          </div>
        </div>

        {/* ---- Lesionados ---- */}
        <FSection n="4" title="Lesionados">
          <span className="rounded-full bg-white/5 px-2 py-0.5 text-[10px] font-medium text-slate-400">
            {lesionados.length}
          </span>
        </FSection>
        <div className="space-y-3">
          {lesionados.map((l, i) => (
            <div key={i} className="rounded-lg border border-white/[0.06] bg-white/[0.02] p-3">
              <div className="mb-2 flex items-center gap-2">
                <span className="text-[11px] font-semibold text-slate-400">Lesionado {i + 1}</span>
                <button
                  type="button"
                  onClick={() => setLesionados((prev) => prev.filter((_, j) => j !== i))}
                  className="ml-auto rounded px-2 py-0.5 text-[11px] text-slate-500 transition hover:bg-red-500/10 hover:text-red-300"
                >
                  Quitar
                </button>
              </div>
              <div className="grid grid-cols-1 gap-3 sm:grid-cols-4">
                <FField label="Rol" className="sm:col-span-2">
                  <select value={l.rol} onChange={(e) => setLesionado(i, { rol: e.target.value })} className={baseInput}>
                    {INFORME_ROLES_LESIONADO.map((r) => (
                      <option key={r} value={r} className="bg-ink-800">{r}</option>
                    ))}
                  </select>
                </FField>
                <FField label="Nombre" className="sm:col-span-2">
                  <input value={l.nombre} onChange={(e) => setLesionado(i, { nombre: e.target.value })} className={baseInput} />
                </FField>
                <FField label="Edad">
                  <input
                    type="number"
                    min={0}
                    max={120}
                    value={l.edad ?? ''}
                    onChange={(e) => setLesionado(i, { edad: e.target.value === '' ? null : Number(e.target.value) })}
                    className={baseInput}
                  />
                </FField>
                <FField label="Lugar de atención" className="sm:col-span-3">
                  <input value={l.lugar_atencion} onChange={(e) => setLesionado(i, { lugar_atencion: e.target.value })} className={baseInput} placeholder="Ej. Clínica Auna" />
                </FField>
                <FField label="Diagnóstico" className="sm:col-span-4">
                  <textarea value={l.diagnostico} onChange={(e) => setLesionado(i, { diagnostico: e.target.value })} className={baseTextarea} placeholder="Ej. Fractura de cadera, contusión de rodilla" />
                </FField>
              </div>
            </div>
          ))}
          <button
            type="button"
            onClick={() => setLesionados((prev) => [...prev, nuevoLesionado()])}
            className="inline-flex items-center gap-1.5 rounded-lg border border-dashed border-white/[0.12] px-3 py-2 text-[13px] font-medium text-slate-400 transition hover:border-white/25 hover:text-slate-200"
          >
            + Agregar lesionado
          </button>
          {lesionados.length === 0 && (
            <p className="text-[11px] text-slate-500">Sin lesionados el punto 15 del informe sale como “-”.</p>
          )}
        </div>

        {/* ---- Montos y gestión ---- */}
        <FSection n="5" title="Monto de cierre y estado de la gestión" />
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-3">
          <FField label="Monto aprox. de cierre (S/)">
            <input type="number" step="0.01" value={montoCierre} onChange={(e) => setMontoCierre(e.target.value)} className={baseInput} placeholder="50000.00" />
          </FField>
          <FField label="— de lesiones personales (S/)">
            <input type="number" step="0.01" value={montoLesiones} onChange={(e) => setMontoLesiones(e.target.value)} className={baseInput} placeholder="45000.00" />
          </FField>
          <FField label="— de daños materiales (S/)">
            <input type="number" step="0.01" value={montoDanios} onChange={(e) => setMontoDanios(e.target.value)} className={baseInput} placeholder="5000.00" />
          </FField>
        </div>
        <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
          <FCheck label="En negociación" checked={enNegociacion} onChange={setEnNegociacion} />
          <FCheck label="Hay comunicaciones" checked={comunicaciones} onChange={setComunicaciones} />
          <FCheck label="Proceso penal" checked={procesoPenal} onChange={setProcesoPenal} />
          <FCheck label="Proceso civil" checked={procesoCivil} onChange={setProcesoCivil} />
        </div>

        {/* ---- Contactos ---- */}
        <FSection n="6" title="Contactos">
          <span className="rounded-full bg-white/5 px-2 py-0.5 text-[10px] font-medium text-slate-400">
            {contactos.length}
          </span>
        </FSection>
        <div className="space-y-2">
          {contactos.map((c, i) => (
            <div key={i} className="grid grid-cols-1 gap-2 sm:grid-cols-[130px_1fr_150px_auto]">
              <select value={c.grupo} onChange={(e) => setContacto(i, { grupo: e.target.value as ContactoTelefono['grupo'] })} className={baseInput}>
                <option value="asegurado" className="bg-ink-800">Asegurado</option>
                <option value="tercero" className="bg-ink-800">Tercero</option>
              </select>
              <input value={c.etiqueta} onChange={(e) => setContacto(i, { etiqueta: e.target.value })} className={baseInput} placeholder="Quién es. Ej. Conductor" />
              <input value={c.telefono} onChange={(e) => setContacto(i, { telefono: e.target.value })} className={baseInput} placeholder="Teléfono" />
              <button
                type="button"
                onClick={() => setContactos((prev) => prev.filter((_, j) => j !== i))}
                className="rounded-lg px-3 text-[11px] text-slate-500 transition hover:bg-red-500/10 hover:text-red-300"
              >
                Quitar
              </button>
            </div>
          ))}
          <div className="flex flex-wrap gap-2">
            <button
              type="button"
              onClick={() => setContactos((prev) => [...prev, nuevoContacto('asegurado')])}
              className="inline-flex items-center gap-1.5 rounded-lg border border-dashed border-white/[0.12] px-3 py-2 text-[13px] font-medium text-slate-400 transition hover:border-white/25 hover:text-slate-200"
            >
              + Contacto del asegurado
            </button>
            <button
              type="button"
              onClick={() => setContactos((prev) => [...prev, nuevoContacto('tercero')])}
              className="inline-flex items-center gap-1.5 rounded-lg border border-dashed border-white/[0.12] px-3 py-2 text-[13px] font-medium text-slate-400 transition hover:border-white/25 hover:text-slate-200"
            >
              + Contacto del tercero
            </button>
          </div>
        </div>
        <FField label="Correo del asegurado">
          <input type="email" value={correoAsegurado} onChange={(e) => setCorreoAsegurado(e.target.value)} className={baseInput} placeholder="nombre@correo.com" />
        </FField>

        {/* ---- Cierre ---- */}
        <FSection n="7" title="Observaciones y recomendación" />
        <FField label="Observaciones relevantes">
          <textarea value={observaciones} onChange={(e) => setObservaciones(e.target.value)} className={baseTextarea} />
        </FField>
        <FField label="Recomendación del abogado">
          <textarea value={recomendacion} onChange={(e) => setRecomendacion(e.target.value)} className={baseTextarea} placeholder="Ej. Se sugiere llegar a un acuerdo de transacción extrajudicial…" />
        </FField>
        <FField label="Fecha de actualización de la información">
          <input type="date" value={fechaActualizacion} onChange={(e) => setFechaActualizacion(e.target.value)} className={cn(baseInput, 'sm:max-w-[220px]')} />
        </FField>

        {error && (
          <div className="rounded-lg border border-red-500/30 bg-red-500/10 p-3 text-sm text-red-300">{error}</div>
        )}
      </div>

      <div className="flex gap-2 border-t border-white/[0.06] px-5 py-4">
        <button
          type="submit"
          disabled={guardando}
          className="inline-flex items-center rounded-lg bg-pago px-4 py-2 text-sm font-semibold text-white transition hover:bg-cyan-600 disabled:opacity-50"
        >
          {guardando ? 'Guardando…' : 'Registrar informe'}
        </button>
        <button
          type="button"
          onClick={onClose}
          className="inline-flex items-center rounded-lg border border-white/[0.08] px-4 py-2 text-sm font-medium text-slate-400 transition hover:bg-white/[0.03] hover:text-slate-200"
        >
          Cancelar
        </button>
      </div>
    </Shell>
  );
}

/* ---------------- Contenedor del modal ---------------- */

function Shell({
  titulo,
  subtitulo,
  onClose,
  onSubmit,
  children,
}: {
  titulo: string;
  subtitulo: string;
  onClose: () => void;
  onSubmit?: (e: FormEvent) => void;
  children: React.ReactNode;
}) {
  const inner = (
    <>
      <div className="flex items-center justify-between border-b border-white/[0.06] px-5 py-4">
        <div>
          <h2 className="text-base font-semibold text-white">{titulo}</h2>
          <p className="mt-0.5 text-[11px] text-slate-500">{subtitulo}</p>
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
      {children}
    </>
  );

  const clases = 'w-full max-w-3xl rounded-2xl border border-white/10 bg-ink-800 text-slate-200 shadow-2xl';

  return (
    <div
      className="fade-in fixed inset-0 z-50 flex items-start justify-center overflow-y-auto bg-black/60 p-4 backdrop-blur-sm sm:p-8"
      onClick={onClose}
    >
      {onSubmit ? (
        <form onSubmit={onSubmit} className={clases} onClick={(e) => e.stopPropagation()}>
          {inner}
        </form>
      ) : (
        <div className={clases} onClick={(e) => e.stopPropagation()}>
          {inner}
        </div>
      )}
    </div>
  );
}
