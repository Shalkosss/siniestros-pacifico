-- =====================================================
-- Pacífico Seguros — Sistema de Siniestros
-- Schema SQL para Supabase (PostgreSQL)
-- =====================================================

-- Extensiones requeridas
create extension if not exists "uuid-ossp";

-- =====================================================
-- ENUMs
-- =====================================================
do $$ begin
  create type tipo_siniestro as enum ('pago', 'reembolso', 'deducible');
exception when duplicate_object then null; end $$;

do $$ begin
  create type rol_usuario as enum ('admin', 'terceros', 'abogado', 'viewer');
exception when duplicate_object then null; end $$;

-- =====================================================
-- TABLA: usuarios
-- =====================================================
create table if not exists public.usuarios (
  id          uuid primary key default uuid_generate_v4(),
  nombre      text unique not null,
  rol         rol_usuario not null,
  estudio     text,
  activo      boolean not null default true,
  created_at  timestamptz not null default now()
);

-- Migración: agrega `estudio` si la tabla ya existía sin esa columna
alter table public.usuarios add column if not exists estudio text;

create index if not exists idx_usuarios_activo on public.usuarios (activo);

-- =====================================================
-- TABLA: siniestros
-- =====================================================
create table if not exists public.siniestros (
  id                uuid primary key default uuid_generate_v4(),
  codigo            text not null,
  tipo              tipo_siniestro not null,
  estado            text not null,
  monto             numeric(12,2),
  solicitante       text not null,
  asegurado_nombre  text,
  dni_tercero       text,
  correo_asegurado  text,
  notas             text,
  pdf_urls          text[] not null default '{}',
  asignado_a        text,
  created_at        timestamptz not null default now(),
  closed_at         timestamptz,
  constraint codigo_formato check (codigo ~ '^[0-9]{8}$' or codigo ~ '^[0-9]{10}$')
);

create index if not exists idx_siniestros_tipo on public.siniestros (tipo);
create index if not exists idx_siniestros_estado on public.siniestros (estado);
create index if not exists idx_siniestros_asignado on public.siniestros (asignado_a);
create index if not exists idx_siniestros_created on public.siniestros (created_at desc);

-- =====================================================
-- TABLA: siniestro_movimientos (log de cambios)
-- =====================================================
create table if not exists public.siniestro_movimientos (
  id              uuid primary key default uuid_generate_v4(),
  siniestro_id    uuid not null references public.siniestros(id) on delete cascade,
  estado_anterior text,
  estado_nuevo    text not null,
  movido_por      text not null,
  notas           text,
  timestamp       timestamptz not null default now()
);

create index if not exists idx_movimientos_siniestro on public.siniestro_movimientos (siniestro_id);
create index if not exists idx_movimientos_timestamp on public.siniestro_movimientos (timestamp desc);

-- =====================================================
-- TABLA: notificaciones
-- =====================================================
create table if not exists public.notificaciones (
  id              uuid primary key default uuid_generate_v4(),
  usuario_destino text not null,
  mensaje         text not null,
  siniestro_id    uuid references public.siniestros(id) on delete cascade,
  leida           boolean not null default false,
  created_at      timestamptz not null default now()
);

create index if not exists idx_notif_usuario on public.notificaciones (usuario_destino, leida);
create index if not exists idx_notif_created on public.notificaciones (created_at desc);

-- =====================================================
-- ROW LEVEL SECURITY (MVP: políticas abiertas - sin auth real)
-- =====================================================
alter table public.usuarios enable row level security;
alter table public.siniestros enable row level security;
alter table public.siniestro_movimientos enable row level security;
alter table public.notificaciones enable row level security;

-- Políticas permisivas para el MVP (la autorización está en el frontend)
drop policy if exists "open_all_usuarios" on public.usuarios;
create policy "open_all_usuarios" on public.usuarios for all using (true) with check (true);

drop policy if exists "open_all_siniestros" on public.siniestros;
create policy "open_all_siniestros" on public.siniestros for all using (true) with check (true);

drop policy if exists "open_all_movimientos" on public.siniestro_movimientos;
create policy "open_all_movimientos" on public.siniestro_movimientos for all using (true) with check (true);

drop policy if exists "open_all_notificaciones" on public.notificaciones;
create policy "open_all_notificaciones" on public.notificaciones for all using (true) with check (true);

-- =====================================================
-- STORAGE: bucket para PDFs
-- =====================================================
insert into storage.buckets (id, name, public)
values ('siniestro-pdfs', 'siniestro-pdfs', true)
on conflict (id) do nothing;

-- Políticas de Storage (públicas para MVP sin auth)
drop policy if exists "read_pdfs" on storage.objects;
create policy "read_pdfs" on storage.objects for select using (bucket_id = 'siniestro-pdfs');

drop policy if exists "upload_pdfs" on storage.objects;
create policy "upload_pdfs" on storage.objects for insert with check (bucket_id = 'siniestro-pdfs');

drop policy if exists "delete_pdfs" on storage.objects;
create policy "delete_pdfs" on storage.objects for delete using (bucket_id = 'siniestro-pdfs');

-- =====================================================
-- REALTIME: habilitar para tablas críticas (idempotente)
-- Postgres no soporta IF NOT EXISTS en ALTER PUBLICATION,
-- así que ignoramos el error 42710 (ya está en la publicación).
-- =====================================================
do $$
begin
  begin alter publication supabase_realtime add table public.siniestros; exception when duplicate_object then null; end;
  begin alter publication supabase_realtime add table public.notificaciones; exception when duplicate_object then null; end;
  begin alter publication supabase_realtime add table public.siniestro_movimientos; exception when duplicate_object then null; end;
end $$;
