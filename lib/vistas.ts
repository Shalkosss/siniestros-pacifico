import type { Siniestro, Usuario } from './types';
import { esUber } from './uber';

/**
 * Vistas predeterminadas por integrante de Pacífico (objeción de IT / operativa).
 * Cada usuario ve solo los siniestros que le competen, pero puede alternar a
 * "Todo Pacífico" con un botón en el tablero.
 *
 *   - Jack:      pagos y reembolsos de código de 10 dígitos.
 *   - Christian: pagos y reembolsos de 8 dígitos que NO son UBER.
 *   - Katty:     pagos y reembolsos UBER de 8 dígitos.
 *   - Rosita:    solo deducibles.
 */
const esPagoOReembolso = (s: Siniestro) => s.tipo === 'pago' || s.tipo === 'reembolso';

export const VISTA_PREDETERMINADA: Record<string, (s: Siniestro) => boolean> = {
  Jack: (s) => esPagoOReembolso(s) && s.codigo.length === 10,
  Christian: (s) => esPagoOReembolso(s) && s.codigo.length === 8 && !esUber(s),
  Katty: (s) => esPagoOReembolso(s) && s.codigo.length === 8 && esUber(s),
  Rosita: (s) => s.tipo === 'deducible',
};

/** Descripción corta de la vista, para el tooltip del toggle en el tablero. */
export const VISTA_DESCRIPCION: Record<string, string> = {
  Jack: 'Pagos y reembolsos de 10 dígitos',
  Christian: 'Pagos y reembolsos de 8 dígitos (sin UBER)',
  Katty: 'Pagos y reembolsos UBER de 8 dígitos',
  Rosita: 'Deducibles',
};

/**
 * Vistas ESTRICTAS: no son un default que se pueda soltar con "Todo Pacífico",
 * son el alcance del usuario. Katty ve los UBER de 8 dígitos y Christian los de
 * 8 dígitos que no son UBER: ninguno ve la cartera del otro.
 *
 * Jack y Rosita conservan el toggle (su vista es una comodidad, no un límite).
 */
export const VISTAS_ESTRICTAS = new Set(['Katty', 'Christian']);

export function tieneVistaPredeterminada(usuario: Usuario | null): boolean {
  return !!usuario && usuario.nombre in VISTA_PREDETERMINADA;
}

/** ¿La vista de este usuario es un límite (no se puede desactivar)? */
export function tieneVistaEstricta(usuario: Usuario | null): boolean {
  return !!usuario && VISTAS_ESTRICTAS.has(usuario.nombre) && usuario.nombre in VISTA_PREDETERMINADA;
}

/**
 * Aplica la vista predeterminada del usuario. Si el usuario no tiene una vista
 * configurada, devuelve la lista sin cambios.
 */
export function aplicarVistaPredeterminada(
  siniestros: Siniestro[],
  usuario: Usuario | null
): Siniestro[] {
  if (!usuario) return siniestros;
  const filtro = VISTA_PREDETERMINADA[usuario.nombre];
  return filtro ? siniestros.filter(filtro) : siniestros;
}
