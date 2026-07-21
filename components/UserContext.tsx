'use client';

import { createContext, ReactNode, useContext, useEffect, useState, useCallback, useMemo } from 'react';
import { supabase } from '@/lib/supabase';
import type { Usuario } from '@/lib/types';
import { type TeamSlug, usuariosDeEquipo, getTeamBySlug } from '@/lib/teams';

interface UserCtx {
  team: TeamSlug | null;
  teamLabel: string | null;
  usuario: Usuario | null;
  /** Usuarios disponibles para SELECCIONAR (filtrados al equipo) */
  usuariosEquipo: Usuario[];
  /** Todos los usuarios activos (sin filtrar). Para lookups, scope estudio, etc. */
  usuarios: Usuario[];
  setUsuario: (u: Usuario | null) => void;
  loading: boolean;
  refrescar: () => Promise<void>;
  logout: () => Promise<void>;
}

const Ctx = createContext<UserCtx | undefined>(undefined);
const STORAGE_KEY = 'pacifico:usuario-nombre';

/**
 * v10 — deja constancia de que el usuario entró hoy (una fila por usuario/día).
 * Fire-and-forget: si la tabla no existe aún o falla, no bloquea la app.
 */
function registrarAcceso(u: Usuario, team: TeamSlug | null) {
  void supabase
    .from('usuario_accesos')
    .upsert(
      {
        usuario_nombre: u.nombre,
        rol: u.rol,
        estudio: u.estudio,
        team,
        fecha: new Date().toISOString().slice(0, 10),
      },
      { onConflict: 'usuario_nombre,fecha', ignoreDuplicates: true }
    )
    .then(({ error }) => {
      if (error) console.warn('No se pudo registrar el acceso', error.message);
    });
}

export function UserProvider({ team, children }: { team: TeamSlug | null; children: ReactNode }) {
  const [usuarios, setUsuarios] = useState<Usuario[]>([]);
  const [usuario, setUsuarioState] = useState<Usuario | null>(null);
  const [loading, setLoading] = useState(true);

  const teamLabel = team ? getTeamBySlug(team)?.label ?? null : null;

  const cargarUsuarios = useCallback(async () => {
    const { data, error } = await supabase
      .from('usuarios')
      .select('*')
      .eq('activo', true)
      .order('rol')
      .order('nombre');
    if (error) {
      console.error('Error cargando usuarios', error);
      setLoading(false);
      return;
    }
    setUsuarios(data ?? []);

    // Solo restaurar el usuario del localStorage si pertenece al equipo actual
    const guardado = typeof window !== 'undefined' ? localStorage.getItem(STORAGE_KEY) : null;
    if (guardado && team) {
      const elegibles = usuariosDeEquipo(data ?? [], team);
      const found = elegibles.find((u) => u.nombre === guardado);
      if (found) {
        setUsuarioState(found);
        registrarAcceso(found, team);
      } else setUsuarioState(null);
    } else {
      setUsuarioState(null);
    }
    setLoading(false);
  }, [team]);

  useEffect(() => {
    void cargarUsuarios();
  }, [cargarUsuarios]);

  const setUsuario = useCallback(
    (u: Usuario | null) => {
      setUsuarioState(u);
      if (typeof window !== 'undefined') {
        if (u) localStorage.setItem(STORAGE_KEY, u.nombre);
        else localStorage.removeItem(STORAGE_KEY);
      }
      if (u) registrarAcceso(u, team);
    },
    [team]
  );

  const logout = useCallback(async () => {
    await fetch('/api/auth/logout', { method: 'POST' });
    if (typeof window !== 'undefined') {
      localStorage.removeItem(STORAGE_KEY);
      window.location.href = '/login';
    }
  }, []);

  const usuariosEquipo = useMemo(
    () => usuariosDeEquipo(usuarios, team),
    [usuarios, team]
  );

  return (
    <Ctx.Provider
      value={{
        team,
        teamLabel,
        usuario,
        usuariosEquipo,
        usuarios,
        setUsuario,
        loading,
        refrescar: cargarUsuarios,
        logout,
      }}
    >
      {children}
    </Ctx.Provider>
  );
}

export function useUser() {
  const c = useContext(Ctx);
  if (!c) throw new Error('useUser debe usarse dentro de <UserProvider>');
  return c;
}
