-- =====================================================
-- Migración v2 → v3
-- Cambios:
--   1. Alejandro Escobedo tiene su propio estudio ("Escobedo"), no Tuesta.
-- =====================================================

update public.usuarios
set estudio = 'Escobedo'
where nombre = 'Alejandro Escobedo';
