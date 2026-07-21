import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';
import type { Moneda, Siniestro } from './types';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function diasDesde(fecha: string | Date): number {
  const d = typeof fecha === 'string' ? new Date(fecha) : fecha;
  const ms = Date.now() - d.getTime();
  return Math.floor(ms / (1000 * 60 * 60 * 24));
}

/**
 * Cuenta días hábiles (lunes a viernes) transcurridos entre `desde` y `hasta`.
 * Excluye sábados y domingos. Nunca devuelve negativo.
 */
export function diasHabilesEntre(desde: string | Date, hasta: string | Date = new Date()): number {
  const inicio = typeof desde === 'string' ? new Date(desde) : new Date(desde);
  const fin = typeof hasta === 'string' ? new Date(hasta) : new Date(hasta);
  // Normalizamos a medianoche para contar días calendario completos.
  inicio.setHours(0, 0, 0, 0);
  fin.setHours(0, 0, 0, 0);
  if (fin <= inicio) return 0;
  let habiles = 0;
  const cursor = new Date(inicio);
  while (cursor < fin) {
    cursor.setDate(cursor.getDate() + 1);
    const dow = cursor.getDay(); // 0 = domingo, 6 = sábado
    if (dow !== 0 && dow !== 6) habiles++;
  }
  return habiles;
}

export function diasHabilesDesde(fecha: string | Date): number {
  return diasHabilesEntre(fecha, new Date());
}

/** v10 — ¿el contador está pausado por Pacífico? */
export function estaPausado(s: Pick<Siniestro, 'pausado'>): boolean {
  return !!s.pausado;
}

/**
 * Días hábiles efectivos que lleva abierto un siniestro.
 * Si Pacífico fijó un ajuste manual (`dias_ajuste`), se toma ese número como base
 * y se le suman los días hábiles transcurridos desde que se fijó.
 * Si está pausado (`pausado`), el conteo queda congelado en la base: el tiempo en
 * pausa no cuenta (al pausar se guarda el valor actual en `dias_ajuste`).
 */
export function diasEfectivos(
  s: Pick<Siniestro, 'created_at' | 'dias_ajuste' | 'dias_ajuste_fecha' | 'pausado'>
): number {
  if (s.dias_ajuste != null && s.dias_ajuste_fecha) {
    if (s.pausado) return s.dias_ajuste; // congelado durante la pausa
    return s.dias_ajuste + diasHabilesDesde(s.dias_ajuste_fecha);
  }
  return diasHabilesDesde(s.created_at);
}

/**
 * Censura un texto para ocultarlo a abogados externos (objeción de IT).
 * Nombres: deja la primera letra de cada palabra. DNI/números: deja solo los
 * últimos 4 dígitos. Si `activar` es false, devuelve el valor tal cual.
 */
export function censurar(valor: string | null | undefined, activar: boolean): string {
  if (!valor) return '—';
  if (!activar) return valor;
  const trimmed = valor.trim();
  // Si es mayormente numérico (DNI), mostramos los últimos 4 dígitos.
  const soloDigitos = trimmed.replace(/\D/g, '');
  if (soloDigitos.length >= 4 && soloDigitos.length / trimmed.length > 0.6) {
    return '••••' + soloDigitos.slice(-4);
  }
  return trimmed
    .split(/\s+/)
    .map((p) => (p ? p[0].toUpperCase() + '•••' : ''))
    .join(' ');
}

export function formatFecha(fecha: string | Date): string {
  const d = typeof fecha === 'string' ? new Date(fecha) : fecha;
  return d.toLocaleString('es-PE', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

export function formatFechaCorta(fecha: string | Date): string {
  const d = typeof fecha === 'string' ? new Date(fecha) : fecha;
  return d.toLocaleDateString('es-PE', { day: '2-digit', month: 'short', year: 'numeric' });
}

export function formatMoneda(monto: number | null, moneda: Moneda = 'PEN'): string {
  if (monto == null) return '—';
  return new Intl.NumberFormat('es-PE', {
    style: 'currency',
    currency: moneda,
    minimumFractionDigits: 2,
  }).format(monto);
}

export function validarCodigo(codigo: string): boolean {
  return /^[0-9]{8}$/.test(codigo) || /^[0-9]{10}$/.test(codigo);
}

/**
 * Niveles de urgencia escalonados:
 *   - verde (0-3): dentro del rango habitual
 *   - amarillo (4-7): cerca del deadline de 7 días hábiles
 *   - rojo (8+): pasó el deadline
 */
export type NivelUrgencia = 'verde' | 'amarillo' | 'rojo';

export function colorPorDias(dias: number): NivelUrgencia {
  if (dias <= 3) return 'verde';
  if (dias <= 7) return 'amarillo';
  return 'rojo';
}
