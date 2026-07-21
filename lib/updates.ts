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
    id: '2026-07-21',
    fecha: '2026-07-21',
    titulo: 'KPIs de montos, notas de pausa y control de accesos',
    items: [
      'KPIs de dinero: nuevos indicadores de monto pagado a terceros, cobrado en deducibles, pendiente de cobro, reembolsado y pago promedio por siniestro. Con gráficos por mes.',
      'Solicitudes por semana o por mes: separadas por pagos, deducibles y reembolsos, con un botón para alternar entre semana y mes.',
      'Por estudio y por persona: cuántas solicitudes entran por estudio legal y el monto promedio por estudio y por abogado.',
      'Nota de pausa (Pacífico): desde el detalle de un siniestro, Pacífico puede pausar el contador de días con una nota (p. ej. "a la espera de un documento"). Mientras esté pausado, en el tablero se muestra "—" con un marco ámbar y el tiempo en pausa no cuenta.',
      'Control de accesos: los KPIs muestran qué abogados están entrando con su usuario y quiénes no (días activos y último acceso).',
    ],
  },
  {
    id: '2026-07-14',
    fecha: '2026-07-14',
    titulo: 'Montos por beneficiario, código editable y reembolso a abogado',
    items: [
      'Montos por beneficiario: cuando un pago o reembolso tiene varios beneficiarios, ya no se ingresa un monto total — cada persona tiene su propio monto y el total se calcula solo (la suma).',
      'Editar el número de siniestro: ahora se puede corregir el código desde el detalle del siniestro (botón de lápiz), incluso después de estar en el tablero. Los estudios legales solo pueden editar sus propios siniestros; el cambio queda registrado en el historial y se reasigna el responsable si cambia el tipo de código (8 o 10 dígitos).',
      'Reembolso a abogado: al crear un reembolso ahora se indica si es para el asegurado o para un abogado. Cuando es abogado, se escribe su nombre (sin documento) y así aparece en la tarjeta, el detalle y el correo.',
    ],
  },
  {
    id: '2026-07-13',
    fecha: '2026-07-13',
    titulo: 'Proceso reducido, pagos en cuenta y buzón de sugerencias',
    items: [
      'Se eliminó la etapa "Actividad creada": lo que estaba allí pasó a "Solicitud recibida". El flujo ahora es más corto.',
      'Pago en cuenta bancaria (pagos y reembolsos): nueva opción al crear el siniestro que exige adjuntar la ficha de matrícula (PDF o Word). En el tablero se distingue con un ícono de banco y un marco verde-azulado.',
      'Varios beneficiarios (pagos y reembolsos): ahora un siniestro se puede pagar a 2 o más personas, cada una con su nombre y documento.',
      'DNI o CE: en pagos y reembolsos ahora se indica si el documento del beneficiario es DNI o carné de extranjería (CE), con un selector junto al número.',
      'Buzón de sugerencias: nuevo botón en la barra superior para dejar ideas o reportar problemas del sistema.',
      'Aviso de gestión (Pacífico): al mover una tarjeta de etapa aparece la opción de avisar por correo al abogado que su solicitud fue gestionada.',
      'Recordatorio de gestión (abogados): desde el detalle del siniestro se puede enviar un correo a Pacífico pidiendo gestionar el pago o deducible, con los días hábiles totales y los días en la etapa actual.',
    ],
  },
  {
    id: '2026-07-10',
    fecha: '2026-07-10',
    titulo: 'Excel en el Drive',
    items: [
      'Importar Excel en el Drive: sube el reporte mensual de tu estudio (.xlsx, .xls o .csv) y los casos se registran en lote. Reconocemos las columnas automáticamente y los casos ya registrados se omiten para no duplicar.',
      'Exportar Excel desde el Drive: descarga los casos que estás viendo según los filtros (por ejemplo, todos los de Enero 2025) con el formato de la base consolidada.',
      'Totales por mes en el Drive: cada mes muestra la suma de reserva inicial, reserva final y ahorro.',
      'El Drive ahora carga la base completa (antes solo se veían los primeros 1,000 registros).',
    ],
  },
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
