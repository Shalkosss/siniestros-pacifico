import type { DriveSiniestro } from './types';
import { DRIVE_ESTADOS, DRIVE_ESTUDIOS, DRIVE_GRAVEDADES, DRIVE_MESES } from './drive';

/**
 * Import/Export de Excel para el Drive de Siniestros.
 *
 * Los estudios manejan reportes mensuales en Excel con encabezados que varían
 * ("N° SINIESTRO", "Nro Siniestro", "FECHA REGISTRO", etc.). Aquí normalizamos
 * esos encabezados y valores al formato de la base consolidada, para que el
 * import en lote produzca filas idénticas a las creadas desde el formulario.
 */

/** Fila lista para insertar en `drive_siniestros` (sin id/created_at). */
export interface DriveImportRow {
  siniestro: string;
  anio: number | null;
  mes: string | null;
  provincia: string | null;
  distrito: string | null;
  comisaria: string | null;
  fecha_registro: string | null;
  fecha_siniestro: string | null;
  abogado: string | null;
  cant_lesionados: number | null;
  lesiones: string | null;
  lesion_principal: string | null;
  reserva_inicial: number | null;
  gravedad: string | null;
  reserva_final: number | null;
  ahorro: number | null;
  fecha_cierre: string | null;
  tiempo_cierre: number | null;
  sub_estado: string | null;
  estado: string | null;
  estudio: string;
  creado_por: string | null;
  /** v12 — dato público del informe; también se puede traer del Excel */
  placa_asegurado: string | null;
}

/** Campos que la importación puede pisar en un caso ya registrado. */
export type DriveUpdatePatch = Partial<Omit<DriveImportRow, 'siniestro' | 'estudio' | 'creado_por'>>;

/** Caso que ya existe en la base y que el Excel trae con datos distintos. */
export interface DriveUpdateRow {
  id: string;
  siniestro: string;
  estudio: string;
  patch: DriveUpdatePatch;
  /** Descripción legible de cada cambio: 'Estado: ABIERTO → CERRADO' */
  cambios: string[];
}

export interface DriveImportResult {
  /** Casos nuevos, listos para insertar */
  filas: DriveImportRow[];
  /**
   * Casos que ya estaban registrados y que el Excel actualiza.
   * Manda siempre el Excel: si trae un valor distinto, ese valor gana.
   * Las celdas vacías no borran lo que ya había.
   */
  actualizaciones: DriveUpdateRow[];
  /** Casos ya registrados que vienen idénticos (no se tocan) */
  sinCambios: number;
  /** Filas sin estudio identificable (solo puede pasar para Pacífico sin default) */
  sinEstudio: number;
  /** Errores por fila (fila de Excel → motivo) */
  errores: string[];
  /** Encabezados del Excel que no se pudieron mapear (informativo) */
  columnasIgnoradas: string[];
}

/* ---------------- Normalización ---------------- */

/** minúsculas, sin tildes, solo alfanumérico — para comparar encabezados */
function norm(s: string): string {
  return s
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]/g, '');
}

