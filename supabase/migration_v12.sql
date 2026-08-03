-- =====================================================
-- Migration v12 — Informe de caso en el Drive de Siniestros
--
-- El formulario "Agregar siniestro al Drive" pasa a pedir el INFORME DE CASO
-- (los 24 puntos que usan los estudios) en lugar del set anterior de campos.
-- Estas columnas guardan esa información; las de métrica legal (reserva,
-- ahorro, gravedad) siguen existiendo y se llenan después desde el detalle.
--
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- 1. Identificadores
--    nro_caso_estudio = correlativo interno del estudio (ej. "147"). Opcional:
--    solo algunos estudios (RVC) lo usan. nro_caso = N° de caso de Pacífico.
alter table public.drive_siniestros add column if not exists nro_caso_estudio text;
alter table public.drive_siniestros add column if not exists nro_caso text;

-- 2 y 3. Horas (las fechas ya viven en fecha_registro / fecha_siniestro)
alter table public.drive_siniestros add column if not exists hora_reporte text;
alter table public.drive_siniestros add column if not exists fecha_llegada date;
alter table public.drive_siniestros add column if not exists hora_llegada text;
alter table public.drive_siniestros add column if not exists hora_siniestro text;

-- 4. Asesor de Pacífico que reportó
alter table public.drive_siniestros add column if not exists asesor text;
alter table public.drive_siniestros add column if not exists cobertura_aprobada boolean;

-- 5. Dirección exacta (provincia/distrito ya existen)
alter table public.drive_siniestros add column if not exists lugar text;

-- 7. Oficial a cargo en la comisaría
alter table public.drive_siniestros add column if not exists oficial_cargo text;
alter table public.drive_siniestros add column if not exists oficial_telefono text;

-- 8. Causa del siniestro
alter table public.drive_siniestros add column if not exists causa text;

-- 9 y 10. Conductor/asegurado y responsabilidad
alter table public.drive_siniestros add column if not exists conductor_asegurado text;
alter table public.drive_siniestros add column if not exists responsabilidad text;

-- 12 y 13. Placas
alter table public.drive_siniestros add column if not exists placa_asegurado text;
alter table public.drive_siniestros add column if not exists placa_tercero text;

-- 14. Daños materiales
alter table public.drive_siniestros add column if not exists danios_materiales boolean;

-- 15. Lesionados con detalle: [{ rol, nombre, edad, diagnostico, lugar_atencion }]
--     `lesiones` (texto) y `cant_lesionados` se siguen llenando a partir de esto
--     para no romper la métrica legal ni el Excel consolidado.
alter table public.drive_siniestros add column if not exists lesionados jsonb;

-- 16. Monto aproximado de cierre y su desglose
alter table public.drive_siniestros add column if not exists monto_cierre numeric(12,2);
alter table public.drive_siniestros add column if not exists monto_lesiones numeric(12,2);
alter table public.drive_siniestros add column if not exists monto_danios numeric(12,2);

-- 17 y 18. Estado de la gestión
alter table public.drive_siniestros add column if not exists en_negociacion boolean;
alter table public.drive_siniestros add column if not exists comunicaciones boolean;

-- 19. Contactos telefónicos: [{ grupo: 'asegurado'|'tercero', etiqueta, telefono }]
alter table public.drive_siniestros add column if not exists contactos jsonb;

-- 20. Correo del asegurado
alter table public.drive_siniestros add column if not exists correo_asegurado text;

-- 21. Procesos
alter table public.drive_siniestros add column if not exists proceso_penal boolean;
alter table public.drive_siniestros add column if not exists proceso_civil boolean;

-- 22 y 23. Texto libre
alter table public.drive_siniestros add column if not exists observaciones text;
alter table public.drive_siniestros add column if not exists recomendacion text;

-- 24. Fecha de actualización de la información
alter table public.drive_siniestros add column if not exists fecha_actualizacion date;

-- La placa es dato público en el tablero: se busca y se filtra por ella.
create index if not exists idx_drive_placa on public.drive_siniestros (placa_asegurado);
