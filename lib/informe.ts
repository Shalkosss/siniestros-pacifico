import type { ContactoTelefono, DriveSiniestro, Lesionado, Usuario } from './types';
import { getCCEstudio, type EmailContenido } from './email';
import { DRIVE_LESIONES } from './drive';

/**
 * Informe de caso — el reporte de 24 puntos que los estudios envían a Pacífico.
 *
 * Este módulo tiene tres cosas:
 *   1. Los catálogos del formulario (causas, responsabilidad, roles de lesionado).
 *   2. Los destinatarios del correo (editables abajo, en DESTINATARIOS_INFORME).
 *   3. El armado del asunto y el cuerpo con el formato exacto acordado.
 *
 * Regla de formato: todo dato que falte se imprime como "-".
 */

/* ============================================================
 *  DESTINATARIOS — edita esta sección para cambiar a quién llega el informe
 * ============================================================ */

export const DESTINATARIOS_INFORME = {
  /** PARA */
  to: [
    'maguerrero@pacifico.com.pe', // María Elena
    'rodrigochallcop@pacifico.com.pe', // Rodrigo Challco
  ],
  /** COPIA */
  cc: [
    'mcisneros@pacifico.com.pe', // Marcos
    'siniestrosautos@pacifico.com.pe', // Siniestros Autos
    'soporteautos@pacifico.com.pe', // Soporte Autos
  ],
  /**
   * Equipo de Marcos — pega aquí los correos cuando los tengas y entran
   * automáticamente en copia. Ejemplo:
   *   equipoMarcos: ['persona1@pacifico.com.pe', 'persona2@pacifico.com.pe'],
   */
  equipoMarcos: [] as string[],
};

/**
 * Copiar también a los compañeros de estudio del abogado que envía
 * (el directorio vive en lib/email.ts → ESTUDIOS_DIRECTORIO).
 * Pendiente de confirmar los correos por equipo: por eso está apagado.
 * Ponlo en true cuando quieras activarlo.
 */
export const CC_COMPANEROS_ESTUDIO: boolean = false;

/** PARA y COPIA finales del informe. */
export function getDestinatariosInforme(remitente?: Usuario | null): {
  to: string[];
  cc: string[];
} {
  const to = [...DESTINATARIOS_INFORME.to];
  const cc = [...DESTINATARIOS_INFORME.cc, ...DESTINATARIOS_INFORME.equipoMarcos];

  if (CC_COMPANEROS_ESTUDIO && remitente) {
    cc.push(...getCCEstudio(remitente));
  }

  const dedupe = (arr: string[]) => {
    const vistos = new Set<string>();
    return arr.filter((e) => {
      const k = e.toLowerCase().trim();
      if (!k || vistos.has(k)) return false;
      vistos.add(k);
      return true;
    });
  };
  const toFinal = dedupe(to);
  const enTo = new Set(toFinal.map((e) => e.toLowerCase()));
  return { to: toFinal, cc: dedupe(cc).filter((e) => !enTo.has(e.toLowerCase())) };
}

/* ============================================================
 *  CATÁLOGOS DEL FORMULARIO
 * ============================================================ */

export const INFORME_CAUSAS = [
  'Choque con tercero',
  'Choque simple',
  'Choque múltiple',
  'Choque y fuga',
  'Atropello',
  'Despiste',
  'Volcadura',
  'Incendio',
  'Robo / Hurto',
  'Otros',
] as const;

export const INFORME_RESPONSABILIDAD = [
  'Asegurado',
  'Tercero',
  'Compartida',
  'Por determinar',
] as const;

export const INFORME_ROLES_LESIONADO = [
  'Conductor Tercero',
  'Ocupante Tercero',
  'Conductor Asegurado',
  'Ocupante Asegurado',
  'Peatón',
  'Otro',
] as const;

/* ============================================================
 *  FORMATO
 * ============================================================ */

/** Valor faltante en el informe. */
const VACIO = '-';

function txt(v: string | null | undefined): string {
  const s = (v ?? '').trim();
  return s === '' ? VACIO : s;
}

function siNo(v: boolean | null | undefined): string {
  if (v == null) return VACIO;
  return v ? 'Sí' : 'No';
}

const MESES_LARGO = [
  'ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
  'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE',
];

