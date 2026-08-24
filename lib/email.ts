import type { Siniestro, Usuario } from './types';
import { formatMoneda } from './utils';

/**
 * Destinatarios del correo de notificación según el tipo y los dígitos del código.
 *
 * - DEDUCIBLES → Rodrigo (PARA), CCs internos + terceros vehiculares
 * - PAGOS / REEMBOLSOS / VALORIZACIONES / INFO PÓLIZA:
 *     10 díg (Jack)      → Rodrigo + jasalcedo (PARA), CCs internos
 *     8 díg  (Christian) → Rodrigo + chcardenas (PARA), CCs internos
 *
 * Además, si el remitente (abogado) pertenece a un estudio del directorio,
 * se agregan sus compañeros al CC excluyéndolo a él/ella.
 */
export interface Destinatarios {
  to: string[];
  cc: string[];
}

const RODRIGO = 'rodrigochallcop@pacifico.com.pe';
const CC_BASE = ['mcisneros@pacifico.com.pe', 'maguerrero@pacifico.com.pe'];
const CC_DEDUCIBLES_EXTRA = 'tercerosvehiculares@pacifico.com.pe';
const JASALCEDO = 'jasalcedo@pacifico.com.pe';
const CHCARDENAS = 'chcardenas@pacifico.com.pe';

/**
 * Directorio de estudios y sus miembros.
 * Fuente de verdad para CC por estudio. Se compara contra el `email` del usuario
 * logueado (o por nombre como fallback).
 *
 * Para agregar/quitar a alguien: edita aquí o pásalo a una tabla `estudios_emails`.
 */
export const ESTUDIOS_DIRECTORIO: Record<string, { nombre: string; miembros: string[] }> = {
  abeo: {
    nombre: 'Estudio Abeo',
    miembros: [
      'lmabeo@estudioabeo.com',
      'jdavila@estudioabeo.com',
      'gcastro@estudioabeo.com',
      'obillus@estudioabeo.com',
      'dsaravoa@estudioabeo.com',
    ],
  },
  rvc: {
    nombre: 'RVC Assist',
    miembros: [
      'mnizama@rvcassist.com',
      'm.solis@rvcassist.com',
      'pugaz@rvcassist.com',
      'noelia.noriega@rvcassist.com',
      'rvivar@rvcassist.com',
    ],
  },
  jh: {
    nombre: 'JH',
    miembros: [
      'ruthuahuacondori@yahoo.com',
      'joelhuahuacondori@yahoo.com',
      'constantino.venegas@yahoo.com',
    ],
  },
  tuesta: {
    nombre: 'Tuesta Legal',
    miembros: ['jvillanueva@tuslegal.com.pe', 'ebanto@tuslegal.com.pe'],
  },
};

/**
 * Devuelve los emails de los compañeros de estudio del usuario, EXCLUYENDO al
 * propio usuario. Si el usuario no pertenece a ningún estudio del directorio,
 * o no tiene email, devuelve [].
 */
export function getCCEstudio(remitente: Usuario | null): string[] {
  if (!remitente?.email) return [];
  const myEmail = remitente.email.toLowerCase();
  for (const estudio of Object.values(ESTUDIOS_DIRECTORIO)) {
    const lower = estudio.miembros.map((m) => m.toLowerCase());
    if (lower.includes(myEmail)) {
      return estudio.miembros.filter((m) => m.toLowerCase() !== myEmail);
    }
  }
  return [];
}

/**
 * CC + TO finales tomando en cuenta el remitente (para el CC por estudio).
 * - `remitente` es opcional: si no se pasa, no se agrega CC por estudio.
 * - Deduplica emails (insensible a mayúsculas).
 */
