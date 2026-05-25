import { NextRequest, NextResponse } from 'next/server';
import { COOKIE_NAME, signToken } from '@/lib/auth-edge';
import { envKeyParaPassword, getTeamBySlug } from '@/lib/teams';

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
    const expected = process.env[envKey];
    if (!expected) {
      return NextResponse.json(
        { error: `Servidor mal configurado: falta ${envKey}.` },
        { status: 500 }
      );
    }

    if (password !== expected) {
      return NextResponse.json({ error: 'Contraseña incorrecta.' }, { status: 401 });
    }

    const token = await signToken(t.slug);
    const res = NextResponse.json({ ok: true, team: t.slug });
    res.cookies.set(COOKIE_NAME, token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 24 * 30, // 30 días
      path: '/',
    });
    return res;
  } catch (e) {
    return NextResponse.json({ error: 'Error procesando la petición.' }, { status: 500 });
  }
}
