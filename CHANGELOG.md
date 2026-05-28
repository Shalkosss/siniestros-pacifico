# Changelog — LegalTrack

Notas de cambios por versión. Formato basado en [Keep a Changelog](https://keepachangelog.com).

---

## v4 — Mobile + correos + archivar (actual)

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