/** Alias de encabezados → campo de la base. Se comparan normalizados. */
const HEADER_ALIASES: Record<string, keyof DriveImportRow> = {};
function alias(campo: keyof DriveImportRow, ...names: string[]) {
  for (const n of names) HEADER_ALIASES[norm(n)] = campo;
}
alias('siniestro', 'siniestro', 'n siniestro', 'nro siniestro', 'n° siniestro', 'num siniestro', 'numero siniestro', 'numero de siniestro', 'cod siniestro', 'codigo siniestro', 'codigo del siniestro', 'caso', 'n caso', 'nro caso');
alias('anio', 'año', 'anio', 'ano', 'year');
alias('mes', 'mes');
alias('provincia', 'provincia', 'prov');
alias('distrito', 'distrito', 'dist');
alias('comisaria', 'comisaria', 'comisaría', 'dependencia policial');
alias('fecha_registro', 'fecha de registro', 'fecha registro', 'f registro', 'f de registro', 'fec registro', 'fecha de ingreso', 'fecha ingreso', 'fecha de asignacion', 'fecha asignacion');
alias('fecha_siniestro', 'fecha de siniestro', 'fecha siniestro', 'f siniestro', 'fec siniestro', 'fecha de ocurrencia', 'fecha ocurrencia', 'fecha del siniestro');
alias('abogado', 'abogado', 'abogado a cargo', 'responsable', 'abogado responsable');
alias('cant_lesionados', 'cant lesionados', 'cantidad lesionados', 'cantidad de lesionados', 'n lesionados', 'nro lesionados', 'num lesionados', 'lesionados');
alias('lesiones', 'lesiones', 'detalle de lesiones', 'detalle lesiones', 'descripcion de lesiones');
alias('lesion_principal', 'lesion principal', 'lesión principal', 'lesion ppal', 'tipo de lesion', 'tipo lesion');
alias('reserva_inicial', 'reserva inicial', 'reserva ini', 'reserva de apertura', 'reserva apertura');
alias('gravedad', 'gravedad', 'severidad');
alias('reserva_final', 'reserva final', 'reserva fin', 'reserva de cierre', 'reserva cierre');
alias('ahorro', 'ahorro', 'ahorro generado', 'ahorro s');
alias('fecha_cierre', 'fecha de cierre', 'fecha cierre', 'f cierre', 'fec cierre');
alias('tiempo_cierre', 'tiempo de cierre', 'tiempo cierre', 'tiempo de cierre dias', 'dias de cierre', 'dias cierre', 'tiempo dias');
alias('sub_estado', 'sub estado', 'subestado', 'sub-estado', 'detalle estado', 'situacion');
alias('estado', 'estado', 'status', 'estatus');
alias('estudio', 'estudio', 'estudio legal', 'estudio abogados', 'proveedor');
alias('creado_por', 'creado por', 'registrado por');
// Ojo: "N° CASO" ya está tomado más arriba como código de siniestro, así que
// aquí solo agregamos variantes inequívocas de placa.
alias('placa_asegurado', 'placa', 'placa asegurada', 'placa del vehiculo asegurado', 'placa vehiculo asegurado', 'placa asegurado', 'placa del asegurado');

/**
 * Matching difuso cuando el alias exacto no calza (encabezados con caracteres
 * mangleados por encoding, prefijos/sufijos extra, etc.). El ORDEN importa:
 * los más específicos van primero ("fecha siniestro" antes que "siniestro").
 */
const HEADER_FUZZY: [RegExp, keyof DriveImportRow][] = [
  [/placa/, 'placa_asegurado'],
  [/fecha.*regist|fecha.*ingreso|fecha.*asignacion|fregistro/, 'fecha_registro'],
  [/fecha.*siniestro|fecha.*ocurrencia|fsiniestro/, 'fecha_siniestro'],
  [/fecha.*cierre|fcierre/, 'fecha_cierre'],
  [/tiempo/, 'tiempo_cierre'],
  [/reserva.*(ini|apert)/, 'reserva_inicial'],
  [/reserva.*(fin|cierre)/, 'reserva_final'],
  [/ahorro/, 'ahorro'],
  [/lesion.*(principal|ppal)/, 'lesion_principal'],
  [/lesionados/, 'cant_lesionados'],
  [/lesion/, 'lesiones'],
  [/sub.*estado|situacion/, 'sub_estado'],
  [/^estado$|^status$|^estatus$/, 'estado'],
  [/estudio|proveedor/, 'estudio'],
  [/gravedad|severidad/, 'gravedad'],
  [/abogado|responsable/, 'abogado'],
  [/provincia/, 'provincia'],
  [/distrito/, 'distrito'],
  [/comisaria|dependencia/, 'comisaria'],
  [/^mes$/, 'mes'],
  [/^(ano|anio|aao|ao|year)$/, 'anio'],
  [/siniestro|expediente|^caso$|^n.?caso$/, 'siniestro'],
];

