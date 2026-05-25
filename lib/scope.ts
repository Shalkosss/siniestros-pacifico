import type { Siniestro, Usuario } from './types';

export type ScopeMode = 'mios' | 'estudio' | 'todos';

/**
 * Modos de scope disponibles por rol:
 *   - abogado: Mis | Mi estudio (NO ven "todos")
 *   - terceros: Mis | Todos
 *   - admin: Mis | Todos
 *   - viewer: Todos
 */
export function scopesDisponibles(usuario: Usuario | null): ScopeMode[] {
  if (!usuario) return ['todos'];
  if (usuario.rol === 'viewer') return ['todos'];
  if (usuario.rol === 'abogado') return ['mios', 'estudio'];
  return ['mios', 'todos'];
}

/**
 * Scope por defecto: el "no-mios", es decir el más amplio que pueden ver.
 *   - admin / terceros / viewer → 'todos'
 *   - abogado → 'estudio' (su equivalente de "todos del equipo")
 */
export function scopeDefault(usuario: Usuario | null): ScopeMode {
  if (!usuario) return 'todos';
  if (usuario.rol === 'abogado') return 'estudio';
  return 'todos';
}

/** Modo "amplio" para el rol (el opuesto de 'mios'). Útil para el toggle. */
export function scopeAmplio(usuario: Usuario | null): ScopeMode {
  if (!usuario) return 'todos';
  if (usuario.rol === 'abogado') return 'estudio';
  return 'todos';
}

export function aplicarScope(
  siniestros: Siniestro[],
  usuario: Usuario | null,
  scope: ScopeMode,
  todosLosUsuarios: Usuario[]
): Siniestro[] {
  if (!usuario || scope === 'todos') return siniestros;

  if (scope === 'mios') {
    if (usuario.rol === 'abogado') {
      return siniestros.filter((s) => s.solicitante === usuario.nombre);
    }
    return siniestros.filter((s) => s.asignado_a === usuario.nombre);
  }

  if (scope === 'estudio') {
    if (usuario.rol !== 'abogado' || !usuario.estudio) return siniestros;
    const colegas = new Set(
      todosLosUsuarios
        .filter((u) => u.rol === 'abogado' && u.estudio === usuario.estudio)
        .map((u) => u.nombre)
    );
    return siniestros.filter((s) => colegas.has(s.solicitante));
  }

  return siniestros;
}

export const SCOPE_LABELS: Record<ScopeMode, string> = {
  mios: 'Solo míos',
  estudio: 'Mi estudio',
  todos: 'Todos',
};
