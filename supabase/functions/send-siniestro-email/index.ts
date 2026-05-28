/**
 * Supabase Edge Function: send-siniestro-email
 *
 * Envía un correo de notificación al crear un siniestro usando Resend.
 *
 * Setup en Supabase:
 *   1. Crea cuenta en https://resend.com y obtén un API key (gratis, 100 emails/día).
 *   2. Verifica un dominio en Resend (ej: pacifico.com.pe) o usa el dominio de prueba.
 *   3. En Supabase → Edge Functions → Secrets, agrega:
 *        RESEND_API_KEY=re_xxxxxxxxxxxxx
 *        RESEND_FROM=siniestros@pacifico.com.pe  (debe ser de un dominio verificado)
 *   4. Deploy: `supabase functions deploy send-siniestro-email`
 *
 * El frontend hace POST a esta función con { siniestroId } y la función:
 *   - Lee el siniestro de Supabase
 *   - Determina destinatarios
 *   - Envía el correo
 *   - Marca correo_enviado = true
 *
 * NOTA: Para usar este flow desde el cliente, reemplaza el `window.location.href = mailto`
 * de SiniestroForm por una llamada `fetch('/functions/v1/send-siniestro-email', ...)`.
 * Por defecto la app usa mailto: (cero setup), esta función es el upgrade.
 */

// @ts-nocheck Deno runtime types not available in TS check
import { createClient } from 'npm:@supabase/supabase-js@2';

const RODRIGO = 'rodrigochallcop@pacifico.com.pe';
const CC_BASE = ['mcisneros@pacifico.com.pe', 'maguerrero@pacifico.com.pe'];
const CC_DEDUCIBLES_EXTRA = 'tercerosvehiculares@pacifico.com.pe';
const JASALCEDO = 'jasalcedo@pacifico.com.pe';
const CHCARDENAS = 'chcardenas@pacifico.com.pe';

function getDestinatarios(s: { tipo: string; codigo: string }) {
  if (s.tipo === 'deducible') {
    return { to: [RODRIGO], cc: [...CC_BASE, CC_DEDUCIBLES_EXTRA] };
  }
  const analista = s.codigo.length === 10 ? JASALCEDO : CHCARDENAS;
  return { to: [RODRIGO, analista], cc: [...CC_BASE] };
}

function formatMoneda(n: number | null) {
  if (n == null) return '—';
  return new Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(n);
}

function buildAsunto(s: { tipo: string; codigo: string }) {
  if (s.tipo === 'deducible') return `[DEDUCIBLE] Siniestro ${s.codigo} — Cobro al asegurado`;
  if (s.tipo === 'pago') return `[PAGO] Siniestro ${s.codigo} — Solicitud de actividad`;
  return `[REEMBOLSO] Siniestro ${s.codigo} — Solicitud de actividad`;
}

function buildCuerpo(s: any) {
  if (s.tipo === 'deducible') {
    return `
<h3>Actividad de Deducible</h3>
<ul>
  <li><strong>Código de siniestro:</strong> ${s.codigo}</li>
  <li><strong>Monto:</strong> ${formatMoneda(s.monto)}</li>
  <li><strong>Correo del asegurado:</strong> ${s.correo_asegurado ?? '—'}</li>
  <li><strong>Nombre del asegurado:</strong> ${s.asegurado_nombre ?? '—'}</li>
  <li><strong>Solicitante:</strong> ${s.solicitante}</li>
</ul>
${s.notas ? `<p><strong>Notas:</strong> ${s.notas}</p>` : ''}
${s.pdf_urls?.length ? `<p><strong>PDFs adjuntos:</strong></p><ul>${s.pdf_urls.map((u: string) => `<li><a href="${u}">${u}</a></li>`).join('')}</ul>` : ''}
`;
  }
  const tipoLabel = s.tipo === 'pago' ? 'Pago' : 'Reembolso';
  return `
<h3>Actividad de ${tipoLabel}</h3>
<ul>
  <li><strong>Código de siniestro:</strong> ${s.codigo}</li>
  <li><strong>Nombre del beneficiario:</strong> ${s.asegurado_nombre ?? '—'}</li>
  <li><strong>DNI:</strong> ${s.dni_tercero ?? '—'}</li>
  <li><strong>Monto:</strong> ${formatMoneda(s.monto)}</li>
  <li><strong>Solicitante:</strong> ${s.solicitante}</li>
</ul>
${s.notas ? `<p><strong>Notas:</strong> ${s.notas}</p>` : ''}
${s.pdf_urls?.length ? `<p><strong>PDFs adjuntos:</strong></p><ul>${s.pdf_urls.map((u: string) => `<li><a href="${u}">${u}</a></li>`).join('')}</ul>` : ''}
`;
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response('Method not allowed', { status: 405 });
  }

  try {
    const { siniestroId } = await req.json();
    if (!siniestroId) return new Response('Missing siniestroId', { status: 400 });

    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const supabaseKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
    const resendKey = Deno.env.get('RESEND_API_KEY');
    const resendFrom = Deno.env.get('RESEND_FROM') ?? 'onboarding@resend.dev';

    if (!resendKey) return new Response('RESEND_API_KEY missing', { status: 500 });

    const supabase = createClient(supabaseUrl, supabaseKey);
    const { data: s, error } = await supabase
      .from('siniestros')
      .select('*')
      .eq('id', siniestroId)
      .single();
    if (error || !s) return new Response('Siniestro no encontrado', { status: 404 });

    const { to, cc } = getDestinatarios(s);
    const subject = buildAsunto(s);
    const html = buildCuerpo(s);

    const resendRes = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${resendKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ from: resendFrom, to, cc, subject, html }),
    });

    if (!resendRes.ok) {
      const errBody = await resendRes.text();
      return new Response(`Resend error: ${errBody}`, { status: 500 });
    }

    await supabase.from('siniestros').update({ correo_enviado: true }).eq('id', siniestroId);

    return new Response(JSON.stringify({ ok: true }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (e) {
    return new Response(`Error: ${(e as Error).message}`, { status: 500 });
  }
});
