import { NextRequest, NextResponse } from 'next/server';
import { COOKIE_NAME, verifyToken } from '@/lib/auth-edge';

export const runtime = 'edge';

export async function GET(req: NextRequest) {
  const token = req.cookies.get(COOKIE_NAME)?.value;
  const team = await verifyToken(token);
  return NextResponse.json({ team });
}
