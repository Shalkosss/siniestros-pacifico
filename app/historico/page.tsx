'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { KanbanBoard } from '@/components/KanbanBoard';
import { useUser } from '@/components/UserContext';
import { puedeVerRuta, rutaInicialPara } from '@/lib/permissions';

export default function HistoricoPage() {
  const { usuario, loading } = useUser();
  const router = useRouter();

  useEffect(() => {
    if (!loading && usuario && !puedeVerRuta(usuario, '/historico')) {
      router.replace(rutaInicialPara(usuario));
    }
  }, [usuario, loading, router]);

  if (!usuario) return null;
  if (!puedeVerRuta(usuario, '/historico')) return null;

  return (
    <div className="space-y-4">
      <div>
        <h1 className="text-2xl font-bold text-white">Histórico completo</h1>
        <p className="text-sm text-white/60">
          Todos los siniestros — pendientes y cerrados. Para Pacífico únicamente.
        </p>
      </div>
      <KanbanBoard modoHistorico />
    </div>
  );
}
