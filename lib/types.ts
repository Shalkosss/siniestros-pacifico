export type TipoSiniestro = 'pago' | 'reembolso' | 'deducible';
export type RolUsuario = 'admin' | 'terceros' | 'abogado' | 'viewer';

export interface Usuario {
  id: string;
  nombre: string;
  rol: RolUsuario;
  estudio: string | null;
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
