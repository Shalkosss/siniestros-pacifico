import type { Metadata } from 'next';
import { cookies } from 'next/headers';
import './globals.css';
import { UserProvider } from '@/components/UserContext';
import { Header } from '@/components/Header';
import { COOKIE_NAME, verifyToken } from '@/lib/auth-edge';

export const metadata: Metadata = {
  title: 'Siniestros — Pacífico Seguros',
  description: 'Sistema de gestión de siniestros del área legal',
};

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const token = cookies().get(COOKIE_NAME)?.value;
  const team = await verifyToken(token);

  return (
    <html lang="es">
      <body>
        <UserProvider team={team}>
          <div className="app-content min-h-screen flex flex-col">
            {team && <Header />}
            <main className="mx-auto w-full max-w-[1600px] flex-1 px-6 py-6">{children}</main>
          </div>
        </UserProvider>
      </body>
    </html>
  );
}
