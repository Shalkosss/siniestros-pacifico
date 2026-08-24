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
  // v11 — caso urgente (lo marca Pacífico). Se distingue visualmente en el tablero.
  urgente: boolean;
  // v13 — categoría UBER dentro de pagos/reembolsos. Los de 8 dígitos los ve
  // Katty; Christian se queda con los de 8 dígitos que no son UBER.
  es_uber: boolean;
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

/** v12 — un lesionado del informe de caso (punto 15) */
export interface Lesionado {
  /** Rol en el siniestro: "Conductor Tercero", "Ocupante Tercero", "Peatón"… */
  rol: string;
  nombre: string;
  edad: number | null;
  diagnostico: string;
  lugar_atencion: string;
}

/** v12 — teléfono de contacto del informe (punto 19) */
export interface ContactoTelefono {
  grupo: 'asegurado' | 'tercero';
  /** Quién es: "Conductor", "Sra. Huamanlazo (jefa de despacho)", "Tercero"… */
  etiqueta: string;
  telefono: string;
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

  /* ---- v12 — Informe de caso (los 24 puntos que llenan los estudios) ----
   * Lo sensible (nombres, diagnósticos, teléfonos, correo) NO se muestra en la
   * tabla del Drive: vive solo en el detalle del caso y en el correo del informe.
   */
  /** Correlativo interno del estudio, ej. "147". Solo algunos estudios lo usan. */
  nro_caso_estudio: string | null;
  /** N° de caso de Pacífico, ej. "442783" (punto 1) */
  nro_caso: string | null;
  /** Punto 2 — la fecha del reporte es `fecha_registro` */
  hora_reporte: string | null;
  fecha_llegada: string | null;
  hora_llegada: string | null;
  /** Punto 3 — la fecha del siniestro es `fecha_siniestro` */
  hora_siniestro: string | null;
  /** Punto 4 */
  asesor: string | null;
  cobertura_aprobada: boolean | null;
  /** Punto 5 — dirección exacta; provincia/distrito siguen aparte */
  lugar: string | null;
  /** Punto 7 — la comisaría es `comisaria` */
  oficial_cargo: string | null;
  oficial_telefono: string | null;
  /** Punto 8 */
  causa: string | null;
  /** Punto 9 */
  conductor_asegurado: string | null;
  /** Punto 10 */
  responsabilidad: string | null;
  /** Puntos 12 y 13 */
  placa_asegurado: string | null;
  placa_tercero: string | null;
  /** Punto 14 */
  danios_materiales: boolean | null;
  /** Punto 15 — de aquí se derivan `cant_lesionados`, `lesiones` y `lesion_principal` */
  lesionados: Lesionado[] | null;
  /** Punto 16 */
  monto_cierre: number | null;
  monto_lesiones: number | null;
  monto_danios: number | null;
  /** Puntos 17 y 18 */
  en_negociacion: boolean | null;
  comunicaciones: boolean | null;
  /** Punto 19 */
  contactos: ContactoTelefono[] | null;
  /** Punto 20 */
  correo_asegurado: string | null;
  /** Punto 21 */
  proceso_penal: boolean | null;
  proceso_civil: boolean | null;
  /** Puntos 22 y 23 */
  observaciones: string | null;
  recomendacion: string | null;
  /** Punto 24 */
  fecha_actualizacion: string | null;
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
