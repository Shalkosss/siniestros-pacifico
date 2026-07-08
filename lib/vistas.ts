import type { Siniestro, Usuario } from './types';

/**
 * Vistas predeterminadas por integrante de Pacífico (objeción de IT / operativa).
 * Cada usuario ve solo los siniestros que le competen, pero puede alternar a
 * "Todo Pacífico" con un botón en el tablero.
 *
 *   - Jack:      pagos y reembolsos de código de 10 dígitos.
 *   - Christian: pagos y reembolsos de código de 8 dígitos.
 *   - Rosita:    solo deducibles.
 */
export const VISTA_PREDETERMINADA: Record<string, (s: Siniestro) => boolean> = {
  Jack: (s) => (s.tipo === 'pago' || s.tipo === 'reembolso') && s.codigo.length === 10,
  Christian: (s) => (s.tipo === 'pago' || s.tipo === 'reembolso') && s.codigo.length === 8,
  Rosita: (s) => s.tipo === 'deducible',
};

export function tieneVistaPredeterminada(usuario: Usuario | null): boolean {
  return !!usuario && usuario.nombre in VISTA_PREDETERMINADA;
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
