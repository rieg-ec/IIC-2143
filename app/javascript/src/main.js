import { createApp } from 'vue/dist/vue.esm-bundler';
import HelloWorld from './components/hello-world.vue';
import '../css/application.css';

const app = createApp({});

app.component('hello-world', HelloWorld);

export default () => {
  document.addEventListener('DOMContentLoaded', () => {
    app.mount('#app');
  });
};