const MESES_CORTO = [
  'ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN',
  'JUL', 'AGO', 'SET', 'OCT', 'NOV', 'DIC',
];

/** 'YYYY-MM-DD' → [año, mes(1-12), día]. null si no parsea. */
function partesFecha(iso: string | null | undefined): [number, number, number] | null {
  if (!iso) return null;
  const m = iso.slice(0, 10).match(/^(\d{4})-(\d{2})-(\d{2})$/);
  if (!m) return null;
  return [Number(m[1]), Number(m[2]), Number(m[3])];
}

/** '2026-06-22' → '22/06/2026' */
export function fechaDMY(iso: string | null | undefined): string {
  const p = partesFecha(iso);
  if (!p) return VACIO;
  return `${String(p[2]).padStart(2, '0')}/${String(p[1]).padStart(2, '0')}/${p[0]}`;
}

/** '2026-06-22' → '22 DE JUNIO DE 2026' */
export function fechaLarga(iso: string | null | undefined): string {
  const p = partesFecha(iso);
  if (!p) return VACIO;
  return `${p[2]} DE ${MESES_LARGO[p[1] - 1]} DE ${p[0]}`;
}

/** '2026-06-22' → '22JUN2026' */
export function fechaCompacta(iso: string | null | undefined): string {
  const p = partesFecha(iso);
  if (!p) return VACIO;
  return `${String(p[2]).padStart(2, '0')}${MESES_CORTO[p[1] - 1]}${p[0]}`;
}

/** '2026-06-22' → '06' */
function mesDosDigitos(iso: string | null | undefined): string | null {
  const p = partesFecha(iso);
  return p ? String(p[1]).padStart(2, '0') : null;
}

/** Fecha + hora entre paréntesis: '22/06/2026 (18:20)' */
function fechaHora(iso: string | null | undefined, hora: string | null | undefined): string {
  const f = fechaDMY(iso);
  const h = (hora ?? '').trim();
  if (f === VACIO && !h) return VACIO;
  if (!h) return f;
  return `${f} (${h})`;
}

function soles(v: number | null | undefined): string | null {
  if (v == null || !isFinite(v)) return null;
  return `S/ ${new Intl.NumberFormat('es-PE', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(v)}`;
}

/* ============================================================
 *  ASUNTO
 * ============================================================ */

/**
 * ASESORÍA LEGAL N° 147/06 - SNTRO: 1001526235 - PLACA ASEGURADA: BDS940, FECHA 22JUN2026
 *
 * El "/06" y la fecha final salen de la fecha del siniestro (si falta, de la
 * fecha del reporte). Si el estudio no usa N° de caso, se omite ese tramo.
 */
export function buildAsuntoInforme(r: DriveSiniestro): string {
  const fechaRef = r.fecha_siniestro ?? r.fecha_registro;
  const mes = mesDosDigitos(fechaRef);
  const nro = (r.nro_caso_estudio ?? '').trim();

  const cabecera = nro
    ? `ASESORÍA LEGAL N° ${nro}${mes ? `/${mes}` : ''}`
    : 'ASESORÍA LEGAL';

  return [
    cabecera,
    `SNTRO: ${txt(r.siniestro)}`,
    `PLACA ASEGURADA: ${txt(r.placa_asegurado)}, FECHA ${fechaCompacta(fechaRef)}`,
  ].join(' - ');
}

/* ============================================================
 *  CUERPO
 * ============================================================ */

/** Bloque del punto 15 (una entrada por lesionado). */
function bloqueLesionados(lesionados: Lesionado[] | null): string {
  if (!lesionados || lesionados.length === 0) return `15. Lesiones: ${VACIO}`;
  const partes = lesionados.map((l, i) => {
    const edad = l.edad != null ? ` (${l.edad})` : '';
    return [
      `${i + 1}.`,
      `- ${txt(l.rol)}: ${txt(l.nombre)}${edad}`,
      `- Diagnóstico: ${txt(l.diagnostico)}`,
      `- Lugar de atención: ${txt(l.lugar_atencion)}`,
    ].join('\n');
  });
  return ['15. Lesiones:', ...partes].join('\n');
}

