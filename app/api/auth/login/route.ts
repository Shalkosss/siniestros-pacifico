import { NextRequest, NextResponse } from 'next/server';
import { COOKIE_NAME, signToken } from '@/lib/auth-edge';
import {
  envKeyParaPassword,
  envKeyParaUsuario,
  getTeamBySlug,
  USUARIOS_CON_LOGIN,
} from '@/lib/teams';

export const runtime = 'edge';

export async function POST(req: NextRequest) {
  try {
    const { team, password } = (await req.json()) as { team?: string; password?: string };

    if (!team || !password) {
      return NextResponse.json({ error: 'Equipo y contraseña son requeridos.' }, { status: 400 });
    }

    const t = getTeamBySlug(team);
    if (!t) {
      return NextResponse.json({ error: 'Equipo no válido.' }, { status: 400 });
    }

    const envKey = envKeyParaPassword(t.slug);
    const esperada = process.env[envKey];

    // 1) Contraseña compartida del equipo → sesión sin usuario fijado.
    if (esperada && password === esperada) {
      return responder(t.slug, null);
    }

    // 2) Contraseña personal de alguien de este equipo → sesión fijada a esa
    //    persona (v13). Así Katty entra con lo suyo sin la clave del equipo.
    const personal = USUARIOS_CON_LOGIN.filter((u) => u.team === t.slug).find(
      (u) => {
        const suya = process.env[envKeyParaUsuario(u.nombre)];
        return !!suya && password === suya;
      }
    );
    if (personal) {
      return responder(t.slug, personal.nombre);
    }

    if (!esperada) {
      return NextResponse.json(
        { error: `Servidor mal configurado: falta ${envKey}.` },
        { status: 500 }
      );
    }

    return NextResponse.json({ error: 'Contraseña incorrecta.' }, { status: 401 });
  } catch (e) {
    return NextResponse.json({ error: 'Error procesando la petición.' }, { status: 500 });
  }
}

async function responder(team: string, usuario: string | null) {
  const token = await signToken(team as Parameters<typeof signToken>[0], usuario);
  const res = NextResponse.json({ ok: true, team, usuario });
  res.cookies.set(COOKIE_NAME, token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    maxAge: 60 * 60 * 24 * 30, // 30 días
    path: '/',
  });
  return res;
}
