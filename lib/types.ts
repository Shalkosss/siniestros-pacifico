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
  // v6 — deducible pagado (aplica a todos los pagos; lo marca Pacífico en el tablero)
  deducible_pagado: boolean | null;
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

/** v7 — Drive de Siniestros (espejo de la Base Consolidada de la métrica legal) */
export interface DriveSiniestro {
  id: string;
  siniestro: string;
  anio: number | null;
  mes: string | null;
  provincia: string | null;
  distrito: string | null;
  comisaria: string | null;
  fecha_registro: string | null;
  fecha_siniestro: string | null;
  abogado: string | null;
  cant_lesionados: number | null;
  lesiones: string | null;
  lesion_principal: string | null;
  reserva_inicial: number | null;
  gravedad: string | null;
  reserva_final: number | null;
  ahorro: number | null;
  fecha_cierre: string | null;
  tiempo_cierre: number | null;
  sub_estado: string | null;
  estado: string | null;
  estudio: string;
  created_at: string;
  creado_por: string | null;
  // Alertas visuales: null = autodetección por texto; true/false = manual
  flag_fallecido: boolean | null;
  flag_unidad_retenida: boolean | null;
}

export interface Notificacion {
  id: string;
  usuario_destino: string;
  mensaje: string;
  siniestro_id: string | null;
  leida: boolean;
  created_at: string;
}
