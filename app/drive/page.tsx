'use client';

import { DriveBoard } from '@/components/DriveBoard';
import { useUser } from '@/components/UserContext';

export default function DrivePage() {
  const { usuario } = useUser();
  if (!usuario) return null;
  return <DriveBoard />;
}
