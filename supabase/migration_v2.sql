-- =====================================================
-- Migración v1 → v2
-- Cambios:
--   1. Renombra "Estef" a "Rodrigo" en TODAS las tablas
--   2. Agrega columna `estudio` a usuarios
--   3. Inserta los 16 abogados reales agrupados por estudio
--   4. Desactiva los abogados demo
-- =====================================================

-- 1. Columna estudio (idempotente)
alter table public.usuarios add column if not exists estudio text;

-- 2. Renombrar Estef → Rodrigo
update public.usuarios            set nombre = 'Rodrigo'    where nombre = 'Estef';
update public.siniestros          set solicitante = 'Rodrigo' where solicitante = 'Estef';
update public.siniestros          set asignado_a = 'Rodrigo'  where asignado_a = 'Estef';
update public.siniestro_movimientos set movido_por = 'Rodrigo' where movido_por = 'Estef';
update public.notificaciones      set usuario_destino = 'Rodrigo' where usuario_destino = 'Estef';

-- 3. Insertar abogados reales (upsert por nombre)
insert into public.usuarios (nombre, rol, estudio) values
  ('Oscar',              'abogado', 'Estudio Abeo'),
  ('Gonzalo',            'abogado', 'Estudio Abeo'),
  ('Diego',              'abogado', 'Estudio Abeo'),
  ('Juan',               'abogado', 'Estudio Abeo'),
  ('Noelia',             'abogado', 'RVC'),
  ('Micaela',            'abogado', 'RVC'),
  ('Maritza',            'abogado', 'RVC'),
  ('Pierina',            'abogado', 'RVC'),
  ('Joel',               'abogado', 'JH'),
  ('Constantino',        'abogado', 'JH'),
  ('Ruth',               'abogado', 'JH'),
  ('Emily',              'abogado', 'Chacón'),
  ('Eduardo',            'abogado', 'Chacón'),
  ('Enmanuel',           'abogado', 'Tuesta'),
  ('Jordy',              'abogado', 'Tuesta'),
  ('Alejandro Escobedo', 'abogado', 'Escobedo')
on conflict (nombre) do update
  set rol = excluded.rol, estudio = excluded.estudio;

-- 4. Desactivar los abogados demo del seed v1 (no se borran para preservar histórico)
update public.usuarios set activo = false
where nombre in ('Abogado Demo 1', 'Abogado Demo 2', 'Abogado Demo 3');