export function getDestinatarios(
  s: Pick<Siniestro, 'tipo' | 'codigo'>,
  remitente?: Usuario | null
): Destinatarios {
  const cc: string[] = [...CC_BASE];
  let to: string[];

  if (s.tipo === 'deducible') {
    to = [RODRIGO];
    cc.push(CC_DEDUCIBLES_EXTRA);
  } else {
    // pago / reembolso / valorizacion / info_poliza
    const esJack = s.codigo.length === 10;
    const analista = esJack ? JASALCEDO : CHCARDENAS;
    // Nota: los UBER de 8 dígitos los gestiona Katty en el tablero (v13). Su
    // correo corporativo todavía no está cargado; cuando lo esté, agregarlo
    // como constante aquí y usarlo en lugar de CHCARDENAS para `s.es_uber`.
    to = [RODRIGO, analista];
  }

  if (remitente) {
    cc.push(...getCCEstudio(remitente));
  }

  return { to: dedupe(to), cc: dedupe(cc.filter((e) => !to.includes(e))) };
}

function dedupe(arr: string[]): string[] {
  const seen = new Set<string>();
  const out: string[] = [];
  for (const x of arr) {
    const k = x.toLowerCase();
    if (seen.has(k)) continue;
    seen.add(k);
    out.push(x);
  }
  return out;
}

/** Prefijo del asunto según tipo */
const TIPO_PREFIJO: Record<Siniestro['tipo'], string> = {
  pago: 'PAGO',
  reembolso: 'REEMBOLSO',
  deducible: 'DEDUCIBLE',
  valorizacion: 'VALORIZACIÓN',
  info_poliza: 'INFO PÓLIZA',
};

const TIPO_BODY_LABEL: Record<Siniestro['tipo'], string> = {
  pago: 'Pago',
  reembolso: 'Reembolso',
  deducible: 'Deducible',
  valorizacion: 'Valorización',
  info_poliza: 'Información de Póliza',
};

export function buildAsunto(s: Pick<Siniestro, 'tipo' | 'codigo'> & Partial<Pick<Siniestro, 'es_uber'>>): string {
  const base = TIPO_PREFIJO[s.tipo] ?? 'SINIESTRO';
  // La marca UBER va en el asunto: cambia quién lo gestiona del lado de Pacífico.
  const prefix = s.es_uber ? `${base} · UBER` : base;
  if (s.tipo === 'deducible') {
    return `[${prefix}] Siniestro ${s.codigo} — Cobro al asegurado`;
  }
  return `[${prefix}] Siniestro ${s.codigo} — Solicitud de actividad`;
}

export function buildCuerpo(s: Siniestro): string {
  const tipoLabel = TIPO_BODY_LABEL[s.tipo] ?? 'Siniestro';

  if (s.tipo === 'deducible') {
    return [
      `Actividad de ${tipoLabel}`,
      '',
      `Código de siniestro: ${s.codigo}`,
      `Monto: ${formatMoneda(s.monto, s.moneda)}`,
      `Correo del asegurado: ${s.correo_asegurado ?? '—'}`,
      `Nombre del asegurado: ${s.asegurado_nombre ?? '—'}`,
      `Solicitante: ${s.solicitante}`,
      '',
      s.notas ? `Notas: ${s.notas}` : '',
      s.pdf_urls.length > 0
        ? `\nPDFs adjuntos (${s.pdf_urls.length}):\n${s.pdf_urls.map((u) => `· ${u}`).join('\n')}`
        : '',
    ]
      .filter(Boolean)
      .join('\n');
  }

  const variosBeneficiarios = (s.beneficiarios?.length ?? 0) > 1;
  const esReembolsoAbogado = !!s.reembolso_abogado;

  return [
    `Actividad de ${tipoLabel}${s.es_uber ? ' (UBER)' : ''}${esReembolsoAbogado ? ' (A ABOGADO)' : ''}${s.es_cheque ? ' (CHEQUE)' : ''}${s.es_pago_cuenta ? ' (PAGO EN CUENTA)' : ''}`,
    '',
    `Código de siniestro: ${s.codigo}`,
    ...(variosBeneficiarios
      ? [
          `${esReembolsoAbogado ? 'Abogados' : 'Beneficiarios'} (${s.beneficiarios!.length}):`,
          ...s.beneficiarios!.map((b, i) =>
            [
              `  ${i + 1}. ${b.nombre}`,
              b.dni ? `${b.tipo ?? 'DNI'} ${b.dni}` : null,
              b.monto != null ? formatMoneda(b.monto, s.moneda) : null,
            ]
              .filter(Boolean)
              .join(' — ')
          ),
        ]
      : esReembolsoAbogado
      ? [`Nombre del abogado: ${s.asegurado_nombre ?? '—'}`]
      : [
          `Nombre del beneficiario: ${s.asegurado_nombre ?? '—'}`,
          `${s.doc_tipo === 'CE' ? 'CE (carné de extranjería)' : 'DNI'}: ${s.dni_tercero ?? '—'}`,
        ]),
    `${variosBeneficiarios ? 'Monto total' : 'Monto'}: ${formatMoneda(s.monto, s.moneda)}`,
    `Solicitante: ${s.solicitante}`,
    ...(s.tipo === 'pago'
      ? [
          `Deducible: ${
            s.deducible_pagado == null
              ? 'no indicado'
              : s.deducible_pagado
              ? 'PAGADO'
              : 'NO pagado'
          }`,
        ]
      : []),
    ...(s.es_cheque
      ? [
          '',
          'Datos del cheque:',
          `· Banco: ${s.cheque_banco ?? '—'}`,
          `· Persona a recoger: ${s.cheque_persona ?? '—'}`,
          `· DNI de quien recoge: ${s.cheque_dni ?? '—'}`,
        ]
      : []),
    ...(s.es_pago_cuenta
      ? ['', 'Pago en cuenta: la ficha de matrícula va adjunta en los PDFs.']
      : []),
    '',
    s.notas ? `Notas: ${s.notas}` : '',
    s.pdf_urls.length > 0
      ? `\nPDFs adjuntos (${s.pdf_urls.length}):\n${s.pdf_urls.map((u) => `· ${u}`).join('\n')}`
      : '',
  ]
    .filter(Boolean)
    .join('\n');
}

