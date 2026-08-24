-- =====================================================
-- Seed data — Usuarios reales y siniestros de ejemplo
-- =====================================================

-- EQUIPO INTERNO DE PACÍFICO
insert into public.usuarios (nombre, rol) values
  ('Rodrigo',     'admin'),
  ('Jack',        'terceros'),
  ('Christian',   'terceros'),
  ('Rosita',      'terceros'),
  ('Katty',       'terceros'),
  ('María Elena', 'viewer'),
  ('Marcos',      'viewer')
on conflict (nombre) do update
  set rol = excluded.rol;

-- ABOGADOS por estudio
insert into public.usuarios (nombre, rol, estudio) values
  -- Estudio Abeo
  ('Oscar',              'abogado', 'Estudio Abeo'),
  ('Gonzalo',            'abogado', 'Estudio Abeo'),
  ('Diego',              'abogado', 'Estudio Abeo'),
  ('Juan',               'abogado', 'Estudio Abeo'),
  -- RVC
  ('Noelia',             'abogado', 'RVC'),
  ('Micaela',            'abogado', 'RVC'),
  ('Maritza',            'abogado', 'RVC'),
  ('Pierina',            'abogado', 'RVC'),
  -- JH
  ('Joel',               'abogado', 'JH'),
  ('Constantino',        'abogado', 'JH'),
  ('Ruth',               'abogado', 'JH'),
  -- Chacón
  ('Emily',              'abogado', 'Chacón'),
  ('Eduardo',            'abogado', 'Chacón'),
  -- Tuesta
  ('Enmanuel',           'abogado', 'Tuesta'),
  ('Jordy',              'abogado', 'Tuesta'),
  ('Alejandro Escobedo', 'abogado', 'Escobedo')
on conflict (nombre) do update
  set rol = excluded.rol, estudio = excluded.estudio;

-- =====================================================
-- SINIESTROS DE EJEMPLO (asignados a Rodrigo / Jack / Christian / Rosita)
-- =====================================================

insert into public.siniestros
  (codigo, tipo, estado, monto, solicitante, asegurado_nombre, dni_tercero, notas, asignado_a)
values
  ('1234567890', 'pago', 'Solicitud recibida', 5400.00, 'Oscar',   'Juan Pérez',  '12345678', 'Pago urgente, expediente caso #234', 'Rodrigo'),
  ('12345678',   'pago', 'Actividad creada',   2300.50, 'Noelia',  'María López', '87654321', 'Pago regular',                       'Christian'),
  ('9876543210', 'pago', 'En proceso de firmas', 7800.00, 'Joel',  'Carlos Ruiz', '11223344', null,                                 'Jack');

insert into public.siniestros
  (codigo, tipo, estado, monto, solicitante, asegurado_nombre, dni_tercero, notas, asignado_a)
values
  ('5566778899', 'reembolso', 'Solicitud recibida', 1200.00, 'Emily',   'Ana Torres',  '99887766', 'Reembolso por gastos médicos', 'Rodrigo'),
  ('11223344',   'reembolso', 'En trama',           3450.75, 'Pierina', 'Pedro Salas', '55667788', null,                           'Christian');

insert into public.siniestros
  (codigo, tipo, estado, monto, solicitante, asegurado_nombre, correo_asegurado, notas, asignado_a)
values
  ('22334455',   'deducible', 'Solicitud recibida', 850.00,  'Diego', 'Luis Vega',    'luis.vega@example.com',    'Deducible vehículo siniestro #88', 'Rodrigo'),
  ('6677889900', 'deducible', 'Correo enviado',     1500.00, 'Ruth',  'Carmen Díaz',  'carmen.diaz@example.com',  null,                               'Rosita');

-- Movimientos iniciales (auto-log de la creación)
insert into public.siniestro_movimientos (siniestro_id, estado_anterior, estado_nuevo, movido_por, notas)
select id, null, estado, solicitante, 'Creación de siniestro'
from public.siniestros
where not exists (
  select 1 from public.siniestro_movimientos m where m.siniestro_id = siniestros.id
);
