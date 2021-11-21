module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      outline: {
        red: ['2px solid #ef4444', '1px'],
      },
    },
  },
  variants: {
    extend: {
      backgroundColor: ['active'],
      borderStyle: ['responsive', 'hover'],
      borderWidth: ['responsive', 'hover'],
    },
  },
  plugins: [],
};
