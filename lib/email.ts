import type { Siniestro } from './types';
import { formatMoneda } from './utils';

/**
 * Destinatarios del correo de notificación según el tipo y los dígitos del código.
 *
 * - DEDUCIBLES → Rodrigo (PARA), CCs internos + terceros vehiculares
 * - PAGOS / REEMBOLSOS de 10 díg (Jack) → Rodrigo + jasalcedo (PARA), CCs internos
 * - PAGOS / REEMBOLSOS de 8 díg (Christian) → Rodrigo + chcardenas (PARA), CCs internos
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

export function getDestinatarios(s: Pick<Siniestro, 'tipo' | 'codigo'>): Destinatarios {
  if (s.tipo === 'deducible') {
    return {
      to: [RODRIGO],
      cc: [...CC_BASE, CC_DEDUCIBLES_EXTRA],
    };
  }
  // Pagos / Reembolsos: analista según dígitos
  const esJack = s.codigo.length === 10;
  const analista = esJack ? JASALCEDO : CHCARDENAS;
  return {
    to: [RODRIGO, analista],
    cc: [...CC_BASE],
  };
}

/** Asunto del correo */
export function buildAsunto(s: Pick<Siniestro, 'tipo' | 'codigo'>): string {
  if (s.tipo === 'deducible') {
    return `[DEDUCIBLE] Siniestro ${s.codigo} — Cobro al asegurado`;
  }
  if (s.tipo === 'pago') {
    return `[PAGO] Siniestro ${s.codigo} — Solicitud de actividad`;
  }
  return `[REEMBOLSO] Siniestro ${s.codigo} — Solicitud de actividad`;
}

/** Cuerpo del correo en texto plano */
export function buildCuerpo(s: Siniestro): string {
  if (s.tipo === 'deducible') {
    return [
      'Actividad de Deducible',
      '',
      `Código de siniestro: ${s.codigo}`,
      `Monto: ${formatMoneda(s.monto)}`,
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
  const tipoLabel = s.tipo === 'pago' ? 'Pago' : 'Reembolso';
  return [
    `Actividad de ${tipoLabel}`,
    '',
    `Código de siniestro: ${s.codigo}`,
    `Nombre del beneficiario: ${s.asegurado_nombre ?? '—'}`,
    `DNI: ${s.dni_tercero ?? '—'}`,
    `Monto: ${formatMoneda(s.monto)}`,
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

export type EmailProvider = 'gmail' | 'outlook';

/**
 * Genera el href `mailto:` con destinatarios, asunto y cuerpo prellenados.
 * Abre el cliente de correo del usuario (Outlook / Gmail / Apple Mail).
 *
 * Nota: mailto no soporta adjuntos. Los PDFs se incluyen como URLs en el cuerpo;
 * el destinatario los puede abrir desde el correo.
 */
export function buildMailtoUrl(s: Siniestro): string {
  const { to, cc } = getDestinatarios(s);
  const subject = encodeURIComponent(buildAsunto(s));
  const body = encodeURIComponent(buildCuerpo(s));
  const ccQ = cc.length > 0 ? `&cc=${cc.map(encodeURIComponent).join(',')}` : '';
  return `mailto:${to.map(encodeURIComponent).join(',')}?subject=${subject}${ccQ}&body=${body}`;
}

/**
 * URL para abrir Gmail en el navegador (compose con campos prellenados).
 * Funciona en cualquier navegador con sesión de Gmail abierta. Si no hay sesión,
 * Google pide login y luego abre el compose.
 */
export function buildGmailUrl(s: Siniestro): string {
  const { to, cc } = getDestinatarios(s);
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

/** URL para abrir Outlook Web (compose con campos prellenados). */
export function buildOutlookUrl(s: Siniestro): string {
  const { to, cc } = getDestinatarios(s);
  const params = new URLSearchParams({
    path: '/mail/action/compose',
    to: to.join(','),
    subject: buildAsunto(s),
    body: buildCuerpo(s),
  });
  if (cc.length > 0) params.set('cc', cc.join(','));
  return `https://outlook.office.com/mail/deeplink/compose?${params.toString()}`;
}

/** Devuelve la URL de correo según el proveedor elegido. */
export function buildEmailUrl(s: Siniestro, provider: EmailProvider): string {
  return provider === 'gmail' ? buildGmailUrl(s) : buildOutlookUrl(s);
}
