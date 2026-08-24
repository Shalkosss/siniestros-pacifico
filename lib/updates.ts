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
    id: '2026-08-24',
    fecha: '2026-08-24',
    titulo: 'UBER en Pagos, autoguardado y resumen del Drive',
    items: [
      'El formulario ya no se pierde: lo que vas llenando en "Nuevo siniestro" se guarda solo, con cada tecla. Si se cierra la pestaña, se corta la luz o se suspende el equipo, al volver está todo ahí. Los archivos adjuntos sí hay que volver a elegirlos.',
      'Ahora se puede editar todo después de crear: desde el detalle del siniestro se corrigen el tipo (si entró como pago y era reembolso), el número, el monto, DNI o CE, cheque, pago en cuenta, UBER y reembolso a abogado. Los cambios quedan en el historial del caso.',
      'Categoría UBER en Pagos y Reembolsos: se marca al crear (o después, desde el detalle) y en el tablero se distingue en verde. Hay un filtro "Uber" arriba para ver solo esos. Los UBER de 8 dígitos los gestiona Katty; los demás de 8 dígitos siguen con Christian.',
      'Valorizaciones: se hacen desde el Drive de Siniestros, sobre el SV que ya está ahí. Al elegir "Valorización" en el formulario te explicamos el paso a paso y te llevamos al Drive.',
      'Resumen de abiertos y cerrados en el Drive: cuántos casos hay abiertos y cerrados en el periodo que elijas (este mes, 3, 6 o 12 meses) con el desglose en barras. Se puede alternar entre ver por abogado y ver por estudio.',
      'Importar Excel dejó de meter basura: las líneas del informe que caían bajo la columna del número de siniestro (direcciones, placas de terceros) ya no entran como casos, y te avisamos cuántas se omitieron. Las que ya estaban se pueden limpiar desde el Drive.',
    ],
  },
  {
    id: '2026-08-04',
    fecha: '2026-08-04',
    titulo: 'Informe de caso en el Drive',
    items: [
      'Nuevo formulario de caso: al agregar un siniestro al Drive ahora se pide el informe completo (fechas y horas, asesor, lugar, comisaría, causa, responsabilidad, placas, lesionados, montos, contactos, procesos y recomendación). El estudio y el abogado se toman de tu usuario.',
      'Enviar el informe por correo: desde el detalle de cualquier caso (o apenas lo registras) se abre el correo ya redactado con el formato del informe. Lo que no tenga dato sale como "-".',
      'N° de caso del estudio: si tu equipo numera sus informes (147, 148…), márcalo en el formulario y ese número va en el asunto. Si tu equipo no lo usa, déjalo sin marcar.',
      'Los datos sensibles ya no se ven en la tabla: nombres de lesionados, diagnósticos, teléfonos y correos quedan dentro de "Ver detalle". En la tabla se agregó la placa del asegurado, y también se puede buscar por ella.',
      'Importar Excel ahora actualiza: si el archivo trae casos que ya estaban registrados con datos distintos (por ejemplo cerrados que en la web figuran abiertos), se actualizan. Antes de importar te decimos cuántos son y qué cambia en cada uno.',
      'Reserva inicial, reserva final, ahorro y gravedad ya no se piden al crear el caso: se completan después en la pestaña "Métrica legal" del detalle.',
    ],
  },
  {
    id: '2026-08-03',
    fecha: '2026-08-03',
    titulo: 'Casos urgentes',
    items: [
      'Caso urgente (Pacífico): desde el detalle de un siniestro, el equipo de Pacífico puede marcarlo como urgente. En el tablero se distingue con un marco rojo, un ícono de alerta y la etiqueta "URGENTE".',
    ],
  },
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
