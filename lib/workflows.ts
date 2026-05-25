import type { Siniestro, TipoSiniestro } from './types';

export interface EtapaConfig {
  nombre: string;
  responsableFn: (siniestro: Pick<Siniestro, 'codigo'>) => string;
}

/**
 * Define el flujo de columnas y el responsable de cada etapa por tipo de siniestro.
 * El "responsable" es quien debe mover la tarjeta hacia la SIGUIENTE etapa cuando
 * la tarjeta entra a esta columna.
 */
export const WORKFLOWS: Record<TipoSiniestro, EtapaConfig[]> = {
  pago: [
    { nombre: 'Solicitud recibida', responsableFn: () => 'Rodrigo' },
    {
      nombre: 'Actividad creada',
      responsableFn: (s) => (s.codigo.length === 10 ? 'Jack' : 'Christian'),
    },
    {
      nombre: 'En proceso de firmas',
      responsableFn: (s) => (s.codigo.length === 10 ? 'Jack' : 'Christian'),
    },
    { nombre: 'En trama', responsableFn: () => 'Rodrigo' },
    { nombre: 'Pagado', responsableFn: () => 'Rodrigo' },
  ],
  reembolso: [
    { nombre: 'Solicitud recibida', responsableFn: () => 'Rodrigo' },
    {
      nombre: 'Actividad creada',
      responsableFn: (s) => (s.codigo.length === 10 ? 'Jack' : 'Christian'),
    },
    {
      nombre: 'En proceso de firmas',
      responsableFn: (s) => (s.codigo.length === 10 ? 'Jack' : 'Christian'),
    },
    { nombre: 'En trama', responsableFn: () => 'Rodrigo' },
    { nombre: 'Pagado', responsableFn: () => 'Rodrigo' },
  ],
  deducible: [
    { nombre: 'Solicitud recibida', responsableFn: () => 'Rodrigo' },
    { nombre: 'Actividad creada', responsableFn: () => 'Rosita' },
    { nombre: 'Correo enviado', responsableFn: () => 'Rodrigo' },
    { nombre: 'Cobrado', responsableFn: () => 'Rodrigo' },
  ],
};

/** Etiquetas para el tipo en singular y plural */
export const TIPO_LABELS: Record<TipoSiniestro, { singular: string; plural: string }> = {
  pago: { singular: 'Pago', plural: 'Pagos' },
  reembolso: { singular: 'Reembolso', plural: 'Reembolsos' },
  deducible: { singular: 'Deducible', plural: 'Deducibles' },
};

/** Etapas finales (siniestro cerrado) por tipo */
export const ETAPAS_FINALES: Record<TipoSiniestro, string> = {
  pago: 'Pagado',
  reembolso: 'Pagado',
  deducible: 'Cobrado',
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

/** Determina quién debe ser responsable cuando una tarjeta llega al `estado` indicado. */
export function getResponsableDeEtapa(
  tipo: TipoSiniestro,
  estado: string,
  siniestro: Pick<Siniestro, 'codigo'>
): string | null {
  const etapa = WORKFLOWS[tipo].find((e) => e.nombre === estado);
  return etapa ? etapa.responsableFn(siniestro) : null;
}

export function esEtapaFinal(tipo: TipoSiniestro, estado: string): boolean {
  return ETAPAS_FINALES[tipo] === estado;
}
