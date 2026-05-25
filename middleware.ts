import { NextRequest, NextResponse } from 'next/server';
import { COOKIE_NAME, verifyToken } from '@/lib/auth-edge';

const PUBLIC_PATHS = ['/login', '/api/auth/login', '/api/auth/logout', '/api/auth/me'];

export async function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl;

  // Skip auth si SKIP_AUTH=true (útil en dev)
  if (process.env.SKIP_AUTH === 'true') return NextResponse.next();

  // Recursos estáticos pasan
  if (
    pathname.startsWith('/_next') ||
    pathname.startsWith('/favicon') ||
    pathname.includes('.')
  ) {
    return NextResponse.next();
  }

  const token = req.cookies.get(COOKIE_NAME)?.value;
  const team = await verifyToken(token);

  // Si está logueado y va a /login → redirigir al inicio
  if (team && pathname === '/login') {
    return NextResponse.redirect(new URL('/', req.url));
  }

  // Rutas públicas siempre pasan
  if (PUBLIC_PATHS.some((p) => pathname.startsWith(p))) {
    return NextResponse.next();
  }

  // Resto requiere auth
  if (!team) {
    const url = new URL('/login', req.url);
    url.searchParams.set('next', pathname);
    return NextResponse.redirect(url);
  }

  return NextResponse.next();
}

export const config = {
  matcher: ['/((?!_next/static|_next/image|favicon.ico).*)'],
};
