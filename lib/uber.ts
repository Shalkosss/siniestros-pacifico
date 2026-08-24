import type { Siniestro } from './types';

/**
 * v13 — Categoría UBER.
 *
 * No es un tipo de siniestro nuevo: es una marca dentro de Pagos y Reembolsos.
 * Reparto de las vistas por usuario (ver `lib/vistas.ts`):
 *   - Katty:     UBER de 8 dígitos
 *   - Christian: 8 dígitos que NO son UBER
 *   - Jack:      10 dígitos (con o sin UBER)
 */

/** Tipos donde tiene sentido marcar UBER */
export function admiteUber(tipo: Siniestro['tipo']): boolean {
  return tipo === 'pago' || tipo === 'reembolso';
}

export function esUber(s: Pick<Siniestro, 'es_uber'>): boolean {
  return !!s.es_uber;
}

/**
 * Verde apagado (sage), elegido para que se distinga sobre el fondo gris
 * oscuro sin ser chillón como el emerald del tema.
 *   accent  #6f9c7e — punto, borde izquierdo, ícono
 *   texto   #93c4a4 — etiquetas sobre fondo oscuro
 */
export const UBER_ACCENT = '#6f9c7e';
export const UBER_TEXT = '#93c4a4';

/** Anillo + tinte de fondo para la tarjeta del kanban */
export const UBER_CARD = 'ring-1 ring-[rgba(111,156,126,0.45)] bg-[rgba(111,156,126,0.07)]';

/** Borde izquierdo de la tarjeta (pisa al color del tipo) */
export const UBER_BORDER = 'border-l-[#6f9c7e]';

/** Chip/etiqueta "UBER" */
export const UBER_CHIP =
  'bg-[rgba(111,156,126,0.16)] text-[#93c4a4] ring-1 ring-[rgba(111,156,126,0.35)]';

/** Tinte de sección/panel (fondos amplios) */
export const UBER_PANEL =
  'bg-[rgba(111,156,126,0.05)] border border-[rgba(111,156,126,0.18)]';
