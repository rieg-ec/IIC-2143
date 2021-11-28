/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue/dist/vue.esm';
import { camelizeKeys } from 'humps';

import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faStar as farStar } from '@fortawesome/free-regular-svg-icons';
import {
  faStar as fasStar,
  faStarHalfAlt,
  faCaretLeft,
  faUser,
  faPencilAlt,
} from '@fortawesome/free-solid-svg-icons';
import { InlineSvgPlugin } from 'vue-inline-svg';

import CourseInfo from '../src/components/courses/course-info.vue';
import CourseCarousel from '../src/components/courses/course-carousel.vue';
import Lecture from '../src/components/lectures/lecture.vue';
import CourseForm from '../src/components/courses/course-form.vue';
import UserEditForm from '../src/components/users/user-edit-form.vue';
import LectureForm from '../src/components/lectures/lecture-form.vue';

import '../css/application.css';

Vue.filter('camelizeKeys', (value) => camelizeKeys(value));

Vue.component('course-info', CourseInfo);
Vue.component('course-carousel', CourseCarousel);
Vue.component('lecture', Lecture);
Vue.component('course-form', CourseForm);
Vue.component('lecture-form', LectureForm);

Vue.component('font-awesome-icon', FontAwesomeIcon);
Vue.component('user-edit-form', UserEditForm);

Vue.use(InlineSvgPlugin);

library.add(faCaretLeft, fasStar, farStar, faStarHalfAlt, faUser, faPencilAlt);

document.addEventListener('turbolinks:load', () => {
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
