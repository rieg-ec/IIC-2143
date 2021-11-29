<template>
  <div v-if="!!books">
    <Carousel
      :navigation-enabled="true"
      :autoplay="true"
      :per-page="5"
    >
      <slide
        class="self-start px-2"
        v-for="(book, index) in books"
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

import booksApi from '../../api/books.js';
import BookCard from './book-card.vue';

export default {
  name: 'CourseBooks',
  components: { Carousel, Slide, BookCard },
  props: {
    subject: { type: String, required: true },
  },
  data() {
    return {
      books: [],
    };
  },
  async created() {
    this.books = await booksApi.get(this.subject);
  },
};
</script>
