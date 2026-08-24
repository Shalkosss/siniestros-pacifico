import { NextRequest, NextResponse } from 'next/server';
import { COOKIE_NAME, verifySession } from '@/lib/auth-edge';

export const runtime = 'edge';

export async function GET(req: NextRequest) {
  const token = req.cookies.get(COOKIE_NAME)?.value;
  const sesion = await verifySession(token);
  return NextResponse.json({ team: sesion?.team ?? null, usuario: sesion?.usuario ?? null });
}
