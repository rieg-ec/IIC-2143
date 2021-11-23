<template>
  <div>
    <Carousel
      :navigation-enabled="true"
      :autoplay="true"
      :per-page="perPageLocal"
    >
      <slide
        class="px-2"
        v-for="(course, index) in courses"
        :key="index"
      >
        <CourseCard
          :course-url="`/courses/${course.id}`"
          :course="course"
        />
      </slide>
    </Carousel>
  </div>
</template>

<script>
import { Carousel, Slide } from 'vue-carousel';
import CourseCard from '../courses/course-card.vue';

export default {
  name: 'CourseCarousel',
  components: { Carousel, Slide, CourseCard },
  props: {
    courses: { type: Array, required: true },
    perPage: { type: Number, default: 4 },
  },
  computed: {
    perPageLocal() {
      return this.courses.length > this.perPage ? this.perPage :
        this.courses.length;
    },
  },
};
</script>
