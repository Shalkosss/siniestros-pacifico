# Propuesta de migración a Azure — Sistema de Siniestros (LegalTrack)

**Para:** Equipo de IT / Seguridad de la Información — Pacífico Seguros
**De:** [tu nombre]
**Fecha:** 2026-06-03
**Asunto:** Reubicar la aplicación de gestión de siniestros dentro del entorno Microsoft/Azure de Pacífico para eliminar la exposición de datos fuera del tenant.

---

## 1. Resumen ejecutivo

La aplicación **LegalTrack** (tablero Kanban para seguimiento de siniestros entre Pacífico y los estudios legales externos) hoy funciona sobre **Supabase**, un proveedor cloud de terceros cuyos servidores están **fuera del control de Pacífico**. Esto genera la observación de fuga de información planteada por IT.

Proponemos **migrar la misma aplicación a Azure**, dentro del tenant y suscripción de Pacífico, de modo que **los datos nunca salgan del perímetro Microsoft de la empresa**. La aplicación, la experiencia de usuario y las funcionalidades se mantienen idénticas; solo cambia la infraestructura por debajo.

Punto clave para el negocio: **los abogados externos seguirán accediendo sin necesitar una cuenta corporativa de Pacífico**, mediante el mecanismo estándar de **invitados (B2B) de Microsoft Entra**, ya auditado y controlado por IT.

---

## 2. Situación actual y riesgos identificados

| Componente actual | Dónde vive | Riesgo |
|---|---|---|
| Base de datos (Supabase Postgres) | Nube de Supabase (EE.UU.) | Datos de siniestros (DNI, nombres, montos, correos de asegurados) fuera del tenant de Pacífico |
| Almacenamiento de PDFs (Supabase Storage) | Nube de Supabase | **Bucket configurado como público**: cualquiera con el enlace puede descargar los PDFs sin autenticación |
| Autenticación | Password compartido por estudio (cookie HMAC) | No hay identidad individual ni MFA; el password se comparte entre varias personas del mismo estudio |
| Reglas de acceso a datos (RLS) | Supabase | Políticas **totalmente abiertas** (`using (true)`); la autorización vive solo en el frontend y es evadible |
| Notificaciones por correo | `mailto:` desde el cliente del usuario | Aceptable, pero sin trazabilidad central |

**Datos sensibles involucrados:** número de siniestro, DNI de terceros, nombre del asegurado, correo del asegurado, montos, y documentos PDF de respaldo.

> Estos hallazgos no son solo de ubicación de datos: aun migrando, deben corregirse el bucket público, las políticas RLS abiertas y el login por password compartido. La migración a Azure es la oportunidad para cerrarlos todos.

---

## 3. Arquitectura propuesta (Azure)

Cada pieza de Supabase tiene un equivalente nativo de Azure que queda dentro del tenant de Pacífico:

| Hoy (Supabase) | Azure | Función |
|---|---|---|
| Hosting de la app (Next.js 14) | **Azure Static Web Apps** | Front-end + API |
| Postgres | **Azure Database for PostgreSQL — Flexible Server** | Tablas: `usuarios`, `siniestros`, `siniestro_movimientos`, `notificaciones` |
| Storage de PDFs | **Azure Blob Storage** (privado, acceso por SAS temporal) | Documentos de siniestros |
| Supabase Auth / password de equipo | **Microsoft Entra External ID** | Identidad real con MFA: empleados Pacífico + abogados como invitados |
| Envío de correos | **App Registration + Microsoft Graph API** | Notificaciones desde el buzón corporativo, con trazabilidad |

**Controles de seguridad que habilita Azure (lo que tranquiliza a IT):**
- Datos cifrados en reposo y en tránsito, dentro de la suscripción de Pacífico.
- Red privada (VNet / Private Endpoint) para que Postgres no esté expuesto a internet.
- Conditional Access + MFA aplicables a todos los usuarios, incluidos los invitados.
- Logs de auditoría centralizados (Entra sign-in logs, Azure Monitor).
- Políticas DLP del tenant aplican automáticamente.
- Blob Storage **privado**: los PDFs solo se sirven mediante enlaces temporales firmados (SAS), nunca públicos.

