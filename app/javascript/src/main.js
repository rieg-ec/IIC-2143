import { createApp } from 'vue/dist/vue.esm-bundler';
import HelloWorld from './components/hello-world.vue';

const app = createApp({});

app.component('hello-world', HelloWorld);

export default () => {
  document.addEventListener('DOMContentLoaded', () => {
    app.mount('#app');
  });
};