/** Bloque del punto 19 (agrupado en Asegurados / Terceros). */
function bloqueContactos(contactos: ContactoTelefono[] | null): string {
  const asegurados = (contactos ?? []).filter((c) => c.grupo === 'asegurado');
  const terceros = (contactos ?? []).filter((c) => c.grupo === 'tercero');
  if (asegurados.length === 0 && terceros.length === 0) {
    return `19. Contactos telefónicos: ${VACIO}`;
  }
  const linea = (c: ContactoTelefono) => `${txt(c.etiqueta)}: ${txt(c.telefono)}`;
  return [
    '19. Contactos telefónicos:',
    'Asegurados:',
    ...(asegurados.length > 0 ? asegurados.map(linea) : [VACIO]),
    'Terceros:',
    ...(terceros.length > 0 ? terceros.map(linea) : [VACIO]),
  ].join('\n');
}

/** Punto 16, con desglose entre paréntesis cuando hay detalle. */
function lineaMonto(r: DriveSiniestro): string {
  const total = soles(r.monto_cierre);
  const les = soles(r.monto_lesiones);
  const dan = soles(r.monto_danios);
  const desglose = [
    les ? `${les} lesiones personales` : null,
    dan ? `${dan} daños materiales` : null,
  ].filter(Boolean);
  if (!total && desglose.length === 0) return `16. Monto Aproximado De Cierre: ${VACIO}`;
  const base = total ?? VACIO;
  return `16. Monto Aproximado De Cierre: ${base}${
    desglose.length > 0 ? ` (${desglose.join(' + ')})` : ''
  }`;
}

/** Punto 4: "Jonathan Lecca (cobertura aprobada)" */
function lineaAsesor(r: DriveSiniestro): string {
  const nota =
    r.cobertura_aprobada == null
      ? ''
      : r.cobertura_aprobada
      ? ' (cobertura aprobada)'
      : ' (cobertura no aprobada)';
  const nombre = txt(r.asesor);
  return `4. Asesor: ${nombre}${nombre === VACIO ? '' : nota}`;
}

/** Punto 7: "SO Pareja / 999888777" */
function lineaOficial(r: DriveSiniestro): string {
  const partes = [r.oficial_cargo, r.oficial_telefono].map((x) => (x ?? '').trim()).filter(Boolean);
  return `7. Oficial a cargo / teléfono: ${partes.length > 0 ? partes.join(' / ') : VACIO}`;
}

/** Punto 5: dirección exacta y, si están, distrito/provincia. */
function lineaLugar(r: DriveSiniestro): string {
  const partes = [r.lugar, r.distrito, r.provincia].map((x) => (x ?? '').trim()).filter(Boolean);
  // Evita repetir "Cercado de Lima" si ya viene dentro de la dirección.
  const unicas = partes.filter(
    (p, i) => !partes.slice(0, i).some((q) => q.toLowerCase().includes(p.toLowerCase()))
  );
  return `5. Lugar del siniestro: ${unicas.length > 0 ? unicas.join(', ') : VACIO}`;
}

/** Encabezado: "INFORME N.º CASO 147 – 22 DE JUNIO DE 2026" */
export function buildEncabezadoInforme(r: DriveSiniestro): string {
  const fecha = fechaLarga(r.fecha_actualizacion ?? r.fecha_registro);
  const nro = (r.nro_caso_estudio ?? '').trim();
  return nro ? `INFORME N.º CASO ${nro} – ${fecha}` : `INFORME – ${fecha}`;
}

/**
 * Cuerpo completo del informe, con la numeración tal cual la usan los estudios
 * (incluido el punto "2" repetido para la hora de llegada).
 */
