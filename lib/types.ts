export type TipoSiniestro = 'pago' | 'reembolso' | 'deducible' | 'valorizacion' | 'info_poliza';
export type RolUsuario = 'admin' | 'terceros' | 'abogado' | 'viewer';
export type Moneda = 'PEN' | 'USD';

export interface Usuario {
  id: string;
  nombre: string;
  rol: RolUsuario;
  estudio: string | null;
  email: string | null;
  activo: boolean;
  created_at: string;
}

export interface Siniestro {
  id: string;
  codigo: string;
  tipo: TipoSiniestro;
  estado: string;
  monto: number | null;
  solicitante: string;
  asegurado_nombre: string | null;
  dni_tercero: string | null;
  correo_asegurado: string | null;
  notas: string | null;
  pdf_urls: string[];
  asignado_a: string | null;
  created_at: string;
  closed_at: string | null;
  archived_at: string | null;
  correo_enviado: boolean;
  correo_enviado_fecha: string | null;
  // v6 — moneda del monto
  moneda: Moneda;
  // v6 — cheque (sub-opción dentro de pago)
  es_cheque: boolean;
  cheque_banco: string | null;
  cheque_persona: string | null;
  cheque_dni: string | null;
  cheque_deducible_pagado: boolean | null;
  // v6 — ajuste manual del conteo de días (lo fija Pacífico)
  dias_ajuste: number | null;
  dias_ajuste_fecha: string | null;
}

export interface SiniestroMovimiento {
  id: string;
  siniestro_id: string;
  estado_anterior: string | null;
  estado_nuevo: string;
  movido_por: string;
  notas: string | null;
  timestamp: string;
}

export interface Notificacion {
  id: string;
  usuario_destino: string;
  mensaje: string;
  siniestro_id: string | null;
  leida: boolean;
  created_at: string;
}
