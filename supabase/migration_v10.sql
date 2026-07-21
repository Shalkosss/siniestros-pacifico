-- =====================================================
-- Migration v10 — Registro de accesos de usuarios + KPIs de montos
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- Registro de accesos: una fila por usuario por día (la app hace upsert
-- al seleccionar el usuario tras el login de equipo). Sirve para medir
-- qué abogados están entrando a la plataforma y quiénes no.
create table if not exists public.usuario_accesos (
  id             uuid primary key default gen_random_uuid(),
  usuario_nombre text not null,
  rol            text,
  estudio        text,
  team           text,
  fecha          date not null default current_date,
  created_at     timestamptz not null default now(),
  unique (usuario_nombre, fecha)
);

alter table public.usuario_accesos enable row level security;
drop policy if exists "open_all_usuario_accesos" on public.usuario_accesos;
create policy "open_all_usuario_accesos" on public.usuario_accesos for all using (true) with check (true);

-- Nota de pausa de Pacífico. Es una nota distinta a `notas`: cuando `pausado`
-- es true, el contador de días queda CONGELADO (en el tablero se muestra "—").
-- Se reutilizan dias_ajuste/dias_ajuste_fecha para congelar (al pausar) y
-- reanudar (al despausar) el conteo, de modo que el tiempo en pausa no cuenta.
alter table public.siniestros add column if not exists nota_pausa text;
alter table public.siniestros add column if not exists pausado boolean not null default false;
