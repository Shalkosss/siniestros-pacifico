import type { Siniestro, Usuario } from './types';
import { getSiguienteEtapa } from './workflows';

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

/**
 * ¿Se deben censurar los datos personales (nombres/DNI de terceros y asegurados)
 * para este usuario? Por objeción de IT, los abogados externos no deben ver esos
 * datos una vez el siniestro está en el tablero.
 */
export function debeCensurar(usuario: Usuario | null): boolean {
  return usuario?.rol === 'abogado';
}

export function puedeEditarCampos(usuario: Usuario | null, siniestro: Siniestro): boolean {
  if (!usuario) return false;
  // v9: todo el equipo de Pacífico (admin y terceros) edita cualquier siniestro,
  // incluido el número de siniestro. Los abogados solo editan los suyos.
  if (usuario.rol === 'admin' || usuario.rol === 'terceros') return true;
  if (usuario.rol === 'abogado' && siniestro.solicitante === usuario.nombre) return true;
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
  // Todo el equipo de Pacífico (admin y terceros) puede avanzar y retroceder
  // las cartas de cualquier siniestro entre etapas.
  if (usuario.rol === 'admin' || usuario.rol === 'terceros') return true;
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
export type Ruta = '/' | '/dashboard' | '/historico' | '/nuevo' | '/drive';

export function puedeVerRuta(usuario: Usuario | null, ruta: Ruta): boolean {
  if (!usuario) return false;
  switch (ruta) {
    case '/':
      // Todos, incluidos los viewers (Marcos, María Elena), pueden ver el tablero.
      return true;
    case '/drive':
      // Drive de Siniestros: todos lo ven; el filtrado por estudio se hace adentro.
      return true;
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