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
