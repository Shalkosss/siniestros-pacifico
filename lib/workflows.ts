import type { Siniestro, TipoSiniestro } from './types';

/** Datos mínimos del siniestro que necesita el workflow para repartir responsables. */
export type SiniestroRuteo = Pick<Siniestro, 'codigo'> & Partial<Pick<Siniestro, 'es_uber'>>;

export interface EtapaConfig {
  nombre: string;
  responsableFn: (siniestro: SiniestroRuteo) => string;
}

/**
 * Workflow estándar de Pago (también usado por Valorización e Info Póliza por default).
 * v8: se eliminó la etapa "Actividad creada" — la creación de la actividad ahora
 * ocurre dentro de "Solicitud recibida" (proceso reducido).
 */
const WORKFLOW_PAGO: EtapaConfig[] = [
  { nombre: 'Solicitud recibida', responsableFn: () => 'Rodrigo' },
  {
    nombre: 'En proceso de firmas',
    // 10 dígitos → Jack. 8 dígitos → Christian, salvo los UBER que son de Katty (v13).
    responsableFn: (s) =>
      s.codigo.length === 10 ? 'Jack' : s.es_uber ? 'Katty' : 'Christian',
  },
  { nombre: 'En trama', responsableFn: () => 'Rodrigo' },
  { nombre: 'Pagado', responsableFn: () => 'Rodrigo' },
];

/**
 * Define el flujo de columnas y el responsable de cada etapa por tipo de siniestro.
 * Valorización e Info Póliza usan por default el mismo workflow que Pago.
 * Si Estef define columnas distintas, ajustar aquí.
 */
export const WORKFLOWS: Record<TipoSiniestro, EtapaConfig[]> = {
  pago: WORKFLOW_PAGO,
  reembolso: WORKFLOW_PAGO,
  valorizacion: WORKFLOW_PAGO,
  info_poliza: WORKFLOW_PAGO,
  deducible: [
    { nombre: 'Solicitud recibida', responsableFn: () => 'Rosita' },
    { nombre: 'Correo enviado', responsableFn: () => 'Rodrigo' },
    { nombre: 'Cobrado', responsableFn: () => 'Rodrigo' },
  ],
};

/** Etiquetas para el tipo en singular y plural */
export const TIPO_LABELS: Record<TipoSiniestro, { singular: string; plural: string }> = {
  pago: { singular: 'Pago', plural: 'Pagos' },
  reembolso: { singular: 'Reembolso', plural: 'Reembolsos' },
  deducible: { singular: 'Deducible', plural: 'Deducibles' },
  valorizacion: { singular: 'Valorización', plural: 'Valorizaciones' },
  info_poliza: { singular: 'Info Póliza', plural: 'Info Póliza' },
};

/** Etapas finales (siniestro cerrado) por tipo */
export const ETAPAS_FINALES: Record<TipoSiniestro, string> = {
  pago: 'Pagado',
  reembolso: 'Pagado',
  deducible: 'Cobrado',
  valorizacion: 'Pagado',
  info_poliza: 'Pagado',
};

export function getEtapas(tipo: TipoSiniestro): string[] {
  return WORKFLOWS[tipo].map((e) => e.nombre);
}

export function getEtapaIndex(tipo: TipoSiniestro, estado: string): number {
  return WORKFLOWS[tipo].findIndex((e) => e.nombre === estado);
}

export function getSiguienteEtapa(tipo: TipoSiniestro, estado: string): string | null {
  const idx = getEtapaIndex(tipo, estado);
  if (idx < 0) return null;
  const next = WORKFLOWS[tipo][idx + 1];
  return next?.nombre ?? null;
}

export function getEtapaAnterior(tipo: TipoSiniestro, estado: string): string | null {
  const idx = getEtapaIndex(tipo, estado);
  if (idx <= 0) return null;
  return WORKFLOWS[tipo][idx - 1].nombre;
}

export function getResponsableDeEtapa(
  tipo: TipoSiniestro,
  estado: string,
  siniestro: SiniestroRuteo
): string | null {
  const etapa = WORKFLOWS[tipo].find((e) => e.nombre === estado);
  return etapa ? etapa.responsableFn(siniestro) : null;
}

export function esEtapaFinal(tipo: TipoSiniestro, estado: string): boolean {
  return ETAPAS_FINALES[tipo] === estado;
}
