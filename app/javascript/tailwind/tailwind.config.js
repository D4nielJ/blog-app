module.exports = {
  mode: 'jit',
  enabled: ['production', 'staging'].includes(process.env.NODE_ENV),
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    container: (theme) => ({
      center: true,
      padding: {
        default: theme('spacing.8'),
        sm: theme('spacing.24'),
        lg: theme('spacing.40'),
        xl: theme('spacing.60'),
      },
    }),
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/aspect-ratio'),
  ],
};
