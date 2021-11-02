const { environment } = require('@rails/webpacker');
const { DefinePlugin } = require('webpack');
const { VueLoaderPlugin } = require('vue-loader');
const path = require('path');

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin());

environment.loaders.prepend('vue', {
  test: /\.vue$/,
  use: [
    {
      loader: 'vue-loader',
    },
  ],
});

environment.plugins.prepend(
  'Define',
  new DefinePlugin({
    __VUE_OPTIONS_API__: false,
    __VUE_PROD_DEVTOOLS__: false,
  }),
);

environment.config.merge({
  resolve: {
    alias: {
      assets: path.resolve('./app/assets'),
      vue$: 'vue/dist/vue.esm.js',
    },
  },
});

module.exports = environment;
