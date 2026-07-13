# Changelog — LegalTrack

Notas de cambios por versión. Formato basado en [Keep a Changelog](https://keepachangelog.com).

---

## v8 — Proceso reducido + Pago en cuenta + Beneficiarios + Sugerencias (actual)

**Migración requerida:** `supabase/migration_v8.sql` (columnas `es_pago_cuenta`, `beneficiarios` y tabla `sugerencias`; el traslado de "Actividad creada" ya se aplicó vía REST)

### Cambios de flujo
- **Se eliminó la etapa "Actividad creada"** en todos los workflows ([`lib/workflows.ts`](lib/workflows.ts)); las tarjetas que estaban allí se trasladaron a "Solicitud recibida". En deducibles, "Solicitud recibida" queda a cargo de Rosita.

### Nuevo
- **Pago en cuenta bancaria** (pagos y reembolsos): sub-opción en el formulario que exige adjuntar la ficha de matrícula (PDF/Word); excluyente con cheque. Distintivo en el kanban: ícono de banco + anillo teal en la tarjeta y bloque informativo en el modal.
- **Beneficiarios múltiples** (pagos y reembolsos): opción para pagar a 2+ personas (nombre + DNI c/u), guardados en `beneficiarios` (jsonb); el primero se refleja en los campos clásicos. Se listan en el correo de notificación y en el modal (con censura para abogados).
- **Buzón de sugerencias** ([`SugerenciasBox.tsx`](components/SugerenciasBox.tsx)): botón en el header; cualquier usuario deja sugerencias y el admin ve la lista y las marca como leídas.
- **Aviso de gestión al mover** ([`KanbanBoard.tsx`](components/KanbanBoard.tsx)): tras mover una tarjeta, Pacífico ve un toast opcional para avisar por correo al abogado solicitante que su caso cambió de etapa.
- **Recordatorio de gestión** ([`SiniestroModal.tsx`](components/SiniestroModal.tsx)): abogados y admin pueden enviar un correo a Pacífico pidiendo gestionar el pago/deducible, con días hábiles totales y días en la etapa actual.

---

## v7.1 — Excel en el Drive

### Nuevo
- **Importar Excel al Drive** ([`lib/driveExcel.ts`](lib/driveExcel.ts), [`DriveBoard.tsx`](components/DriveBoard.tsx)):
  - Sube el reporte mensual del estudio (.xlsx/.xls/.csv) y registra los casos en lote
  - Reconocimiento automático de encabezados con alias ("N° SINIESTRO", "FECHA REGISTRO", "SETIEMBRE", etc.), fechas en serial de Excel o dd/mm/yyyy, montos con "S/" y comas
  - Los abogados importan siempre a su estudio; Pacífico puede usar la columna ESTUDIO del Excel o fijar uno
  - Casos ya registrados (mismo código + estudio) se omiten automáticamente; vista previa con conteo de listos/duplicados/errores antes de confirmar
  - Inserción por lotes de 500 con progreso
- **Exportar Excel desde el Drive**: descarga los casos visibles según los filtros activos (año, mes, estado, estudio, búsqueda) con el formato de la base consolidada
- **Totales por mes**: cada sección muestra la suma de reserva inicial, reserva final y ahorro

### Corregido
- El Drive carga la base completa con paginación (antes Supabase cortaba en 1,000 de 3,519 registros); orden estable por `id`
- El modal de Actualizaciones se renderiza vía portal (el `backdrop-filter` del header lo dejaba invisible)

---

## v6 — Seguridad IT + Cheques + Moneda + Vistas por usuario

**Migración requerida:** `supabase/migration_v6.sql`

### Nuevo
- **Aviso de novedades + botón "Actualizaciones"** ([`UpdatesAnnouncement.tsx`](components/UpdatesAnnouncement.tsx), [`lib/updates.ts`](lib/updates.ts)):
  - Banner que aparece una sola vez tras cada release (se guarda en `localStorage`)
  - Botón "Actualizaciones" en el header abre el historial completo de cambios
- **Censura de datos personales para abogados externos** (objeción de IT):
  - Nombres y DNI de terceros/asegurados aparecen enmascarados (`J••• P•••`, `••••1234`) en tarjetas y modal para el rol `abogado`
  - La preview del correo se oculta al abogado; el correo real a Pacífico va completo
  - Helpers `censurar` / `debeCensurar`
- **Moneda Soles/Dólares** ([`lib/utils.ts`](lib/utils.ts)):
  - Toggle clicable PEN/USD en el formulario y editable en el modal
  - `formatMoneda(monto, moneda)` respeta la moneda en tarjetas, modal y correo
- **Cheques** (sub-opción dentro de Pago):
  - Checkbox "Es cheque" que pide banco, persona a recoger y su DNI
  - Visible y editable en el modal; incluido en el cuerpo del correo
- **Deducible pagado** (todos los pagos): estado Pagado / No pagado / Sin indicar
  - Se marca desde el tablero (modal del siniestro), solo por Pacífico; lo ven todos
  - Indicador visible en la tarjeta y en el correo
- **Correos @yahoo.com**: nuevo proveedor Yahoo junto a Gmail/Outlook en los 3 selectores
- **Vistas por integrante de Pacífico** ([`lib/vistas.ts`](lib/vistas.ts)):
  - Jack → pagos/reembolsos de 10 dígitos · Christian → 8 dígitos · Rosita → deducibles
  - Arrancan en "Mi vista"; botón para alternar a "Todo Pacífico"
- **Conteo de días hábiles**: el conteo excluye sábados y domingos; Pacífico puede fijar el N° de días base de un siniestro o restablecerlo
- **Drive de Siniestros** (`/drive`, migración `supabase/migration_v7.sql` + seed `supabase/drive_seed.sql`):
  - Base consolidada de la métrica legal (3,519 registros importados del Excel)
  - Vista por estudio: cada estudio solo ve sus siniestros; Pacífico ve todo con filtro por estudio
  - Registros agrupados por mes, con filtros de año/mes/estado y búsqueda
  - Botón "Agregar siniestro" con formulario estructurado (catálogos de lesiones, sub estados, gravedad, etc. idénticos al Excel); año y mes se derivan de la fecha de registro
  - **Alertas visuales**: casos con fallecido resaltados en rojo con ícono, unidades retenidas en ámbar con ícono de vehículo. Autodetección por texto (lesiones/sub estado) + toggle manual editable por fila (`flag_fallecido`, `flag_unidad_retenida`; null = automático)
  - **Distinción abierto/cerrado**: tinte rojo suave para abiertos y verde para cerrados en cada fila, chips de estado en el mismo código de color

### Cambios
- **Movimiento de cartas en ambos sentidos**: todo el equipo de Pacífico (admin y terceros) puede avanzar y **retroceder** cualquier siniestro entre etapas ([`lib/permissions.ts`](lib/permissions.ts))
- **Acceso al tablero para viewers**: Marcos y María Elena ahora ven el Tablero (solo lectura, sin arrastrar)

### Bugfix
- **Valorización / Info Póliza**: ahora solo requieren el número de siniestro para registrarse (ya no piden monto, nombre ni DNI)

### Schema
```sql
alter table siniestros add column if not exists moneda text not null default 'PEN';
alter table siniestros add column if not exists es_cheque boolean not null default false;
alter table siniestros add column if not exists cheque_banco text;
alter table siniestros add column if not exists cheque_persona text;
alter table siniestros add column if not exists cheque_dni text;
alter table siniestros add column if not exists cheque_deducible_pagado boolean;
alter table siniestros add column if not exists dias_ajuste integer;
alter table siniestros add column if not exists dias_ajuste_fecha timestamptz;
```

---

## v5 — Valorización + Info Póliza + CC por estudio + reenviar

**Migración requerida:** `supabase/migration_v5.sql`

### Nuevo
- **Dos tipos de siniestro nuevos**:
  - **Valorización** (verde esmeralda `#10b981`)
  - **Info Póliza** (rosa `#ec4899`)
  - Usan por default el mismo workflow que Pagos (Estef puede ajustar en `lib/workflows.ts`)
  - Orden en el tablero: Pagos → Deducibles → Valorizaciones → Info Póliza → Reembolsos
- **CC por estudio** ([`lib/email.ts`](lib/email.ts)):
  - Cuando un abogado envía correo, el sistema agrega automáticamente al CC a sus compañeros de estudio (excluyéndolo)
  - Directorio hardcodeado para RVC Assist, Estudio Abeo, JH, Tuesta Legal
- **Reenviar correo desde el modal** ([`SiniestroModal.tsx`](components/SiniestroModal.tsx)):
  - Nueva sección colapsable "Enviar/Reenviar correo de notificación"
  - Preview de Para/CC/Asunto/Cuerpo
  - Toggle Gmail/Outlook
  - Si ya fue enviado: muestra badge "Enviado" + fecha del último envío
- **Tracking de fecha**: nueva columna `correo_enviado_fecha` (`timestamptz`) para registrar cuándo se envió por última vez
- **Directorio de abogados sincronizado** con datos reales:
  - RVC: Nizama, Solís, Ugaz, Noelia Noriega, Vivar
  - Abeo: Mabeo, Dávila, Castro, Billus, Saravoa
  - JH: Ruth, Joel Huahuacondori, Constantino Venegas
  - Tuesta: Villanueva, Banto
  - Los abogados placeholder anteriores quedan inactivos (preservan historial)

### Schema
```sql
alter type tipo_siniestro add value if not exists 'valorizacion';
alter type tipo_siniestro add value if not exists 'info_poliza';
alter table usuarios add column if not exists email text;
alter table siniestros add column if not exists correo_enviado_fecha timestamptz;
```

---

## v4 — Mobile + correos + archivar

**Migración requerida:** `supabase/migration_v4.sql`

### Nuevo
- **Navbar mobile-first**: campana oculta en mobile, "+ Nuevo" como FAB cyan circular, nav en segunda fila full-width.
- **Sistema de correos al crear siniestro**:
  - Destinatarios automáticos según tipo + dígitos del código.
  - Step de confirmación post-creación con preview (Para / CC / Asunto / Cuerpo).
  - Botón "Abrir correo y enviar" → `mailto:` que abre Outlook/Gmail prellenado.
  - Sin setup adicional (mailto funciona en todos los clientes nativos).
- **Tracking de correo enviado**: columna `correo_enviado` + ícono ✉ verde en la card cuando ya se notificó.
- **Archivar siniestro**: columna `archived_at`, manda al `/historico` y oculta del tablero activo. Solo Pacífico (admin/terceros).
- **Edge Function opcional** (`supabase/functions/send-siniestro-email`): lista para deployar con Resend si quieren envío automático sin pasar por el cliente del usuario.

### Cambios
- Form `/nuevo`: ahora muestra confirmación de correo en lugar de redirigir directamente.
- Card del Kanban: nuevo ícono ✉ junto al código cuando `correo_enviado=true`.

### Schema
```sql
alter table siniestros add column if not exists archived_at timestamptz;
alter table siniestros add column if not exists correo_enviado boolean not null default false;
create index idx_siniestros_archived on siniestros (archived_at);
create index idx_siniestros_activos on siniestros (created_at desc) where archived_at is null;
```

---

## v3 — Refinamientos visuales

**Migración requerida:** `supabase/migration_v3.sql`

### Nuevo
- Alejandro Escobedo movido a su propio estudio ("Escobedo").
- Accent de Pagos cambiado de azul a **cyan** (`#06b6d4`) para no perderse en el fondo dark.
- Fondo base de azul oscuro → **gris neutro** (`#0f1117`) para que los tintes resalten.
- Tintes de sección con opacidad 0.05/0.15 (antes 0.04/0.12 — invisibles).

### Cambios en el modal
- Quitado el banner azul "Arrastra la tarjeta…", reemplazado por texto pequeño muted.
- Historial de movimientos colapsado por defecto detrás de "Ver historial".
- Número de siniestro reducido a 1.5rem.
- Header del modal usa el accent de la categoría.
- Sección "Datos" más compacta (tipo tabla de propiedades).
- "Editar" como ícono de lápiz discreto.
- PDFs como chips compactos.

---

## v2 — Auth por equipo + scope

**Migración requerida:** `supabase/migration_v2.sql`

### Nuevo
- Sistema de **auth por equipo** con cookie firmada (HMAC-SHA256).
- 7 equipos: Pacífico + Estudio Abeo + RVC + JH + Chacón + Tuesta + Escobedo.
- Cada equipo tiene su password (env vars `TEAM_PASS_*`).
- Página `/login` con selector de equipo + password.
- Tras login, selector de usuario filtrado al equipo.
- Middleware Edge protege todas las rutas excepto `/login`.

### Cambios
- Filtro "Solo míos" pasa de chip prominente a **toggle discreto** a la derecha.
- Default scope = "Todos" (antes era "Mis"). Para abogados, default = "Mi estudio".
- Abogados ya no pueden ver "Todos" (siempre filtrado al estudio).

### Visual
- Tablero en **3 secciones por tipo** (cada workflow en su propia fila).
- Cards con borde lateral 3px del color del tipo.
- Días abiertos como badge principal (3 niveles: verde 0-3, amarillo 4-7, rojo 8+).
- Drag & drop con `@dnd-kit`.
- Vista histórica `/historico` solo para Pacífico.
- Botón "Borrar siniestro" (solo admin) en zona peligrosa del modal.

### Schema
- Agregada columna `estudio text` a `usuarios`.
- Insertados los 16 abogados reales.
- Renombrado `Estef` → `Rodrigo` en todas las tablas.

---

## v1 — MVP

### Nuevo
- Schema Supabase: `usuarios`, `siniestros`, `siniestro_movimientos`, `notificaciones`.
- Selector de usuario con localStorage.
- Kanban con 3 tipos: Pagos, Reembolsos, Deducibles.
- Form de creación de siniestro con validación.
- Modal de detalle con notas, timeline, PDFs.
- Permisos por rol (admin/terceros/abogado/viewer).
- Notificaciones in-app con campana + realtime.
- Dashboard de KPIs con filtros.
- Storage de PDFs en Supabase Storage.

---

## Cómo numerar las próximas versiones

- **v5**: si tocas el schema otra vez (agrega `supabase/migration_v5.sql`)
- Si solo hay cambios de UI o lógica (sin schema): mantén v4 y describe en commit/PR

Cada migración debe ser idempotente: usar `if not exists`, `on conflict do update`, etc.
