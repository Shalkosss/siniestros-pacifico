/**
 * Auth Edge-compatible: firma y verifica un token simple { team }
 * usando HMAC-SHA-256 con un secreto del servidor.
 *
 * Funciona tanto en middleware (Edge runtime) como en API routes y
 * server components (Node runtime) porque usa Web Crypto global.
 */

import { TEAMS, type TeamSlug } from './teams';

const SECRET = process.env.AUTH_SECRET || 'dev-secret-change-me-in-production';
export const COOKIE_NAME = 'pacifico-team';

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

export async function signToken(team: TeamSlug): Promise<string> {
  const sig = await hmacHex(SECRET, team);
  return `${team}.${sig}`;
}

export async function verifyToken(token: string | undefined | null): Promise<TeamSlug | null> {
  if (!token) return null;
  const idx = token.indexOf('.');
  if (idx < 0) return null;
  const team = token.slice(0, idx);
  const sig = token.slice(idx + 1);
  if (!TEAMS.some((t) => t.slug === team)) return null;
  const expected = await hmacHex(SECRET, team);
  // Comparación constante (anti-timing)
  if (sig.length !== expected.length) return null;
  let diff = 0;
  for (let i = 0; i < sig.length; i++) diff |= sig.charCodeAt(i) ^ expected.charCodeAt(i);
  return diff === 0 ? (team as TeamSlug) : null;
}
