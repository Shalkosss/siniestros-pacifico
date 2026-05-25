'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { SiniestroForm } from '@/components/SiniestroForm';
import { supabase } from '@/lib/supabase';
import type { Usuario } from '@/lib/types';

export default function NuevoSiniestroPage() {
  const [abogados, setAbogados] = useState<Usuario[]>([]);

  useEffect(() => {
    void supabase
      .from('usuarios')
      .select('*')
      .eq('rol', 'abogado')
      .eq('activo', true)
      .order('nombre')
      .then(({ data }) => setAbogados(data ?? []));
  }, []);

  return (
    <div className="max-w-2xl space-y-5">
      <div>
        <Link href="/" className="inline-flex items-center gap-1 text-xs text-slate-500 hover:text-slate-300">
          <svg className="h-3 w-3" viewBox="0 0 20 20" fill="currentColor">
            <path fillRule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clipRule="evenodd" />
          </svg>
          Volver al tablero
        </Link>
        <h1 className="mt-2 text-2xl font-semibold text-slate-100 tracking-tight">Nuevo siniestro</h1>
        <p className="mt-0.5 text-sm text-slate-500">
          Aparecerá en "Solicitud recibida" y se notificará al responsable.
        </p>
      </div>
      <div className="rounded-xl bg-panel border border-white/[0.06] p-6 md:p-7">
        <SiniestroForm abogados={abogados} />
      </div>
    </div>
  );
}
