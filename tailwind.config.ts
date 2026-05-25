import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        // Fondos — gris oscuro neutro (NO azul) para que los tintes resalten
        base: '#0f1117',
        panel: '#16181f',
        column: '#1a1d25',
        card: '#1e2129',
        'card-hover': '#252830',

        // Accent por tipo — Pagos en CYAN para contrastar con dark
        pago: '#06b6d4',       // cyan/teal
        deducible: '#f59e0b',  // ámbar
        reembolso: '#8b5cf6',  // violeta

        // Alias de marca (se mantienen apuntando a los nuevos valores)
        pacifico: {
          primary: '#06b6d4',
          secondary: '#22d3ee',
          dark: '#0e7490',
          light: 'rgba(6, 182, 212, 0.12)',
        },
        ink: {
          900: '#0f1117',
          800: '#16181f',
          700: '#1a1d25',
          600: '#1e2129',
        },
        accent: {
          success: '#22c55e',
          warning: '#eab308',
          danger: '#ef4444',
          orange: '#f59e0b',
          violet: '#8b5cf6',
        },
        surface: {
          DEFAULT: '#FFFFFF',
          muted: '#F5F7FA',
          border: '#E5E9F0',
        },
      },
      fontFamily: {
        sans: ['Plus Jakarta Sans', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'ui-monospace', 'monospace'],
      },
      boxShadow: {
        card: '0 1px 2px rgba(0,0,0,0.20), 0 6px 16px -8px rgba(0,0,0,0.30)',
        'card-hover': '0 8px 24px -8px rgba(0,0,0,0.5)',
        glow: '0 0 0 1px rgba(6,182,212,0.35), 0 4px 24px -4px rgba(6,182,212,0.35)',
      },
      backgroundImage: {
        'grad-pago':      'linear-gradient(135deg, #0e7490 0%, #22d3ee 100%)',
        'grad-deducible': 'linear-gradient(135deg, #b45309 0%, #fbbf24 100%)',
        'grad-reembolso': 'linear-gradient(135deg, #6d28d9 0%, #a78bfa 100%)',
      },
    },
  },
  plugins: [],
};

export default config;
