'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import type { Siniestro, SiniestroMovimiento } from '@/lib/types';
import { SiniestroModal } from '@/components/SiniestroModal';

export default function SiniestroDetailPage() {
  const { id } = useParams<{ id: string }>();
  const router = useRouter();
  const [siniestro, setSiniestro] = useState<Siniestro | null>(null);
  const [movimientos, setMovimientos] = useState<SiniestroMovimiento[]>([]);
  const [notFound, setNotFound] = useState(false);

  async function cargar() {
    const [{ data: s }, { data: m }] = await Promise.all([
      supabase.from('siniestros').select('*').eq('id', id).single(),
      supabase
        .from('siniestro_movimientos')
        .select('*')
        .eq('siniestro_id', id)
        .order('timestamp', { ascending: false }),
    ]);
    if (!s) {
      setNotFound(true);
      return;
    }
    setSiniestro(s);
    setMovimientos(m ?? []);
  }

  useEffect(() => {
    void cargar();
  }, [id]);

  if (notFound) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-6 text-center">
        <p className="text-red-700">Siniestro no encontrado.</p>
      </div>
    );
  }

  if (!siniestro) {
    return <div className="text-slate-400">Cargando…</div>;
  }

  return (
    <SiniestroModal
      siniestro={siniestro}
      movimientos={movimientos}
      onClose={() => router.push('/')}
      onChanged={() => void cargar()}
    />
  );
}
