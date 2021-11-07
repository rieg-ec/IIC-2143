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
} from '@fortawesome/free-solid-svg-icons';

import PopularCourses from '../src/components/popular-courses.vue';
import CourseInfo from '../src/components/courses/course-info.vue';
import CourseLesson from '../src/components/courses/course-lesson.vue';
import CourseCarousel from '../src/components/courses/course-carousel.vue';
import ReviewRating from '../src/components/review-rating.vue';

import '../css/application.css';

Vue.filter('camelizeKeys', (value) => camelizeKeys(value));

Vue.component('popular-courses', PopularCourses);
Vue.component('course-info', CourseInfo);
Vue.component('course-lesson', CourseLesson);
Vue.component('course-carousel', CourseCarousel);
Vue.component('review-rating', ReviewRating);

Vue.component('font-awesome-icon', FontAwesomeIcon);

library.add(fasStar, farStar, faStarHalfAlt);

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
