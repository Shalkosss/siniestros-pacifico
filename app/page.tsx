'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { KanbanBoard } from '@/components/KanbanBoard';
import { useUser } from '@/components/UserContext';
import { puedeVerRuta, rutaInicialPara } from '@/lib/permissions';

export default function HomePage() {
  const { usuario, loading } = useUser();
  const router = useRouter();

  useEffect(() => {
    if (!loading && usuario && !puedeVerRuta(usuario, '/')) {
      router.replace(rutaInicialPara(usuario));
    }
  }, [usuario, loading, router]);

  if (!usuario) return null;
  if (!puedeVerRuta(usuario, '/')) return null;

  return <KanbanBoard />;
}
