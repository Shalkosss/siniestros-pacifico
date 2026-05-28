# Deploy runbook — LegalTrack

Pasos para mover una versión de tu máquina a producción (Vercel).
Sigue de arriba a abajo, no saltes pasos.

---

## Antes de empezar

Asegúrate de tener:
- [ ] Acceso al repo `Shalkosss/siniestros-pacifico` en GitHub
- [ ] Acceso al proyecto en Vercel
- [ ] Acceso al proyecto Supabase (SQL Editor)
- [ ] Sesión iniciada en la app actual (sabes la URL en Vercel)

---

## Paso 1 — Subir el código a GitHub

Desde la raíz del proyecto:

```bash
git status                      # confirma qué cambios vas a subir
git push origin main            # si trabajaste sobre main directamente
# o, si trabajaste sobre una branch:
git push origin <nombre-branch>
```

Si trabajaste sobre una branch, abre el PR:

```
https://github.com/Shalkosss/siniestros-pacifico/pulls
```

Mergea a `main`. **Mergear a main dispara el deploy automático en Vercel.**

---

## Paso 2 — Correr la migración SQL (si la versión la incluye)

Cada vez que liberes una versión que toca el schema (cambios en `supabase/migration_vN.sql`):

1. Abre **Supabase → SQL Editor → New query**
2. Pega el contenido del archivo `supabase/migration_vN.sql` (la N más nueva)
3. Click **Run**
4. Confirma que dice "Success. No rows returned" o similar

**Versión actual: v4.** Si vienes de una BD limpia, ya está todo aplicado. Si vienes de v3, corre:

```sql
-- supabase/migration_v4.sql
alter table public.siniestros
  add column if not exists archived_at timestamptz;

alter table public.siniestros
  add column if not exists correo_enviado boolean not null default false;

create index if not exists idx_siniestros_archived on public.siniestros (archived_at);
create index if not exists idx_siniestros_activos
  on public.siniestros (created_at desc)
  where archived_at is null;
```

Las migraciones son **idempotentes** (`if not exists`). Puedes correrlas varias veces sin romper nada.

---

## Paso 3 — Verificar el deploy en Vercel

1. Ve a https://vercel.com/dashboard → tu proyecto
2. Pestaña **Deployments**: el último debe estar en estado "Ready" (✅ verde)
3. Si dice "Building" espera 1-2 min
4. Si dice "Failed" (❌ rojo): click en el deploy → "View Build Logs" → busca el error

**Errores típicos:**
- Missing env var → ir a Settings → Environment Variables y agregarla
- TypeScript error → revisar el commit, hacer fix, push de nuevo
- Build OOM → muy raro, contactar a soporte de Vercel

---

## Paso 4 — Smoke test en producción

Abre la URL de Vercel y revisa estos puntos en orden. **No avises al equipo hasta pasar esta lista.**

### A. Login y auth
- [ ] Sin sesión, te redirige a `/login`
- [ ] Login con `pacifico` + tu password → entra al tablero
- [ ] Cambiar de equipo → vuelve a `/login`
- [ ] Login con `abeo` (u otro estudio) + su password → entra y solo ves los usuarios de Abeo

### B. Tablero (como Rodrigo)
- [ ] Tablero carga sin errores
- [ ] 3 secciones visibles: Pagos (cyan), Deducibles (ámbar), Reembolsos (violeta)
- [ ] Drag de una card entre columnas funciona y persiste tras refresh
- [ ] Toggle "Solo míos" filtra correctamente

### C. Crear siniestro (como abogado, ej: Oscar de Abeo)
- [ ] Form `/nuevo` se ve dark, no blanco
- [ ] Selector de tipo cambia color del botón "Crear"
- [ ] Validación de código (8 o 10 dígitos) funciona
- [ ] Tras crear → aparece el **step de confirmación** con preview del correo
- [ ] "Para" y "CC" son los esperados (ver tabla en README — sección Email)
- [ ] Click "Abrir correo y enviar" → abre Outlook/Gmail prellenado
- [ ] Vuelves al tablero → la nueva card tiene **ícono ✉ verde** (correo enviado)

### D. Mobile
Abre Chrome DevTools, F12 → toggle device toolbar (Ctrl+Shift+M) → iPhone 12 Pro:
- [ ] La campana de notificaciones **no aparece** en mobile
- [ ] El "+ Nuevo" aparece como **círculo cyan** arriba a la derecha
- [ ] El nav (Tablero / Histórico / KPIs) aparece como **segunda fila** full-width
- [ ] Las cards se ven bien, sin overflow horizontal

### E. Archivar (como Rodrigo / terceros)
- [ ] Click en una card → modal abre
- [ ] Botón "Archivar" aparece (sección zona peligrosa o similar)
- [ ] Confirmar archivar → la card desaparece del tablero
- [ ] Ir a `/historico` → la card aparece ahí

### F. Restricciones
- [ ] Como abogado: NO ves "Archivar", NO ves "Histórico" en el nav, NO ves filtros avanzados
- [ ] Como viewer (María Elena/Marcos): NO ves el tablero, default cae en KPIs

---

## Paso 5 — Si algo falla en producción

**Rollback rápido en Vercel:**
1. Deployments → busca el deploy anterior (el que sí funcionaba)
2. Click en los `…` → **Promote to Production**
3. En segundos vuelves a la versión vieja. Investiga el problema con calma.

**Rollback del schema (más serio):**
- Las migraciones son `ADD COLUMN IF NOT EXISTS` — agregar columnas nunca rompe el código viejo (las columnas extra se ignoran)
- Solo `DROP COLUMN` rompería. No lo hacemos en migraciones de versión.

---

## Paso 6 — Avisar al equipo

Usa el template de `TEMPLATE_COMMS.md` (en este mismo repo) y mándalo por WhatsApp / Slack.

---

## Histórico de versiones

Ver `CHANGELOG.md` para detalles de qué cambió en cada versión.