/** Resuelve un encabezado de Excel al campo de la base (exacto → difuso). */
function campoDeHeader(header: string): keyof DriveImportRow | null {
  const n = norm(header);
  if (!n) return null;
  if (HEADER_ALIASES[n]) return HEADER_ALIASES[n];
  for (const [re, campo] of HEADER_FUZZY) {
    if (re.test(n)) return campo;
  }
  return null;
}

/** Meses aceptados (incluye "Setiembre", usual en Perú) → formato de la base */
const MES_ALIASES: Record<string, string> = {};
for (const m of DRIVE_MESES) MES_ALIASES[norm(m)] = m;
MES_ALIASES[norm('Setiembre')] = 'Septiembre';
// También números 1-12
DRIVE_MESES.forEach((m, i) => {
  MES_ALIASES[String(i + 1)] = m;
  MES_ALIASES[String(i + 1).padStart(2, '0')] = m;
});

/** Estudios: acepta variantes ("JH", "jh pacifico", "Chacón", "Escobedo"→Alejandro) */
const ESTUDIO_ALIASES: Record<string, string> = {};
for (const e of DRIVE_ESTUDIOS) ESTUDIO_ALIASES[norm(e)] = e;
ESTUDIO_ALIASES[norm('Estudio Abeo')] = 'Abeo';
ESTUDIO_ALIASES[norm('JH')] = 'JH PACIFICO CONSULTING';
ESTUDIO_ALIASES[norm('JH Pacifico')] = 'JH PACIFICO CONSULTING';
ESTUDIO_ALIASES[norm('Chacón')] = 'Chacon';
ESTUDIO_ALIASES[norm('Escobedo')] = 'Alejandro';

/* ---------------- Conversión de valores ---------------- */

/** Convierte celda de fecha (Date de xlsx, serial de Excel o string) → 'YYYY-MM-DD' */
function toISODate(v: unknown): string | null {
  if (v == null || v === '') return null;
  if (v instanceof Date && !isNaN(v.getTime())) {
    // xlsx con cellDates entrega Date en UTC-ish; usamos los getters UTC-safe
    const y = v.getFullYear(), m = v.getMonth() + 1, d = v.getDate();
    return `${y}-${String(m).padStart(2, '0')}-${String(d).padStart(2, '0')}`;
  }
  if (typeof v === 'number' && v > 20000 && v < 80000) {
    // Serial de Excel (días desde 1899-12-30)
    const ms = Math.round((v - 25569) * 86400 * 1000);
    const dt = new Date(ms);
    return dt.toISOString().slice(0, 10);
  }
  const s = String(v).trim();
  // YYYY-MM-DD o YYYY/MM/DD
  let m = s.match(/^(\d{4})[-/](\d{1,2})[-/](\d{1,2})/);
  if (m) return `${m[1]}-${m[2].padStart(2, '0')}-${m[3].padStart(2, '0')}`;
  // DD/MM/YYYY o DD-MM-YYYY o DD.MM.YYYY (formato local)
  m = s.match(/^(\d{1,2})[-/.](\d{1,2})[-/.](\d{2,4})$/);
  if (m) {
    const yy = m[3].length === 2 ? `20${m[3]}` : m[3];
    return `${yy}-${m[2].padStart(2, '0')}-${m[1].padStart(2, '0')}`;
  }
  return null;
}

/** Convierte celda numérica ("S/ 1,500.00", "1500", 1500) → number */
function toNum(v: unknown): number | null {
  if (v == null || v === '') return null;
  if (typeof v === 'number') return isFinite(v) ? v : null;
  const s = String(v).replace(/[^\d.,-]/g, '').replace(/,/g, '');
  if (!s) return null;
  const n = Number(s);
  return isFinite(n) ? n : null;
}

function toStr(v: unknown): string | null {
  if (v == null) return null;
  const s = String(v).trim();
  return s === '' ? null : s;
}

/* ---------------- Parse del Excel ---------------- */

