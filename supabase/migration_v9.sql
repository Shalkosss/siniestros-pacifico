-- =====================================================
-- Migration v9 — Reembolso a abogado + montos por beneficiario
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- 1) Reembolso a abogado (solo tipo 'reembolso'). Cuando es true,
--    asegurado_nombre guarda el nombre del abogado (texto libre) y no se
--    registra documento.
alter table public.siniestros add column if not exists reembolso_abogado boolean;

-- 2) Montos por beneficiario: no requiere columna nueva. Cada objeto del
--    jsonb `beneficiarios` ahora incluye `monto` ({nombre, dni, tipo, monto})
--    y la columna `monto` del siniestro guarda la SUMA de esos montos.
