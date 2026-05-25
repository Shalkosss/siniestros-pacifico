import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function diasDesde(fecha: string | Date): number {
  const d = typeof fecha === 'string' ? new Date(fecha) : fecha;
  const ms = Date.now() - d.getTime();
  return Math.floor(ms / (1000 * 60 * 60 * 24));
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

export function formatMoneda(monto: number | null): string {
  if (monto == null) return '—';
  return new Intl.NumberFormat('es-PE', {
    style: 'currency',
    currency: 'PEN',
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
