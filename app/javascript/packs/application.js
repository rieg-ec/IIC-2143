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
} from '@fortawesome/free-solid-svg-icons';
import { InlineSvgPlugin } from 'vue-inline-svg';

import PopularCourses from '../src/components/popular-courses.vue';
import CourseInfo from '../src/components/courses/course-info.vue';
import CourseLecture from '../src/components/courses/course-lecture.vue';
import CourseCarousel from '../src/components/courses/course-carousel.vue';
import ReviewRating from '../src/components/review-rating.vue';
import QuestionModal from '../src/components/questions/question-modal.vue';
import CourseCreateForm from '../src/components/courses/course-create-form.vue';

import '../css/application.css';

Vue.filter('camelizeKeys', (value) => camelizeKeys(value));

Vue.component('popular-courses', PopularCourses);
Vue.component('course-info', CourseInfo);
Vue.component('course-carousel', CourseCarousel);
Vue.component('review-rating', ReviewRating);
Vue.component('course-lecture', CourseLecture);
Vue.component('course-create-form', CourseCreateForm);
Vue.component('question-modal', QuestionModal);
Vue.component('font-awesome-icon', FontAwesomeIcon);

Vue.use(InlineSvgPlugin);

library.add(faCaretLeft, fasStar, farStar, faStarHalfAlt);

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