export type EmailProvider = 'gmail' | 'outlook' | 'yahoo';

/**
 * `mailto:` — fallback. No soporta adjuntos; los PDFs van como URLs en el cuerpo.
 */
export function buildMailtoUrl(s: Siniestro, remitente?: Usuario | null): string {
  const { to, cc } = getDestinatarios(s, remitente);
  const subject = encodeURIComponent(buildAsunto(s));
  const body = encodeURIComponent(buildCuerpo(s));
  const ccQ = cc.length > 0 ? `&cc=${cc.map(encodeURIComponent).join(',')}` : '';
  return `mailto:${to.map(encodeURIComponent).join(',')}?subject=${subject}${ccQ}&body=${body}`;
}

/** Gmail web compose */
export function buildGmailUrl(s: Siniestro, remitente?: Usuario | null): string {
  const { to, cc } = getDestinatarios(s, remitente);
  const params = new URLSearchParams({
    view: 'cm',
    fs: '1',
    to: to.join(','),
    su: buildAsunto(s),
    body: buildCuerpo(s),
  });
  if (cc.length > 0) params.set('cc', cc.join(','));
  return `https://mail.google.com/mail/?${params.toString()}`;
}

/** Outlook web compose */
export function buildOutlookUrl(s: Siniestro, remitente?: Usuario | null): string {
  const { to, cc } = getDestinatarios(s, remitente);
  const params = new URLSearchParams({
    path: '/mail/action/compose',
    to: to.join(','),
    subject: buildAsunto(s),
    body: buildCuerpo(s),
  });
  if (cc.length > 0) params.set('cc', cc.join(','));
  return `https://outlook.office.com/mail/deeplink/compose?${params.toString()}`;
}

/** Yahoo Mail web compose */
export function buildYahooUrl(s: Siniestro, remitente?: Usuario | null): string {
  const { to, cc } = getDestinatarios(s, remitente);
  const params = new URLSearchParams({
    to: to.join(','),
    subject: buildAsunto(s),
    body: buildCuerpo(s),
  });
  if (cc.length > 0) params.set('cc', cc.join(','));
  return `https://compose.mail.yahoo.com/?${params.toString()}`;
}

export function buildEmailUrl(
  s: Siniestro,
  provider: EmailProvider,
  remitente?: Usuario | null
): string {
  if (provider === 'yahoo') return buildYahooUrl(s, remitente);
  if (provider === 'outlook') return buildOutlookUrl(s, remitente);
  return buildGmailUrl(s, remitente);
}

