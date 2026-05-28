-- =====================================================
-- Migración v3 → v4
-- Cambios:
--   1. Columna `archived_at` para "mandar a histórico" manualmente.
--      Distinta de closed_at: closed_at marca cierre real (afecta KPIs),
--      archived_at solo oculta del kanban activo.
--   2. Columna `correo_enviado` para trackear si el abogado ya disparó
--      el correo de notificación al crear el siniestro.
-- =====================================================

alter table public.siniestros
  add column if not exists archived_at timestamptz;

alter table public.siniestros
  add column if not exists correo_enviado boolean not null default false;

create index if not exists idx_siniestros_archived on public.siniestros (archived_at);
create index if not exists idx_siniestros_activos
  on public.siniestros (created_at desc)
  where archived_at is null;