interface ParseOptions {
  /** Estudio fijo (abogados) o default para filas sin estudio (Pacífico). null = exigir columna. */
  estudioDefault: string | null;
  /** Si el usuario es un abogado, TODAS las filas se fuerzan a su estudio. */
  forzarEstudio: boolean;
  creadoPor: string;
  /**
   * Casos ya registrados, indexados por `${estudio}::${siniestro}`.
   * Sirven para decidir qué es alta nueva y qué es actualización.
   */
  existentes: Map<string, DriveSiniestro>;
}

export function claveDuplicado(estudio: string, siniestro: string): string {
  return `${norm(estudio)}::${norm(siniestro)}`;
}

/** Índice `${estudio}::${siniestro}` → registro, para pasarle a parseDriveExcel. */
export function indexarExistentes(registros: DriveSiniestro[]): Map<string, DriveSiniestro> {
  const map = new Map<string, DriveSiniestro>();
  for (const r of registros) map.set(claveDuplicado(r.estudio, r.siniestro), r);
  return map;
}

/** Nombre legible de cada campo, para explicar los cambios al usuario. */
const CAMPO_LABEL: Partial<Record<keyof DriveImportRow, string>> = {
  anio: 'Año',
  mes: 'Mes',
  provincia: 'Provincia',
  distrito: 'Distrito',
  comisaria: 'Comisaría',
  fecha_registro: 'Fecha de registro',
  fecha_siniestro: 'Fecha del siniestro',
  abogado: 'Abogado',
  cant_lesionados: 'Cant. lesionados',
  lesiones: 'Lesiones',
  lesion_principal: 'Lesión principal',
  reserva_inicial: 'Reserva inicial',
  gravedad: 'Gravedad',
  reserva_final: 'Reserva final',
  ahorro: 'Ahorro',
  fecha_cierre: 'Fecha de cierre',
  tiempo_cierre: 'Tiempo de cierre',
  sub_estado: 'Sub estado',
  estado: 'Estado',
  placa_asegurado: 'Placa',
};

/** ¿El valor del Excel es el mismo que ya está guardado? */
function mismoValor(nuevo: unknown, actual: unknown): boolean {
  if (nuevo == null && actual == null) return true;
  if (nuevo == null || actual == null) return false;
  if (typeof nuevo === 'number' || typeof actual === 'number') {
    const a = Number(nuevo);
    const b = Number(actual);
    if (isFinite(a) && isFinite(b)) return a === b;
  }
  return String(nuevo).trim() === String(actual).trim();
}

function mostrar(v: unknown): string {
  return v == null || v === '' ? 'vacío' : String(v);
}

/**
 * Parsea un .xlsx/.xls (ArrayBuffer) o .csv (string UTF-8) y lo adapta al
 * formato del Drive. Devuelve filas listas para insertar + reporte de omitidos/errores.
 */
