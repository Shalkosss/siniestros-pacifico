# Sistema de Siniestros — Pacífico Seguros

Aplicación Kanban para el área legal: ingreso, seguimiento y cierre de siniestros (Pagos, Reembolsos, Deducibles).

> **Estado**: Fase 1 (MVP) + Fase 2 (notificaciones realtime, dashboard de KPIs, panel admin, navegación por rol, vista compacta/detallada) completadas. Falta Fase 3 (drag&drop, export, auditoría detallada).

## Stack

- **Next.js 14** (App Router) + TypeScript + Tailwind CSS
- **Supabase** (PostgreSQL + Storage + Realtime)
- Deploy → **Vercel**

## Setup local

### 1. Instalar dependencias

```bash
npm install
```

### 2. Crear proyecto en Supabase

1. Ve a https://supabase.com y crea un proyecto nuevo.
2. En **SQL Editor**, ejecuta el contenido de `supabase/schema.sql`.
3. Luego ejecuta `supabase/seed.sql` (crea los 6 usuarios base + abogados demo + siniestros de ejemplo).
4. Verifica que el bucket `siniestro-pdfs` existe en **Storage** (lo crea el schema).

### 3. Variables de entorno

Copia `.env.local.example` a `.env.local` y completa:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
```

Estos valores los obtienes en **Project Settings → API** en Supabase.

### 4. Correr en desarrollo

```bash
npm run dev
```

Abre http://localhost:3000.

## Usuarios pre-cargados (seed)

**Equipo Pacífico**

| Nombre       | Rol      | Lo que puede hacer |
|--------------|----------|--------------------|
| Rodrigo      | admin    | Mover cualquier siniestro a cualquier columna |
| Jack         | terceros | Mueve pagos/reembolsos de **10 dígitos** en su etapa |
| Christian    | terceros | Mueve pagos/reembolsos de **8 dígitos** en su etapa |
| Rosita       | terceros | Mueve deducibles en su etapa ("Correo enviado") |
| María Elena  | viewer   | KPIs + Admin (jefatura) |
| Marcos       | viewer   | KPIs + Admin (jefatura) |

**Abogados externos** (rol `abogado`, agrupados por estudio)

| Estudio       | Abogados |
|---------------|----------|
| Estudio Abeo  | Oscar, Gonzalo, Diego, Juan |
| RVC           | Noelia, Micaela, Maritza, Pierina |
| JH            | Joel, Constantino, Ruth |
| Chacón        | Emily, Eduardo |
| Tuesta        | Enmanuel, Jordy, Alejandro Escobedo |

Al entrar a la app se muestra un selector agrupado por estudio. Tu elección se guarda en `localStorage` (`pacifico:usuario-nombre`).

### ¿Ya corriste el seed v1?

Si ya tenías `Estef` y los abogados demo, ejecuta `supabase/migration_v2.sql` en el SQL Editor. Renombra Estef → Rodrigo en todas las tablas (siniestros, movimientos, notificaciones), agrega la columna `estudio` y carga los 16 abogados reales. Es idempotente, puedes correrlo varias veces sin problema.

## Estructura

```
siniestros-pacifico/
├── app/
│   ├── layout.tsx              # Layout + header + selector
│   ├── page.tsx                # Tablero Kanban
│   ├── nuevo/page.tsx          # Formulario de nuevo siniestro
│   ├── siniestro/[id]/page.tsx # Detalle (ruta directa)
│   ├── dashboard/page.tsx      # KPIs (Fase 2)
│   └── admin/page.tsx          # Admin (Fase 2)
├── components/
│   ├── KanbanBoard.tsx
│   ├── KanbanColumn.tsx
│   ├── SiniestroCard.tsx
│   ├── SiniestroModal.tsx
│   ├── SiniestroForm.tsx
│   ├── UserContext.tsx
│   ├── UserSelector.tsx
│   ├── Header.tsx
│   └── ui/ (Button, Input, Badge)
├── lib/
│   ├── supabase.ts             # Cliente Supabase
│   ├── types.ts                # TypeScript types
│   ├── permissions.ts          # Reglas por rol
│   ├── workflows.ts            # Flujos por tipo de siniestro
│   └── utils.ts
└── supabase/
    ├── schema.sql              # DDL completo
    └── seed.sql                # Datos iniciales
