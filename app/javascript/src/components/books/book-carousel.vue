<template>
  <div>
    <Carousel
      :navigation-enabled="true"
      :autoplay="true"
      :per-page="perPageLocal"
    >
      <slide
        class="self-start px-2"
        v-for="(course, index) in courses"
        :key="index"
      >
        <BookCard
          :book="book"
        />
      </slide>
    </Carousel>
  </div>
</template>

<script>
import { Carousel, Slide } from 'vue-carousel';
import BookCard from '../books/book-card.vue';

export default {
  name: 'CourseCarousel',
  components: { Carousel, Slide, BookCard },
  props: {
    books: { type: Array, required: true },
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
