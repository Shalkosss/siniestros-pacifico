import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

if (!supabaseUrl || !supabaseAnonKey) {
  // Mensaje útil durante el desarrollo
  // eslint-disable-next-line no-console
  console.warn(
    '[supabase] Faltan NEXT_PUBLIC_SUPABASE_URL / NEXT_PUBLIC_SUPABASE_ANON_KEY. Crea .env.local copiando .env.local.example'
  );
}

export const supabase = createClient(supabaseUrl ?? '', supabaseAnonKey ?? '', {
  realtime: { params: { eventsPerSecond: 10 } },
});

export const STORAGE_BUCKET = 'siniestro-pdfs';
