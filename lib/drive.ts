import type { DriveSiniestro, Usuario } from './types';

/**
 * Drive de Siniestros — catálogos y visibilidad por estudio.
 *
 * Los valores de los catálogos replican EXACTAMENTE los del Excel
 * "METRICA_LEGAL_CONSOLIDADA" para que todo lo que se agregue desde la web
 * mantenga el mismo formato que la base consolidada.
 */

export const DRIVE_MESES = [
  'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
  'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
] as const;

export const DRIVE_GRAVEDADES = ['Leve', 'Grave'] as const;

export const DRIVE_ESTADOS = ['ABIERTO', 'CERRADO'] as const;

export const DRIVE_SUB_ESTADOS = [
  'Transigido',
  'Archivado',
  'En Negociación',
  'Responsabilidad Tercero',
  'En Evaluación',
  'En Investigación',
  'Rechazado',
  'Asegurado No Autoriza',
  'Asegurado No Paga Deducible',
  'Tercero No Coopera',
  'Daño Material',
  'Judicializado',
  'Cerrado s/detalle',
  'Otros',
] as const;

export const DRIVE_LESIONES = [
  'Policontuso',
  'Politraumatizado',
  'TEC Leve',
  'TEC Moderado',
  'TEC Grave',
  'Esguince',
  'Fallecido',
  'Fractura Pierna',
  'Policontuso y corte',
  'Fractura de clavícula',
  'Fractura de tibia',
  'Cervicalgia',
  'Fractura de muñeca',
  'Fractura de radio y cúbito',
  'Fractura de cadera',
  'Fractura de pelvis',
  'Fractura de columna',
  'Fractura de brazo expuesto',
  'Otros',
] as const;

/** Estudios tal como figuran en la base consolidada */
export const DRIVE_ESTUDIOS = [
  'Abeo',
  'RVC',
  'JH PACIFICO CONSULTING',
  'Chacon',
  'Alejandro',
  'Tuesta',
] as const;

/**
 * Mapeo del `estudio` del usuario (tabla usuarios) al nombre de estudio
 * usado en la base consolidada del Drive.
 */
const ESTUDIO_USUARIO_A_DRIVE: Record<string, string> = {
  'Estudio Abeo': 'Abeo',
  'RVC': 'RVC',
  'JH': 'JH PACIFICO CONSULTING',
  'Chacón': 'Chacon',
  'Tuesta': 'Tuesta',
  'Escobedo': 'Alejandro',
};

/**
 * Estudio del Drive que puede ver este usuario.
 * - Pacífico (admin / terceros / viewer) → null = ve todo.
 * - Abogado → solo su estudio (o '__ninguno__' si no mapea, para no filtrar de más).
 */
export function estudioDriveDe(usuario: Usuario | null): string | null {
  if (!usuario) return '__ninguno__';
  if (usuario.rol !== 'abogado') return null; // Pacífico ve todo
  return ESTUDIO_USUARIO_A_DRIVE[usuario.estudio ?? ''] ?? '__ninguno__';
}

/* ---------------- Alertas: fallecido / unidad retenida ---------------- */

/** Texto agregado del registro en el que buscamos los conceptos. */
function textoRegistro(r: DriveSiniestro): string {
  return [r.lesiones, r.lesion_principal, r.sub_estado]
    .filter(Boolean)
    .join(' ')
    .toLowerCase();
}

/** Autodetección: ¿el registro menciona un fallecido/muerto? */
export function detectaFallecido(r: DriveSiniestro): boolean {
  return /fallecid|muert|deceso|occiso/.test(textoRegistro(r));
}

/** Autodetección: ¿el registro menciona unidad retenida? */
export function detectaUnidadRetenida(r: DriveSiniestro): boolean {
  return /unidad retenida|veh[ií]culo retenido|retenci[oó]n de (la )?unidad|retenid/.test(
    textoRegistro(r)
  );
}

/**
 * Estado efectivo de la alerta: el flag manual (true/false) manda;
 * si es null, decide la autodetección por texto.
 */
export function esFallecido(r: DriveSiniestro): boolean {
  return r.flag_fallecido ?? detectaFallecido(r);
}

export function esUnidadRetenida(r: DriveSiniestro): boolean {
  return r.flag_unidad_retenida ?? detectaUnidadRetenida(r);
}