```

## Flujos por tipo

**Pagos / Reembolsos**: Solicitud recibida → Actividad creada → En proceso de firmas → En trama → Pagado.

**Deducibles**: Solicitud recibida → Actividad creada → Correo enviado → Cobrado.

Quién es responsable de qué etapa se define en `lib/workflows.ts`.

## Permisos

Modelo "Estef asigna, cada responsable mueve su parte" (opción 4 del brief):

- **abogado** → crea siniestros, edita los suyos.
- **admin** (Estef) → puede mover cualquier cosa a cualquier columna; también puede devolver etapas.
- **terceros** (Jack/Christian/Rosita) → solo mueve siniestros que están en SU etapa (el sistema sabe quién es según los dígitos del código y el tipo).
- **viewer** → solo lectura.

Lógica en `lib/permissions.ts`.

## Auth por equipo

El sistema usa un password por equipo (no por persona). Cada equipo entra con su contraseña, y luego cada usuario elige su nombre del selector.

### Equipos

| Slug | Equipo | Usuarios que ven |
|------|--------|------------------|
| `pacifico` | Pacífico — Equipo Legal | Rodrigo, Jack, Christian, Rosita, María Elena, Marcos |
| `abeo` | Estudio Abeo | Oscar, Gonzalo, Diego, Juan |
| `rvc` | RVC | Noelia, Micaela, Maritza, Pierina |
| `jh` | JH | Joel, Constantino, Ruth |
| `chacon` | Chacón | Emily, Eduardo |
| `tuesta` | Tuesta | Enmanuel, Jordy |
| `escobedo` | Escobedo | Alejandro Escobedo |

### Cómo funciona
- Al entrar a la app sin sesión → redirige a `/login`
- Selecciona el equipo + ingresa la contraseña
- Si es correcta, se setea una cookie HTTP-only firmada (HMAC-SHA256, dura 30 días)
- Aparece el selector con los usuarios del equipo
- "Cambiar equipo" cierra la sesión y regresa a `/login`

### Seguridad
- Las contraseñas viven sólo en el servidor (env vars sin `NEXT_PUBLIC_`)
- La cookie está firmada con `AUTH_SECRET`, no se puede falsificar
- En producción la cookie es `httpOnly + secure + sameSite=lax`

## Deploy a Vercel

### 1. Sube el código a GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/<tu-usuario>/<tu-repo>.git
git push -u origin main
```

### 2. Importa el proyecto en Vercel

1. Ve a https://vercel.com/new
2. Importa tu repositorio de GitHub
3. Framework Preset: **Next.js** (lo detecta automáticamente)
4. Root Directory: `.` (raíz)
5. **NO le des deploy todavía** — primero las env vars

### 3. Configura las variables de entorno

En la pantalla de import (sección **Environment Variables**) agrega:

| Nombre | Valor |
|--------|-------|
| `NEXT_PUBLIC_SUPABASE_URL` | URL de tu proyecto Supabase |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Anon key de Supabase |
| `AUTH_SECRET` | Genera con `openssl rand -hex 32` (32+ caracteres aleatorios) |
| `TEAM_PASS_PACIFICO` | Contraseña del equipo Pacífico |
| `TEAM_PASS_ABEO` | Contraseña del equipo Abeo |
| `TEAM_PASS_RVC` | Contraseña del equipo RVC |
| `TEAM_PASS_JH` | Contraseña del equipo JH |
| `TEAM_PASS_CHACON` | Contraseña del equipo Chacón |
| `TEAM_PASS_TUESTA` | Contraseña del equipo Tuesta |
| `TEAM_PASS_ESCOBEDO` | Contraseña del equipo Escobedo |

**Tip para generar passwords**: `openssl rand -base64 12` (te da uno random de 12 caracteres). O usa frases memorables tipo `pacifico-legal-2026`.

### 4. Deploy

