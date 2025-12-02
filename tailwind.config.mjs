import tailwindcssAnimate from 'tailwindcss-animate'
import typography from '@tailwindcss/typography'

/** @type {import('tailwindcss').Config} */
const config = {
  // content: [
  //   './pages/**/*.{ts,tsx}',
  //   './components/**/*.{ts,tsx}',
  //   './app/**/*.{ts,tsx}',
  //   './src/**/*.{ts,tsx}',
  // ],
  // darkMode: ['selector', '[data-theme="dark"]'],
  // plugins: [tailwindcssAnimate, typography],

  theme: {
    // container: {
    //   center: true,
    //   padding: {
    //     '2xl': '2rem',
    //     DEFAULT: '1rem',
    //     lg: '2rem',
    //     md: '2rem',
    //     sm: '1rem',
    //     xl: '2rem',
    //   },
    //   screens: {
    //     '2xl': '86rem',
    //     lg: '64rem',
    //     md: '48rem',
    //     sm: '40rem',
    //     xl: '80rem',
    //   },
    // },
    extend: {
      animation: {
        'accordion-down': 'accordion-down 0.2s ease-out',
        'accordion-up': 'accordion-up 0.2s ease-out',
      },
      keyframes: {
        'accordion-down': {
          from: { height: '0' },
          to: { height: 'var(--radix-accordion-content-height)' },
        },
        'accordion-up': {
          from: { height: 'var(--radix-accordion-content-height)' },
          to: { height: '0' },
        },
      },
      typography: () => ({
        DEFAULT: {
          css: {
            '--tw-prose-body': 'var(--color-base-secondary)',
            '--tw-prose-headings': 'var(--color-base-primary)',
            h1: {
              fontWeight: 600,
              // marginBottom: '0.5em',
              fontSize: 'var(--text-h1)',
              lineHeight: '1.125',
              '&:where(:dir(rtl), [dir="rtl"], [dir="rtl"] *)': {
                lineHeight: '1.5',
              },
            },
            h2: {
              fontWeight: 600,
              // marginBottom: '0.5em',
              fontSize: 'var(--text-h2)',
            },
            h3: {
              fontWeight: 600,
              // marginBottom: '0.5em',
              fontSize: 'var(--text-h3)',
            },
            h4: {
              fontWeight: 600,
              // marginBottom: '0.5em',
              fontSize: 'var(--text-h4)',
            },
            h5: {
              fontWeight: 600,
              // marginBottom: '0.5em',
              fontSize: 'var(--text-h5)',
            },
            h6: {
              fontWeight: 600,
              // marginBottom: '0.5em',
              fontSize: 'var(--text-h6)',
            },
            p: {
              fontSize: 'var(--text-main)',
            },
            a: {
              '&:hover': {
                color: 'var(--color-blr-orange)',
              },
            },
          },
        },
        slate: {
          css: {
            '&:where(:dir(rtl), [dir="rtl"], [dir="rtl"] *)': {
              '--tw-prose-body': 'var(--color-teal-500)',
            },
            '--tw-prose-body': 'var(--color-base-secondary)',
            '--tw-prose-headings': 'var(--color-base-primary)',
            '--tw-prose-links': 'var(--color-base-primary)',
          },
        },
        base: {},
      }),
    },
  },
}

export default config