export async function parseDriveExcel(buffer: ArrayBuffer | string, opts: ParseOptions): Promise<DriveImportResult> {
  const XLSX = await import('xlsx');
  // CSV: raw=true para que las fechas queden como texto y las parseemos nosotros
  // en DD/MM/YYYY (XLSX las interpretaría como MM/DD, formato US).
  // Excel binario: cellDates=true entrega Date desde el serial, sin ambigüedad.
  const wb = typeof buffer === 'string'
    ? XLSX.read(buffer, { type: 'string', raw: true })
    : XLSX.read(buffer, { type: 'array', cellDates: true });
  const sheet = wb.Sheets[wb.SheetNames[0]];
  if (!sheet) {
    return {
      filas: [], actualizaciones: [], sinCambios: 0, sinEstudio: 0,
      errores: ['El archivo no tiene hojas.'], columnasIgnoradas: [],
    };
  }

  // Matriz cruda para localizar la fila de encabezados (algunos reportes tienen título arriba)
  const matriz: unknown[][] = XLSX.utils.sheet_to_json(sheet, { header: 1, defval: null });
  let headerIdx = -1;
  let mapa: (keyof DriveImportRow | null)[] = [];
  const ignoradas: string[] = [];

  for (let i = 0; i < Math.min(matriz.length, 15); i++) {
    const fila = matriz[i] ?? [];
    const candidato = fila.map((c) => (c == null ? null : campoDeHeader(String(c))));
    // La fila de encabezados debe mapear al menos el código de siniestro y 2 campos más
    const mapeados = candidato.filter(Boolean).length;
    if (candidato.includes('siniestro') && mapeados >= 3) {
      headerIdx = i;
      mapa = candidato;
      fila.forEach((c, j) => {
        if (c != null && String(c).trim() !== '' && candidato[j] == null) ignoradas.push(String(c).trim());
      });
      break;
    }
  }

  if (headerIdx === -1) {
    return {
      filas: [], actualizaciones: [], sinCambios: 0, sinEstudio: 0,
      errores: ['No se encontró la fila de encabezados. El Excel debe tener una columna con el N° de siniestro (ej. "SINIESTRO") y al menos otras 2 columnas reconocibles (MES, ABOGADO, LESIONES, etc.).'],
      columnasIgnoradas: [],
    };
  }

  const filas: DriveImportRow[] = [];
  const actualizaciones: DriveUpdateRow[] = [];
  const errores: string[] = [];
  let sinCambios = 0;
  let sinEstudio = 0;
  const vistosEnArchivo = new Set<string>();

  for (let i = headerIdx + 1; i < matriz.length; i++) {
    const cells = matriz[i] ?? [];
    if (cells.every((c) => c == null || String(c).trim() === '')) continue; // fila vacía

    const raw: Partial<Record<keyof DriveImportRow, unknown>> = {};
    mapa.forEach((campo, j) => {
      if (campo) raw[campo] = cells[j];
    });

    const siniestro = toStr(raw.siniestro);
    const filaExcel = i + 1; // 1-indexed como en Excel
    if (!siniestro) { errores.push(`Fila ${filaExcel}: sin código de siniestro.`); continue; }

    // Estudio: forzado (abogados) > columna del Excel > default elegido
    let estudio: string | null = null;
    if (opts.forzarEstudio) {
      estudio = opts.estudioDefault;
    } else {
      const cruda = toStr(raw.estudio);
      estudio = (cruda ? ESTUDIO_ALIASES[norm(cruda)] ?? null : null) ?? opts.estudioDefault;
    }
    if (!estudio) { sinEstudio++; errores.push(`Fila ${filaExcel} (${siniestro}): estudio no reconocido.`); continue; }

    // Contra el propio archivo sí seguimos omitiendo repetidos: gana la 1ª fila.
    const clave = claveDuplicado(estudio, siniestro);
    if (vistosEnArchivo.has(clave)) continue;
    vistosEnArchivo.add(clave);
    const existente = opts.existentes.get(clave) ?? null;

    /** ¿La celda del Excel traía algo? Las vacías no pisan lo ya guardado. */
    const hayCelda = (c: keyof DriveImportRow) =>
      raw[c] != null && String(raw[c]).trim() !== '';

    const fecha_registro = toISODate(raw.fecha_registro);
    const fecha_cierre = toISODate(raw.fecha_cierre);

    // Año y mes: columna del Excel o derivados de la fecha de registro
    let anio = toNum(raw.anio);
    if (anio != null) anio = Math.trunc(anio);
    let mes = raw.mes != null ? MES_ALIASES[norm(String(raw.mes))] ?? null : null;
    if (fecha_registro) {
      const [y, m] = fecha_registro.split('-').map(Number);
      if (anio == null) anio = y;
      if (mes == null) mes = DRIVE_MESES[m - 1] ?? null;
    }

    // Estado normalizado; si hay fecha de cierre y no dice nada, asumimos CERRADO
    const estadoCrudo = toStr(raw.estado)?.toUpperCase() ?? null;
    let estado: string = estadoCrudo && norm(estadoCrudo).startsWith('cerr') ? 'CERRADO'
      : estadoCrudo && norm(estadoCrudo).startsWith('ab') ? 'ABIERTO'
      : fecha_cierre ? 'CERRADO' : 'ABIERTO';
    if (!DRIVE_ESTADOS.includes(estado as (typeof DRIVE_ESTADOS)[number])) estado = 'ABIERTO';

    // Gravedad al catálogo (Leve/Grave); otros valores se conservan tal cual
    const gravedadCruda = toStr(raw.gravedad);
    const gravedad = gravedadCruda
      ? DRIVE_GRAVEDADES.find((g) => norm(g) === norm(gravedadCruda)) ?? gravedadCruda
      : null;

    // Tiempo de cierre: del Excel o derivado de las fechas
    let tiempo_cierre = toNum(raw.tiempo_cierre);
    if (tiempo_cierre != null) tiempo_cierre = Math.trunc(tiempo_cierre);
    if (tiempo_cierre == null && estado === 'CERRADO' && fecha_registro && fecha_cierre) {
      const d = (new Date(fecha_cierre).getTime() - new Date(fecha_registro).getTime()) / 86400000;
      tiempo_cierre = Math.max(0, Math.round(d));
    }

    const lesiones = toStr(raw.lesiones);
    const lesion_principal = toStr(raw.lesion_principal) ?? lesiones;
    let cant = toNum(raw.cant_lesionados);
    if (cant != null) cant = Math.trunc(cant);

    const fila: DriveImportRow = {
      siniestro,
      anio, mes,
      provincia: toStr(raw.provincia),
      distrito: toStr(raw.distrito),
      comisaria: toStr(raw.comisaria),
      fecha_registro, fecha_siniestro: toISODate(raw.fecha_siniestro),
      abogado: toStr(raw.abogado),
      cant_lesionados: cant,
      lesiones: lesiones ?? lesion_principal,
      lesion_principal,
      reserva_inicial: toNum(raw.reserva_inicial),
      gravedad,
      reserva_final: toNum(raw.reserva_final),
      ahorro: toNum(raw.ahorro),
      fecha_cierre: estado === 'CERRADO' ? fecha_cierre : null,
      tiempo_cierre,
      sub_estado: toStr(raw.sub_estado),
      estado,
      estudio,
      creado_por: opts.creadoPor,
      placa_asegurado: toStr(raw.placa_asegurado)?.toUpperCase() ?? null,
    };

    if (!existente) {
      filas.push(fila);
      continue;
    }

    /* ---- El caso ya existe: manda el Excel, pero solo en lo que trae ----
     * Campos derivados: año/mes vienen de la fecha de registro; estado y tiempo
     * de cierre, de la fecha de cierre. Por eso cuentan como "traídos" si esas
     * columnas tenían dato.
     */
    const traeCierre = hayCelda('fecha_cierre');
    const candidatos: (keyof DriveImportRow)[] = [
      ...(hayCelda('anio') || hayCelda('fecha_registro') ? (['anio'] as const) : []),
      ...(hayCelda('mes') || hayCelda('fecha_registro') ? (['mes'] as const) : []),
      ...(hayCelda('provincia') ? (['provincia'] as const) : []),
      ...(hayCelda('distrito') ? (['distrito'] as const) : []),
      ...(hayCelda('comisaria') ? (['comisaria'] as const) : []),
      ...(hayCelda('fecha_registro') ? (['fecha_registro'] as const) : []),
      ...(hayCelda('fecha_siniestro') ? (['fecha_siniestro'] as const) : []),
      ...(hayCelda('abogado') ? (['abogado'] as const) : []),
      ...(hayCelda('cant_lesionados') ? (['cant_lesionados'] as const) : []),
      ...(hayCelda('lesiones') || hayCelda('lesion_principal')
        ? (['lesiones', 'lesion_principal'] as const)
        : []),
      ...(hayCelda('reserva_inicial') ? (['reserva_inicial'] as const) : []),
      ...(hayCelda('gravedad') ? (['gravedad'] as const) : []),
      ...(hayCelda('reserva_final') ? (['reserva_final'] as const) : []),
      ...(hayCelda('ahorro') ? (['ahorro'] as const) : []),
      ...(traeCierre ? (['fecha_cierre'] as const) : []),
      ...(hayCelda('tiempo_cierre') || traeCierre ? (['tiempo_cierre'] as const) : []),
      ...(hayCelda('sub_estado') ? (['sub_estado'] as const) : []),
      ...(hayCelda('estado') || traeCierre ? (['estado'] as const) : []),
      ...(hayCelda('placa_asegurado') ? (['placa_asegurado'] as const) : []),
    ];

    const patch: DriveUpdatePatch = {};
    const cambios: string[] = [];
    for (const campo of candidatos) {
      const nuevo = fila[campo];
      const actual = (existente as unknown as Record<string, unknown>)[campo];
      if (mismoValor(nuevo, actual)) continue;
      (patch as Record<string, unknown>)[campo] = nuevo;
      cambios.push(`${CAMPO_LABEL[campo] ?? campo}: ${mostrar(actual)} → ${mostrar(nuevo)}`);
    }

    if (cambios.length === 0) {
      sinCambios++;
      continue;
    }
    actualizaciones.push({ id: existente.id, siniestro, estudio, patch, cambios });
  }

  return { filas, actualizaciones, sinCambios, sinEstudio, errores, columnasIgnoradas: ignoradas };
}

