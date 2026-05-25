'use client';

import { useMemo } from 'react';
import { cn } from '@/lib/utils';

interface BarChartProps {
  data: { label: string; value: number }[];
  color?: string;
  formatValue?: (n: number) => string;
  emptyMessage?: string;
}

export function BarChart({ data, color = '#2EA1FF', formatValue, emptyMessage }: BarChartProps) {
  const max = useMemo(() => Math.max(1, ...data.map((d) => d.value)), [data]);
  if (data.length === 0) {
    return <div className="py-8 text-center text-sm text-white/40">{emptyMessage ?? 'Sin datos'}</div>;
  }
  return (
    <div className="space-y-2">
      {data.map((d) => {
        const pct = (d.value / max) * 100;
        return (
          <div key={d.label} className="flex items-center gap-3">
            <div className="w-28 shrink-0 text-xs text-white/70 truncate">{d.label}</div>
            <div className="flex-1 h-7 rounded-lg bg-white/5 relative overflow-hidden">
              <div
                className="absolute inset-y-0 left-0 rounded-lg transition-all"
                style={{
                  width: `${pct}%`,
                  background: `linear-gradient(90deg, ${color}33, ${color})`,
                  boxShadow: `0 0 0 1px ${color}55`,
                }}
              />
              <div className="absolute inset-0 flex items-center justify-end pr-2.5 text-[11px] font-semibold text-white">
                {formatValue ? formatValue(d.value) : d.value}
              </div>
            </div>
          </div>
        );
      })}
    </div>
  );
}

interface LineChartProps {
  data: { label: string; value: number }[];
  color?: string;
  height?: number;
  formatValue?: (n: number) => string;
}

export function LineChart({ data, color = '#2EA1FF', height = 180, formatValue }: LineChartProps) {
  if (data.length === 0) {
    return <div className="py-8 text-center text-sm text-white/40">Sin datos</div>;
  }
  const max = Math.max(1, ...data.map((d) => d.value));
  const w = 600;
  const h = height;
  const padding = { top: 14, right: 16, bottom: 28, left: 36 };
  const innerW = w - padding.left - padding.right;
  const innerH = h - padding.top - padding.bottom;
  const stepX = data.length > 1 ? innerW / (data.length - 1) : innerW;

  const points = data.map((d, i) => ({
    x: padding.left + i * stepX,
    y: padding.top + innerH - (d.value / max) * innerH,
    ...d,
  }));

  const path = points.map((p, i) => `${i === 0 ? 'M' : 'L'} ${p.x.toFixed(1)} ${p.y.toFixed(1)}`).join(' ');
  const area = `${path} L ${points[points.length - 1].x.toFixed(1)} ${(padding.top + innerH).toFixed(1)} L ${points[0].x.toFixed(1)} ${(padding.top + innerH).toFixed(1)} Z`;

  return (
    <svg viewBox={`0 0 ${w} ${h}`} className="w-full h-auto">
      <defs>
        <linearGradient id="lc-grad" x1="0" x2="0" y1="0" y2="1">
          <stop offset="0%" stopColor={color} stopOpacity="0.35" />
          <stop offset="100%" stopColor={color} stopOpacity="0" />
        </linearGradient>
      </defs>
      {[0, 0.5, 1].map((p) => {
        const y = padding.top + innerH * (1 - p);
        return (
          <g key={p}>
            <line x1={padding.left} x2={w - padding.right} y1={y} y2={y} stroke="rgba(255,255,255,0.06)" strokeDasharray="2 4" />
            <text x={padding.left - 6} y={y + 3} textAnchor="end" fontSize="10" fill="rgba(255,255,255,0.45)">
              {formatValue ? formatValue(max * p) : Math.round(max * p)}
            </text>
          </g>
        );
      })}
      <path d={area} fill="url(#lc-grad)" />
      <path d={path} fill="none" stroke={color} strokeWidth="2.5" strokeLinejoin="round" strokeLinecap="round" />
      {points.map((p, i) => (
        <g key={i}>
          <circle cx={p.x} cy={p.y} r="4" fill="#0b1220" stroke={color} strokeWidth="2.5" />
          <text x={p.x} y={padding.top + innerH + 18} textAnchor="middle" fontSize="10" fill="rgba(255,255,255,0.55)">
            {p.label}
          </text>
        </g>
      ))}
    </svg>
  );
}

interface MetricCardProps {
  label: string;
  value: string | number;
  hint?: string;
  tone?: 'default' | 'primary' | 'warning' | 'success';
  icon?: React.ReactNode;
}

export function MetricCard({ label, value, hint, tone = 'default', icon }: MetricCardProps) {
  const toneBg: Record<NonNullable<MetricCardProps['tone']>, string> = {
    default: 'glass',
    primary: 'bg-grad-pacifico shadow-glow border border-white/15',
    warning: 'bg-gradient-to-br from-amber-500 to-orange-500 border border-white/15',
    success: 'bg-gradient-to-br from-emerald-500 to-teal-500 border border-white/15',
  };
  const labelTone = 'text-white/70';
  return (
    <div className={cn('rounded-2xl p-5 relative overflow-hidden', toneBg[tone])}>
      {icon && <div className="absolute top-4 right-4 text-white/30">{icon}</div>}
      <div className={cn('text-[10px] font-semibold uppercase tracking-[0.15em]', labelTone)}>
        {label}
      </div>
      <div className="mt-2 text-3xl font-bold text-white tracking-tight">
        {value}
      </div>
      {hint && <div className="mt-1 text-xs text-white/60">{hint}</div>}
    </div>
  );
}
