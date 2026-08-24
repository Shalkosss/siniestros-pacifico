-- =====================================================
-- Migration v13 — Categoría UBER, usuaria Katty y limpieza del Drive
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- ---------------------------------------------------------------
-- 1) Categoría UBER dentro de Pagos / Reembolsos
--    No es un tipo nuevo: es una marca sobre pagos y reembolsos.
--    Reparto de las vistas por usuario:
--      - Katty:     UBER de 8 dígitos
--      - Christian: 8 dígitos que NO son UBER
--      - Jack:      10 dígitos (como hasta ahora)
-- ---------------------------------------------------------------
alter table public.siniestros add column if not exists es_uber boolean not null default false;

create index if not exists idx_siniestros_uber on public.siniestros (es_uber) where es_uber;

-- ---------------------------------------------------------------
-- 2) Usuaria Katty (equipo de Pacífico, rol terceros)
--    Entra con su contraseña personal (env USER_PASS_KATTY) o con la
--    del equipo Pacífico.
-- ---------------------------------------------------------------
insert into public.usuarios (nombre, rol) values ('Katty', 'terceros')
on conflict (nombre) do update set rol = excluded.rol, activo = true;

-- ---------------------------------------------------------------
-- 3) Los pagos UBER de 8 dígitos que ya estén marcados pasan a Katty
--    (solo los que siguen abiertos; el histórico no se toca).
-- ---------------------------------------------------------------
update public.siniestros
set asignado_a = 'Katty'
where es_uber
  and length(codigo) = 8
  and closed_at is null
  and asignado_a = 'Christian';

-- ---------------------------------------------------------------
-- 4) Enum tipo_siniestro — asegura los valores usados por la app.
--    (Si la base venía de una versión vieja, 'valorizacion' e
--    'info_poliza' podían faltar y la creación fallaba con
--    "invalid input value for enum tipo_siniestro".)
-- ---------------------------------------------------------------
alter type tipo_siniestro add value if not exists 'valorizacion';
alter type tipo_siniestro add value if not exists 'info_poliza';

-- ---------------------------------------------------------------
-- 5) Limpieza del Drive — filas basura de importaciones anteriores.
--    Un importador anterior tomaba cualquier celda de la columna
--    "SINIESTRO" como código, así que direcciones y textos del informe
--    ("Av. Sinchi Roca y Av. Jamaica, Comas.") entraron como casos.
--
--    RECOMENDADO: hacerlo desde la app. El Drive detecta estas filas,
--    muestra cuántas son y cuáles, y las borra con el botón "Limpiar"
--    tras confirmar. Es el mismo criterio que este SQL, pero se ve antes
--    de borrar.
--
--    Si prefieres hacerlo aquí: corre PRIMERO el select para revisar y
--    recién después descomenta el delete.
-- ---------------------------------------------------------------

-- Paso 1 — revisar qué se va a borrar:
select id, siniestro, estudio, abogado, fecha_registro
from public.drive_siniestros
where (siniestro ~ '\s' and regexp_replace(siniestro, '\s+', '', 'g') !~ '^[0-9]+$')
   or (siniestro !~ '\s' and (siniestro !~ '^[A-Za-z0-9][A-Za-z0-9._/-]{2,24}$' or siniestro !~ '[0-9]'))
order by estudio, siniestro;

-- Paso 2 — borrar (descomentar cuando el select de arriba se vea bien):
-- delete from public.drive_siniestros
-- where (siniestro ~ '\s' and regexp_replace(siniestro, '\s+', '', 'g') !~ '^[0-9]+$')
--    or (siniestro !~ '\s' and (siniestro !~ '^[A-Za-z0-9][A-Za-z0-9._/-]{2,24}$' or siniestro !~ '[0-9]'));
