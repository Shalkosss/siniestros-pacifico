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
  // v8 — pago en cuenta (exige adjuntar la ficha de matrícula) y
  // beneficiarios múltiples (opcional; el primero se refleja en asegurado_nombre/dni_tercero)
  es_pago_cuenta: boolean | null;
  beneficiarios: Beneficiario[] | null;
  // v8.1 — tipo de documento del beneficiario principal: 'DNI' (default) o 'CE'
  doc_tipo: TipoDocumento | null;
  // v9 — reembolso a abogado (solo tipo 'reembolso'): asegurado_nombre guarda el
  // nombre del abogado y no se pide documento
  reembolso_abogado: boolean | null;
  // v10 — nota de pausa de Pacífico (distinta de `notas`). Mientras `pausado`
  // sea true, el contador de días queda congelado y en el tablero se muestra "—".
  nota_pausa: string | null;
  pausado: boolean;
}

/** v8.1 — tipo de documento de identidad */
export type TipoDocumento = 'DNI' | 'CE';

/** v8 — beneficiario de un pago/reembolso (cuando hay más de uno) */
export interface Beneficiario {
  nombre: string;
  dni: string;
  /** v8.1 — 'DNI' (default) o 'CE' (carné de extranjería) */
  tipo?: TipoDocumento;
  /** v9 — monto individual del beneficiario; el `monto` del siniestro es la suma */
  monto?: number | null;
}

/** v8 — buzón de sugerencias */
export interface Sugerencia {
  id: string;
  autor: string;
  rol: string | null;
  texto: string;
  leida: boolean;
  created_at: string;
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

/** v10 — registro de acceso diario (una fila por usuario por día) */
export interface UsuarioAcceso {
  id: string;
  usuario_nombre: string;
  rol: string | null;
  estudio: string | null;
  team: string | null;
  fecha: string; // YYYY-MM-DD
  created_at: string;
}

export interface Notificacion {
  id: string;
  usuario_destino: string;
  mensaje: string;
  siniestro_id: string | null;
  leida: boolean;
  created_at: string;
}
