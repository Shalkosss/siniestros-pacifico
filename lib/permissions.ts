import type { Siniestro, Usuario } from './types';
import { getResponsableDeEtapa, getSiguienteEtapa } from './workflows';

/**
 * Modelo de permisos (Opción 4 del brief):
 *   - admin (Rodrigo): mueve cualquier siniestro a cualquier columna.
 *   - terceros (Jack/Christian/Rosita): mueven sólo los siniestros que estén en SU etapa.
 *   - abogado: sólo crea siniestros y edita los suyos (notas/PDFs).
 *   - viewer: sólo lectura.
 */

export function puedeCrearSiniestro(usuario: Usuario | null): boolean {
  if (!usuario) return false;
  return usuario.rol === 'admin' || usuario.rol === 'abogado';
}

export function puedeEditarCampos(usuario: Usuario | null, siniestro: Siniestro): boolean {
  if (!usuario) return false;
  if (usuario.rol === 'admin') return true;
  if (usuario.rol === 'abogado' && siniestro.solicitante === usuario.nombre) return true;
  if (usuario.rol === 'terceros' && siniestro.asignado_a === usuario.nombre) return true;
  return false;
}

export function puedeSubirPDF(usuario: Usuario | null, siniestro: Siniestro): boolean {
  return puedeEditarCampos(usuario, siniestro);
}

export function puedeBorrarPDF(usuario: Usuario | null, siniestro: Siniestro): boolean {
  if (!usuario) return false;
  if (usuario.rol === 'admin') return true;
  if (usuario.rol === 'abogado' && siniestro.solicitante === usuario.nombre) return true;
  return false;
}

export function puedeBorrarSiniestro(usuario: Usuario | null): boolean {
  return usuario?.rol === 'admin';
}

/**
 * Mandar a histórico: solo el equipo de Pacífico (admin / terceros).
 * Los abogados no pueden archivar.
 */
export function puedeArchivar(usuario: Usuario | null): boolean {
  if (!usuario) return false;
  return usuario.rol === 'admin' || usuario.rol === 'terceros';
}

/**
 * ¿Puede este usuario mover este siniestro a la siguiente etapa?
 */
export function puedeMover(usuario: Usuario | null, siniestro: Siniestro): boolean {
  if (!usuario) return false;
  if (usuario.rol === 'admin') return true;
  if (usuario.rol === 'viewer' || usuario.rol === 'abogado') return false;
  if (usuario.rol === 'terceros') {
    const responsable = getResponsableDeEtapa(siniestro.tipo, siniestro.estado, siniestro);
    return responsable === usuario.nombre;
  }
  return false;
}

/** Texto del botón "mover a X" */
export function textoMover(siniestro: Siniestro): string | null {
  const siguiente = getSiguienteEtapa(siniestro.tipo, siniestro.estado);
  return siguiente ? `Mover a "${siguiente}"` : null;
}

/**
 * Navegación visible por rol:
 *   - abogado: solo Tablero.
 *   - admin/terceros: Tablero + Histórico + KPIs.
 *   - viewer (jefatura): Histórico + KPIs.
 */
export type Ruta = '/' | '/dashboard' | '/historico' | '/nuevo';

export function puedeVerRuta(usuario: Usuario | null, ruta: Ruta): boolean {
  if (!usuario) return false;
  switch (ruta) {
    case '/':
      return usuario.rol !== 'viewer';
    case '/nuevo':
      return puedeCrearSiniestro(usuario);
    case '/dashboard':
      return usuario.rol !== 'abogado';
    case '/historico':
      return usuario.rol !== 'abogado';
    default:
      return false;
  }
}

export function rutaInicialPara(usuario: Usuario | null): Ruta {
  if (!usuario) return '/';
  if (usuario.rol === 'viewer') return '/dashboard';
  return '/';
}