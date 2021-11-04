import Vue from 'vue/dist/vue.esm';
import { camelizeKeys } from 'humps';
import VueCarousel from 'vue-carousel';

import PopularCourses from './components/popular-courses.vue';
import CourseInfo from './components/courses/course-info.vue';
import CourseLesson from './components/courses/course-lesson.vue';

import '../css/application.css';

Vue.filter('camelizeKeys', (value) => camelizeKeys(value));

Vue.component('popular-courses', PopularCourses);
Vue.component('course-info', CourseInfo);
Vue.component('course-lesson', CourseLesson);
Vue.use(VueCarousel);

export default () => {
  document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('vue-app')) {
      if (process.env.RAILS_ENV === 'production') {
        console.log('production mode');
      }

      return new Vue({
        el: '#vue-app',
      });
    }

    return null;
  });
};
