-- =====================================================
-- Migration v11 — Caso urgente
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- Marca de caso urgente. La fija el equipo de Pacífico (admin/terceros) desde
-- el detalle del siniestro. Se distingue visualmente en el tablero (marco rojo
-- y etiqueta "URGENTE").
alter table public.siniestros add column if not exists urgente boolean not null default false;
