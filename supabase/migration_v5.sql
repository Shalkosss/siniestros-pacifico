-- =====================================================
-- Migración v4 → v5
-- Cambios:
--   1. Extender enum tipo_siniestro con 'valorizacion' y 'info_poliza'
--   2. Agregar columna `email` a usuarios (para CC por estudio)
--   3. Agregar columna `correo_enviado_fecha` a siniestros (timestamp último envío)
--   4. Sincronizar abogados con el directorio real de cada estudio:
--        - RVC Assist (5)
--        - Estudio Abeo (5)
--        - JH (3)
--        - Tuesta Legal (2)
--      Los usuarios antiguos quedan inactivos para preservar el historial.
-- =====================================================

-- 1. Extender enum (Postgres 12+: ALTER TYPE ADD VALUE no se puede hacer en una
--    transacción; Supabase los ejecuta uno por uno desde el SQL Editor sin problema).
alter type tipo_siniestro add value if not exists 'valorizacion';
alter type tipo_siniestro add value if not exists 'info_poliza';

-- 2. Email en usuarios
alter table public.usuarios add column if not exists email text;
create index if not exists idx_usuarios_email on public.usuarios (email);

-- 3. Tracking timestamp del último correo enviado
alter table public.siniestros
  add column if not exists correo_enviado_fecha timestamptz;

-- 4. Sincronizar directorio de abogados con datos reales

-- 4.a) Desactivar los abogados placeholder de los 4 estudios afectados
update public.usuarios
set activo = false
where rol = 'abogado'
  and estudio in ('Estudio Abeo', 'RVC', 'JH', 'Tuesta')
  and nombre not in (
    'Lourdes Mabeo', 'Jair Dávila', 'Gabriel Castro', 'Octavio Billus', 'Diego Saravoa',
    'María Nizama', 'Mariela Solís', 'Patricia Ugaz', 'Noelia Noriega', 'Raúl Vivar',
    'Ruth Huahuacondori', 'Joel Huahuacondori', 'Constantino Venegas',
    'José Villanueva', 'Eduardo Banto'
  );

-- 4.b) Insertar / actualizar los abogados reales con su email
insert into public.usuarios (nombre, rol, estudio, email) values
  -- Estudio Abeo
  ('Lourdes Mabeo',       'abogado', 'Estudio Abeo',  'lmabeo@estudioabeo.com'),
  ('Jair Dávila',          'abogado', 'Estudio Abeo',  'jdavila@estudioabeo.com'),
  ('Gabriel Castro',       'abogado', 'Estudio Abeo',  'gcastro@estudioabeo.com'),
  ('Octavio Billus',       'abogado', 'Estudio Abeo',  'obillus@estudioabeo.com'),
  ('Diego Saravoa',        'abogado', 'Estudio Abeo',  'dsaravoa@estudioabeo.com'),
  -- RVC Assist
  ('María Nizama',         'abogado', 'RVC',           'mnizama@rvcassist.com'),
  ('Mariela Solís',        'abogado', 'RVC',           'm.solis@rvcassist.com'),
  ('Patricia Ugaz',        'abogado', 'RVC',           'pugaz@rvcassist.com'),
  ('Noelia Noriega',       'abogado', 'RVC',           'noelia.noriega@rvcassist.com'),
  ('Raúl Vivar',           'abogado', 'RVC',           'rvivar@rvcassist.com'),
  -- JH
  ('Ruth Huahuacondori',   'abogado', 'JH',            'ruthuahuacondori@yahoo.com'),
  ('Joel Huahuacondori',   'abogado', 'JH',            'joelhuahuacondori@yahoo.com'),
  ('Constantino Venegas',  'abogado', 'JH',            'constantino.venegas@yahoo.com'),
  -- Tuesta Legal
  ('José Villanueva',      'abogado', 'Tuesta',        'jvillanueva@tuslegal.com.pe'),
  ('Eduardo Banto',        'abogado', 'Tuesta',        'ebanto@tuslegal.com.pe')
on conflict (nombre) do update
  set rol = excluded.rol,
      estudio = excluded.estudio,
      email = excluded.email,
      activo = true;

-- 4.c) Opcional: emails de los equipos internos de Pacífico (para que el CC les funcione si en algún momento ellos crean siniestros)
update public.usuarios set email = 'rodrigochallcop@pacifico.com.pe' where nombre = 'Rodrigo' and email is null;
update public.usuarios set email = 'jasalcedo@pacifico.com.pe'        where nombre = 'Jack' and email is null;
update public.usuarios set email = 'chcardenas@pacifico.com.pe'       where nombre = 'Christian' and email is null;
