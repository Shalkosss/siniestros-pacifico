-- =====================================================
-- Migration v6 — Moneda, Cheques y ajuste de días
-- Idempotente: se puede correr múltiples veces.
-- =====================================================

-- Moneda del monto (PEN por defecto; USD opcional)
alter table public.siniestros
  add column if not exists moneda text not null default 'PEN';

-- Constraint de valores válidos de moneda (idempotente)
do $$ begin
  alter table public.siniestros
    add constraint moneda_valida check (moneda in ('PEN', 'USD'));
exception when duplicate_object then null; end $$;

-- Sub-tipo Cheque dentro de Pago
alter table public.siniestros
  add column if not exists es_cheque boolean not null default false;
alter table public.siniestros
  add column if not exists cheque_banco text;
alter table public.siniestros
  add column if not exists cheque_persona text;
alter table public.siniestros
  add column if not exists cheque_dni text;
-- null = no indicado / no aplica; true = deducible pagado; false = no pagado
alter table public.siniestros
  add column if not exists cheque_deducible_pagado boolean;

-- Ajuste manual del conteo de días (lo fija Pacífico)
-- dias_ajuste = N° de días hábiles base al momento de dias_ajuste_fecha
alter table public.siniestros
  add column if not exists dias_ajuste integer;
alter table public.siniestros
  add column if not exists dias_ajuste_fecha timestamptz;
