-- =====================================================
-- Migration v7 — Drive de Siniestros
-- Tabla espejo de la "Base Consolidada" de la métrica legal.
-- Idempotente: se puede correr múltiples veces.
-- Después de esto, correr supabase/drive_seed.sql para importar el Excel.
-- =====================================================

create table if not exists public.drive_siniestros (
  id               uuid primary key default uuid_generate_v4(),
  siniestro        text not null,           -- código del siniestro
  anio             integer,
  mes              text,                    -- Enero..Diciembre
  provincia        text,
  distrito         text,
  comisaria        text,
  fecha_registro   date,
  fecha_siniestro  date,
  abogado          text,
  cant_lesionados  integer,
  lesiones         text,
  lesion_principal text,
  reserva_inicial  numeric(12,2),
  gravedad         text,                    -- Leve / Grave
  reserva_final    numeric(12,2),
  ahorro           numeric(12,2),
  fecha_cierre     date,
  tiempo_cierre    integer,                 -- días
  sub_estado       text,
  estado           text,                    -- ABIERTO / CERRADO
  estudio          text not null,           -- Abeo / RVC / JH PACIFICO CONSULTING / Chacon / Alejandro / Tuesta
  created_at       timestamptz not null default now(),
  creado_por       text
);

-- Alertas visuales. null = detección automática por texto (fallecido / unidad
-- retenida en lesiones); true/false = fijado manualmente por un usuario.
alter table public.drive_siniestros add column if not exists flag_fallecido boolean;
alter table public.drive_siniestros add column if not exists flag_unidad_retenida boolean;

create index if not exists idx_drive_estudio on public.drive_siniestros (estudio);
create index if not exists idx_drive_anio_mes on public.drive_siniestros (anio, mes);
create index if not exists idx_drive_estado on public.drive_siniestros (estado);
create index if not exists idx_drive_siniestro on public.drive_siniestros (siniestro);

-- RLS (mismo modelo MVP que el resto: políticas abiertas, autorización en frontend)
alter table public.drive_siniestros enable row level security;
drop policy if exists "open_all_drive" on public.drive_siniestros;
create policy "open_all_drive" on public.drive_siniestros for all using (true) with check (true);
