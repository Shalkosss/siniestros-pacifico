-- =====================================================
-- Migration v8 — Proceso reducido + Pago en cuenta + Beneficiarios + Sugerencias
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- 1) Se eliminó la etapa "Actividad creada": todo lo que estaba ahí pasa a
--    "Solicitud recibida". (La app ya no renderiza esa columna.)
update public.siniestros
  set estado = 'Solicitud recibida'
  where estado = 'Actividad creada';

-- 2) Pago en cuenta (pagos y reembolsos). Exige adjuntar la ficha de matrícula
--    al crear el siniestro; en el tablero se distingue con un ícono de banco.
alter table public.siniestros add column if not exists es_pago_cuenta boolean not null default false;

-- 3) Beneficiarios múltiples (opcional). Array JSON de {nombre, dni, tipo}.
--    El primero se refleja también en asegurado_nombre / dni_tercero.
alter table public.siniestros add column if not exists beneficiarios jsonb;

-- 3b) Tipo de documento del beneficiario principal: 'DNI' (default, null = DNI) o 'CE'.
alter table public.siniestros add column if not exists doc_tipo text;

-- 4) Buzón de sugerencias
create table if not exists public.sugerencias (
  id         uuid primary key default uuid_generate_v4(),
  autor      text not null,
  rol        text,
  texto      text not null,
  leida      boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.sugerencias enable row level security;
drop policy if exists "open_all_sugerencias" on public.sugerencias;
create policy "open_all_sugerencias" on public.sugerencias for all using (true) with check (true);