/* ---------------- Export ---------------- */

/** Exporta los registros (ya filtrados) a un .xlsx con el formato de la base consolidada. */
export async function exportDriveExcel(registros: DriveSiniestro[], nombreArchivo: string): Promise<void> {
  const XLSX = await import('xlsx');
  const datos = registros.map((r) => ({
    'SINIESTRO': r.siniestro,
    'PLACA ASEGURADA': r.placa_asegurado ?? '',
    'AÑO': r.anio ?? '',
    'MES': r.mes ?? '',
    'PROVINCIA': r.provincia ?? '',
    'DISTRITO': r.distrito ?? '',
    'COMISARIA': r.comisaria ?? '',
    'FECHA DE REGISTRO': r.fecha_registro ?? '',
    'FECHA DE SINIESTRO': r.fecha_siniestro ?? '',
    'ABOGADO': r.abogado ?? '',
    'CANT. LESIONADOS': r.cant_lesionados ?? '',
    'LESIONES': r.lesiones ?? '',
    'LESIÓN PRINCIPAL': r.lesion_principal ?? '',
    'RESERVA INICIAL': r.reserva_inicial ?? '',
    'GRAVEDAD': r.gravedad ?? '',
    'RESERVA FINAL': r.reserva_final ?? '',
    'AHORRO': r.ahorro ?? '',
    'FECHA DE CIERRE': r.fecha_cierre ?? '',
    'TIEMPO DE CIERRE (DÍAS)': r.tiempo_cierre ?? '',
    'SUB ESTADO': r.sub_estado ?? '',
    'ESTADO': r.estado ?? '',
    'ESTUDIO': r.estudio,
  }));
  const ws = XLSX.utils.json_to_sheet(datos);
  // Anchos de columna razonables para lectura
  ws['!cols'] = [
    { wch: 12 }, { wch: 10 }, { wch: 6 }, { wch: 11 }, { wch: 14 }, { wch: 16 },
    { wch: 16 }, { wch: 12 }, { wch: 12 }, { wch: 14 }, { wch: 8 }, { wch: 28 },
    { wch: 22 }, { wch: 12 }, { wch: 9 }, { wch: 12 }, { wch: 10 }, { wch: 12 },
    { wch: 10 }, { wch: 22 }, { wch: 9 }, { wch: 20 },
  ];
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, 'Siniestros');
  XLSX.writeFile(wb, `${nombreArchivo}.xlsx`);
}
