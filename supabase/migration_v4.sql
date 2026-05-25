-- =====================================================
-- Migración v3 → v4
-- Cambios:
--   1. Agrega columna `archived_at` para "mandar a histórico" manualmente.
--      Diferente a closed_at: closed_at marca cierre real (afecta KPIs).
--      archived_at solo oculta del kanban activo y empuja a la vista histórica.
-- =====================================================

alter table public.siniestros
  add column if not exists archived_at timestamptz;

create index if not exists idx_siniestros_archived on public.siniestros (archived_at);
