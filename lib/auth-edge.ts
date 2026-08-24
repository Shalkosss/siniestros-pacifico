/**
 * Auth Edge-compatible: firma y verifica un token simple { team, usuario }
 * usando HMAC-SHA-256 con un secreto del servidor.
 *
 * Funciona tanto en middleware (Edge runtime) como en API routes y
 * server components (Node runtime) porque usa Web Crypto global.
 *
 * v13 — el token puede fijar además el usuario (`team:usuario.firma`), para
 * quienes entran con su contraseña personal. Los tokens antiguos (`team.firma`)
 * se siguen aceptando: no se cierra la sesión de nadie al desplegar.
 */

import { TEAMS, type TeamSlug } from './teams';

const SECRET = process.env.AUTH_SECRET || 'dev-secret-change-me-in-production';
export const COOKIE_NAME = 'pacifico-team';

/** Sesión activa: el equipo y, opcionalmente, el usuario fijado por su contraseña. */
export interface Sesion {
  team: TeamSlug;
  /** Usuario fijado por login personal. null = el equipo elige quién es. */
  usuario: string | null;
}

async function hmacHex(key: string, data: string): Promise<string> {
  const enc = new TextEncoder();
  const cryptoKey = await crypto.subtle.importKey(
    'raw',
    enc.encode(key),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  );
  const sig = await crypto.subtle.sign('HMAC', cryptoKey, enc.encode(data));
  return Array.from(new Uint8Array(sig))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('');
}

/** Comparación en tiempo constante (anti-timing) */
function firmaValida(sig: string, esperada: string): boolean {
  if (sig.length !== esperada.length) return false;
  let diff = 0;
  for (let i = 0; i < sig.length; i++) diff |= sig.charCodeAt(i) ^ esperada.charCodeAt(i);
  return diff === 0;
}

export async function signToken(team: TeamSlug, usuario?: string | null): Promise<string> {
  // Sin usuario mantenemos el formato antiguo (`team.firma`) para no invalidar
  // las cookies ya emitidas.
  const payload = usuario ? `${team}:${encodeURIComponent(usuario)}` : team;
  const sig = await hmacHex(SECRET, payload);
  return `${payload}.${sig}`;
}

/** Verifica la cookie y devuelve la sesión completa (equipo + usuario fijado). */
export async function verifySession(token: string | undefined | null): Promise<Sesion | null> {
  if (!token) return null;
  const idx = token.lastIndexOf('.');
  if (idx < 0) return null;
  const payload = token.slice(0, idx);
  const sig = token.slice(idx + 1);

  const sep = payload.indexOf(':');
  const team = sep < 0 ? payload : payload.slice(0, sep);
  const usuario = sep < 0 ? null : decodeURIComponent(payload.slice(sep + 1));

  if (!TEAMS.some((t) => t.slug === team)) return null;
  const esperada = await hmacHex(SECRET, payload);
  if (!firmaValida(sig, esperada)) return null;

  return { team: team as TeamSlug, usuario: usuario || null };
}

/** Solo el equipo — lo que necesitan el middleware y las rutas públicas. */
export async function verifyToken(token: string | undefined | null): Promise<TeamSlug | null> {
  const sesion = await verifySession(token);
  return sesion?.team ?? null;
}