---

## 4. Acceso de los abogados externos (sin cuenta Pacífico)

Este es el requisito de negocio central y se resuelve de forma nativa:

1. IT invita el correo del abogado (Gmail, correo del estudio, etc.) como **usuario invitado B2B** en Entra External ID.
2. El abogado acepta la invitación y accede **con su propio correo** — no se le crea ni se le exige una cuenta `@pacifico`.
3. Se le asignan permisos limitados (solo ve los siniestros de su estudio, igual que hoy).
4. Todos sus accesos quedan auditados y se pueden revocar en un clic.

**Costo de identidad:** Entra External ID es **gratis hasta 50,000 usuarios activos al mes** — muy por encima de la escala de este sistema (decenas de usuarios).

---

## 5. Costos mensuales estimados (USD)

> Precios de lista. Con el acuerdo corporativo (EA/CSP) de Pacífico aplican descuentos. No incluye esfuerzo de migración (one-time, sección 6).

### Opción A — La más directa (sobredimensionada, mínima fricción con IT)

| Servicio | Tier | Costo/mes |
|---|---|---|
| Static Web Apps | Standard | $9 |
| PostgreSQL Flexible | General Purpose D2ds_v5 (2 vCPU, 128 GB) | ~$175 |
| Blob Storage | Hot, ~50 GB | ~$5 |
| Entra External ID | <50k MAU | $0 |
| Graph API (correos) | Incluido en M365 | $0 |
| **Total aprox.** | | **~$190–200/mes** |

### Opción B — La más eficiente (ajustada a una app interna pequeña)

| Servicio | Tier | Costo/mes |
|---|---|---|
| Static Web Apps | Free (o Standard $9 con SLA) | $0–9 |
| PostgreSQL Flexible | Burstable B1ms (1 vCPU, 32 GB) | ~$15–25 |
| Blob Storage | Hot, ~20 GB | ~$1–2 |
| Entra External ID | <50k MAU | $0 |
| Graph API (correos) | Incluido en M365 | $0 |
| **Total aprox.** | | **~$20–35/mes** |

**Recomendación:** empezar con la **Opción B (Burstable)**. El volumen del sistema (un Kanban interno con decenas de usuarios) no justifica el tier General Purpose. Escalar a A es un cambio de configuración de minutos si hiciera falta.

---

## 6. Esfuerzo de migración (one-time)

| Paso | Descripción | Complejidad |
|---|---|---|
| 1. Datos | `pg_dump` de Supabase → `pg_restore` en Postgres Flexible (ambos son PostgreSQL, migración casi directa) | Baja |
| 2. Archivos | Mover PDFs de Supabase Storage → Blob Storage privado | Baja |
| 3. Auth | Reemplazar el password de equipo por **MSAL + Entra External ID**; corregir políticas de autorización en el backend (no solo frontend) | Media |
| 4. Cliente de datos | Sustituir `@supabase/supabase-js` por cliente Postgres (`pg`/Prisma) | Media |
| 5. Correos | Configurar App Registration + permisos Graph para envío desde buzón corporativo | Baja-Media |
| 6. Despliegue | Pipeline de Static Web Apps + Private Endpoint a Postgres | Baja |

---

## 7. Recomendación

1. **Aprobar la Opción B** (≈$20–35/mes) como destino.
2. Tratar la migración como la oportunidad para cerrar los tres hallazgos de seguridad (bucket público, RLS abierto, password compartido).
3. Mantener el acceso de abogados vía **invitados B2B de Entra**, sin cuentas Pacífico.

**Próximo paso sugerido:** validación de esta arquitectura por IT/Seguridad y asignación de la suscripción Azure de destino.
