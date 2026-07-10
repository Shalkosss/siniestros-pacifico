/**
 * Historial de actualizaciones visibles para los usuarios.
 * El release más reciente va primero. `LATEST_UPDATE_ID` controla el aviso
 * único que aparece la primera vez tras cada nuevo release.
 */
export interface AppUpdate {
  id: string;
  fecha: string; // YYYY-MM-DD
  titulo: string;
  items: string[];
}

export const APP_UPDATES: AppUpdate[] = [
  {
    id: '2026-07-08',
    fecha: '2026-07-08',
    titulo: 'Correcciones y mejoras',
    items: [
      'Los nombres y DNI de terceros y asegurados ahora aparecen censurados para los abogados externos (seguridad indicada por IT).',
      'En los pagos ya puedes elegir entre Soles (S/) y Dólares ($).',
      'Nuevo tipo de pago: Cheque. Registra banco, persona que recoge, su DNI e indica si el deducible fue pagado.',
      'Se habilitaron los correos @yahoo.com además de Gmail y Outlook.',
      'Valorización e Información de póliza: ahora solo piden el número de siniestro para registrarse.',
      'Vistas por integrante de Pacífico (Jack, Rosa, Christian) con opción de ver "Todo Pacífico".',
      'El conteo de días ya no cuenta sábados ni domingos, y Pacífico puede ajustar los días de un siniestro.',
      'Nueva sección "Drive de Siniestros": la base consolidada de la métrica legal, separada por meses. Cada estudio ve solo sus siniestros y puede agregar nuevos con el formato estándar.',
      'Alertas en el Drive: los casos con fallecido se resaltan en rojo con su ícono, y las unidades retenidas en ámbar con un vehículo. Se detectan automáticamente y también se pueden marcar/desmarcar a mano.',
      'En el Drive los casos abiertos y cerrados se distinguen por color (rojo suave = abierto, verde = cerrado).',
    ],
  },
];

export const LATEST_UPDATE_ID = APP_UPDATES[0]?.id ?? '';