/* ---------------- Correos genéricos (aviso de gestión / recordatorio) ---------------- */

export interface EmailContenido {
  to: string[];
  cc: string[];
  subject: string;
  body: string;
}

/** URL de compose para cualquier contenido, según el proveedor elegido. */
export function buildComposeUrl(provider: EmailProvider, c: EmailContenido): string {
  if (provider === 'outlook') {
    const params = new URLSearchParams({
      path: '/mail/action/compose',
      to: c.to.join(','),
      subject: c.subject,
      body: c.body,
    });
    if (c.cc.length > 0) params.set('cc', c.cc.join(','));
    return `https://outlook.office.com/mail/deeplink/compose?${params.toString()}`;
  }
  if (provider === 'yahoo') {
    const params = new URLSearchParams({ to: c.to.join(','), subject: c.subject, body: c.body });
    if (c.cc.length > 0) params.set('cc', c.cc.join(','));
    return `https://compose.mail.yahoo.com/?${params.toString()}`;
  }
  const params = new URLSearchParams({
    view: 'cm',
    fs: '1',
    to: c.to.join(','),
    su: c.subject,
    body: c.body,
  });
  if (c.cc.length > 0) params.set('cc', c.cc.join(','));
  return `https://mail.google.com/mail/?${params.toString()}`;
}

/**
 * Aviso de gestión (opcional, para Pacífico): al mover una tarjeta de etapa se
 * puede avisar por correo al abogado solicitante que su caso avanzó.
 */
export function buildEmailGestion(
  s: Pick<Siniestro, 'tipo' | 'codigo' | 'solicitante'>,
  etapaAnterior: string,
  etapaNueva: string,
  movidoPor: string,
  emailSolicitante: string | null
): EmailContenido {
  const prefix = TIPO_PREFIJO[s.tipo] ?? 'SINIESTRO';
  return {
    to: emailSolicitante ? [emailSolicitante] : [],
    cc: [],
    subject: `[${prefix}] Siniestro ${s.codigo} — gestionado: ahora en "${etapaNueva}"`,
    body: [
      `Estimado(a),`,
      '',
      `Le informamos que su solicitud del siniestro ${s.codigo} fue gestionada y cambió de etapa:`,
      '',
      `· Etapa anterior: ${etapaAnterior}`,
      `· Etapa actual: ${etapaNueva}`,
      `· Gestionado por: ${movidoPor} (Pacífico — Equipo Legal)`,
      '',
      `Puede ver el detalle y el historial completo en el tablero de LegalTrack.`,
      '',
      `Saludos,`,
      `Equipo Legal — Pacífico Seguros`,
    ].join('\n'),
  };
}

/**
 * Recordatorio (para abogados): pide a Pacífico gestionar el pago/deducible,
 * indicando los días hábiles totales y los días en la etapa actual.
 */
export function buildEmailRecordatorio(
  s: Pick<Siniestro, 'tipo' | 'codigo' | 'estado' | 'solicitante'>,
  diasTotales: number,
  diasEnEtapa: number,
  remitente?: Usuario | null
): EmailContenido {
  const { to, cc } = getDestinatarios(s as Pick<Siniestro, 'tipo' | 'codigo'>, remitente);
  const prefix = TIPO_PREFIJO[s.tipo] ?? 'SINIESTRO';
  const queGestionar = s.tipo === 'deducible' ? 'el cobro del deducible' : 'el pago';
  return {
    to,
    cc,
    subject: `[RECORDATORIO] [${prefix}] Siniestro ${s.codigo} — ${diasTotales} días hábiles abierto`,
    body: [
      `Estimados,`,
      '',
      `Les escribo para recordar la gestión de ${queGestionar} del siniestro ${s.codigo}.`,
      '',
      `· Días hábiles desde la solicitud: ${diasTotales}`,
      `· Días hábiles en la etapa actual ("${s.estado}"): ${diasEnEtapa}`,
      `· Solicitante: ${s.solicitante}`,
      '',
      `Agradecería nos indiquen el estado de la gestión o si falta algún documento de nuestra parte.`,
      '',
      `Saludos cordiales.`,
    ].join('\n'),
  };
}
