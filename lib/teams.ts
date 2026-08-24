import type { Usuario } from './types';

export type TeamSlug =
  | 'pacifico'
  | 'abeo'
  | 'rvc'
  | 'jh'
  | 'chacon'
  | 'tuesta'
  | 'escobedo';

export interface Team {
  slug: TeamSlug;
  label: string;
  /** Nombres de estudios que pertenecen a este equipo (para mapear abogados) */
  estudios?: string[];
  /** True si engloba al equipo interno de Pacífico (admin/terceros/viewer) */
  esPacifico?: boolean;
}

export const TEAMS: Team[] = [
  { slug: 'pacifico', label: 'Pacífico — Equipo Legal', esPacifico: true },
  { slug: 'abeo',     label: 'Estudio Abeo',  estudios: ['Estudio Abeo'] },
  { slug: 'rvc',      label: 'RVC',           estudios: ['RVC'] },
  { slug: 'jh',       label: 'JH',            estudios: ['JH'] },
  { slug: 'chacon',   label: 'Chacón',        estudios: ['Chacón'] },
  { slug: 'tuesta',   label: 'Tuesta',        estudios: ['Tuesta'] },
  { slug: 'escobedo', label: 'Escobedo',      estudios: ['Escobedo'] },
];

export function getTeamBySlug(slug: string | null | undefined): Team | null {
  if (!slug) return null;
  return TEAMS.find((t) => t.slug === slug) ?? null;
}

/** Lista de usuarios filtrada al equipo (la que aparece en el selector tras login). */
export function usuariosDeEquipo(usuarios: Usuario[], teamSlug: TeamSlug | null): Usuario[] {
  if (!teamSlug) return [];
  const team = getTeamBySlug(teamSlug);
  if (!team) return [];
  if (team.esPacifico) {
    return usuarios.filter((u) => u.rol !== 'abogado');
  }
  return usuarios.filter(
    (u) => u.rol === 'abogado' && team.estudios?.includes(u.estudio ?? '')
  );
}

/** Nombre de la env var con la contraseña del equipo */
export function envKeyParaPassword(slug: TeamSlug): string {
  return `TEAM_PASS_${slug.toUpperCase()}`;
}

/**
 * v13 — Usuarios con contraseña personal.
 *
 * Además de la contraseña compartida del equipo, estos usuarios tienen la suya.
 * Al entrar con ella, la sesión queda fijada a ese usuario: no aparece el
 * selector de "¿quién eres?" ni se puede cambiar de persona sin cerrar sesión.
 * La contraseña vive en una env var del servidor (nunca en la base ni en el
 * cliente), igual que las de equipo.
 */
export interface UsuarioConLogin {
  nombre: string;
  team: TeamSlug;
}

export const USUARIOS_CON_LOGIN: UsuarioConLogin[] = [
  { nombre: 'Katty', team: 'pacifico' },
];

/** Nombre de la env var con la contraseña personal de un usuario */
export function envKeyParaUsuario(nombre: string): string {
  const slug = nombre
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toUpperCase()
    .replace(/[^A-Z0-9]+/g, '_');
  return `USER_PASS_${slug}`;
}

/** ¿Este nombre corresponde a un usuario con login propio? */
export function getUsuarioConLogin(nombre: string | null | undefined): UsuarioConLogin | null {
  if (!nombre) return null;
  return USUARIOS_CON_LOGIN.find((u) => u.nombre === nombre) ?? null;
}