Click **Deploy**. En ~1 minuto tienes la URL pública (ej: `https://siniestros-pacifico.vercel.app`).

### 5. Comparte las contraseñas con cada equipo

- Pacífico interno (Rodrigo + Jack + Christian + Rosita + jefes): `TEAM_PASS_PACIFICO`
- Estudio Abeo: `TEAM_PASS_ABEO`
- etc.

Si una contraseña se filtra → cambias **solo esa env var en Vercel** + redeploy (1 click).

### 6. Cambiar passwords después
- Settings → Environment Variables → editas la que sea → "Save"
- Settings → Deployments → "Redeploy" del último deploy

### Para desarrollo local
```bash
cp .env.local.example .env.local
# Edita los valores
npm run dev
```
Si quieres saltarte el login en local: `SKIP_AUTH=true` en `.env.local`.

## Vista compacta vs detallada

El tablero tiene dos modos (toggle en la barra superior, se persiste en localStorage):
- **Compacto** (default): cada tarjeta muestra solo el código del siniestro. Click → modal con todo el detalle.
- **Detallado**: cada tarjeta muestra código, asegurado, monto, días en etapa, responsable.

La idea es que los abogados (que ingresan pocas veces y rápido) y los responsables vean el tablero limpio, con el siniestro como protagonista.

## Navegación por rol

Cada rol ve solo las páginas que necesita:

| Rol         | Tablero | Histórico | KPIs |
|-------------|---------|-----------|------|
| `admin`     | ✅      | ✅        | ✅   |
| `terceros`  | ✅      | ✅        | ✅   |
| `abogado`   | ✅      | —         | —    |
| `viewer`    | —       | ✅        | ✅   |

- **Tablero**: solo siniestros activos + cerrados en últimos 7 días (vista limpia).
- **Histórico**: todos los siniestros (incluyendo cerrados antiguos). Solo Pacífico.

(Configurable en `lib/permissions.ts`.)

## Scope por rol

Cada usuario tiene un selector "Mis / Mi estudio / Todos" en el tablero:

| Rol         | Default | Opciones |
|-------------|---------|----------|
| `admin`     | Todos   | Mis, Todos |
| `terceros`  | Mis     | Mis, Todos |
| `abogado`   | Mis     | Mis, **Mi estudio**, Todos |
| `viewer`    | Todos   | Todos |

- "Mis" para abogado = donde `solicitante = yo`.
- "Mis" para terceros/admin = donde `asignado_a = yo`.
- "Mi estudio" para abogado = solicitante es de mi mismo estudio (Estudio Abeo, RVC, JH, Chacón, Tuesta).
- La selección se persiste en `localStorage`.

## Roadmap

### Fase 1 — MVP (✅ entregado)
- [x] Schema + seed Supabase
- [x] Selector de usuario con localStorage
- [x] Kanban con filtros por tipo
- [x] Formulario nuevo siniestro (validación de código, condicional por tipo, PDFs)
- [x] Modal de detalle con notas editables, timeline y movimiento por permisos
- [x] Realtime básico en el tablero

### Fase 2 (✅ entregado)
- [x] Vista unificada con chips de tipo (Pagos/Reembolsos/Deducibles en una pestaña)
- [x] Toggle compacto/detallado en tarjetas
- [x] Navegación por rol
- [x] Campana de notificaciones in-app con Supabase Realtime
- [x] Dashboard de KPIs (cards + bar charts + line chart, filtros de fecha/tipo/responsable)
- [x] Panel admin para agregar/desactivar usuarios

### Fase 3 (✅ entregado en su mayoría)
- [x] Drag & drop (@dnd-kit) — arrastra entre columnas
- [x] Rediseño visual oscuro/glassmorphism tipo Linear/Height
- [x] Filtro de scope (Mis / Mi estudio / Todos)
- [x] Vista semanal + ruta /historico para Pacífico
- [x] Borrar siniestros (solo admin) en zona peligrosa del detalle
- [x] Contador de días prominente en el detalle del siniestro
- [x] Notas como toggle (no aparece el textarea si no se pidió)
- [ ] Export a Excel
- [ ] Auditoría detallada de cambios