export function buildCuerpoInforme(r: DriveSiniestro): string {
  const bloques: string[] = [
    buildEncabezadoInforme(r),
    `1. N° Siniestro: ${txt(r.siniestro)} / N° Caso: ${txt(r.nro_caso)}`,
    `2. Fecha y hora del reporte: ${fechaHora(r.fecha_registro, r.hora_reporte)}`,
    `2. Hora de llegada: ${fechaHora(r.fecha_llegada ?? r.fecha_registro, r.hora_llegada)}`,
    `3. Fecha y hora del siniestro: ${fechaHora(r.fecha_siniestro, r.hora_siniestro)}`,
    lineaAsesor(r),
    lineaLugar(r),
    `6. Comisaría: ${txt(r.comisaria)}`,
    lineaOficial(r),
    `8. Causa: ${txt(r.causa)}`,
    `9. Conductor y/o asegurado: ${txt(r.conductor_asegurado)}`,
    `10. Responsabilidad: ${txt(r.responsabilidad)}`,
    `11. Abogado Asignado: ${txt(r.abogado)}`,
    `12. Placa del vehículo asegurado: ${txt(r.placa_asegurado)}`,
    `13. Placa del vehículo Tercero: ${txt(r.placa_tercero)}`,
    `14. Daños materiales: ${siNo(r.danios_materiales)}`,
    bloqueLesionados(r.lesionados),
    lineaMonto(r),
    // El punto va solo cuando hay dato; "En negociación: -." se lee raro.
    `17. En negociación: ${siNo(r.en_negociacion)}${r.en_negociacion == null ? '' : '.'}`,
    `18. Comunicaciones: ${siNo(r.comunicaciones)}${r.comunicaciones == null ? '' : '.'}`,
    bloqueContactos(r.contactos),
    `20. Correo del asegurado: ${txt(r.correo_asegurado)}`,
    `21. Proceso penal / Civil: ${siNo(r.proceso_penal)} / ${siNo(r.proceso_civil)}`,
    `22. Observaciones relevantes: ${txt(r.observaciones)}`,
    `23. Recomendación del abogado: ${txt(r.recomendacion)}`,
    `24. Fecha de actualización de la información: ${fechaDMY(
      r.fecha_actualizacion ?? r.fecha_registro
    )}`,
    'Saludos.',
  ];

  // Una línea en blanco entre puntos, como en el informe original.
  return bloques.join('\n\n');
}

/** Correo listo para abrir en Gmail/Outlook/Yahoo. */
export function buildEmailInforme(r: DriveSiniestro, remitente?: Usuario | null): EmailContenido {
  const { to, cc } = getDestinatariosInforme(remitente);
  return {
    to,
    cc,
    subject: buildAsuntoInforme(r),
    body: buildCuerpoInforme(r),
  };
}

/* ============================================================
 *  DERIVADOS PARA LA MÉTRICA LEGAL
 * ============================================================ */

/** minúsculas y sin tildes, para comparar diagnósticos contra el catálogo */
function sinTildes(s: string): string {
  return s.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '');
}

/**
 * Intenta clasificar un diagnóstico libre dentro del catálogo de la base
 * consolidada (DRIVE_LESIONES). Si no calza con ninguno devuelve null y la
 * lesión principal se elige a mano desde el detalle del caso.
 */
export function clasificarLesion(diagnostico: string): string | null {
  const dx = sinTildes(diagnostico);
  if (!dx.trim()) return null;
  // El catálogo más específico primero: "Fractura de cadera" antes que "Otros".
  const candidatos = DRIVE_LESIONES.filter((l) => l !== 'Otros')
    .slice()
    .sort((a, b) => b.length - a.length);
  return candidatos.find((l) => dx.includes(sinTildes(l))) ?? null;
}

/**
 * De los lesionados del informe salen las tres columnas que la base consolidada
 * ya usaba: cantidad, detalle en texto y lesión principal (la del primero).
 */
export function derivarLesiones(lesionados: Lesionado[]): {
  cant_lesionados: number;
  lesiones: string | null;
  lesion_principal: string | null;
} {
  const validos = lesionados.filter((l) => l.nombre.trim() || l.diagnostico.trim());
  if (validos.length === 0) {
    return { cant_lesionados: 0, lesiones: null, lesion_principal: null };
  }
  const lesiones = validos
    .map((l) => {
      const edad = l.edad != null ? ` (${l.edad})` : '';
      const dx = l.diagnostico.trim() ? ` (${l.diagnostico.trim()})` : '';
      return `${l.rol}: ${l.nombre.trim()}${edad}${dx}`;
    })
    .join('; ');
  // La columna "Lesión principal" es pública, así que solo guardamos el valor
  // del catálogo — nunca el diagnóstico literal del lesionado.
  const principal = validos.map((l) => clasificarLesion(l.diagnostico)).find(Boolean) ?? null;
  return { cant_lesionados: validos.length, lesiones, lesion_principal: principal };
}
