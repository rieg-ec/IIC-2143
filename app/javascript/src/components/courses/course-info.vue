<template>
  <div class="flex flex-col w-full px-2 space-y-4">
    <div class="flex flex-col space-y-4">
      <div class="flex justify-center w-full bg-red-200">
        <img
          :src="course.backgroundUrl"
          class="rounded"
        >
      </div>
      <h1 class="text-2xl font-semibold">
        {{ course.name }}
      </h1>
      <div class="flex flex-row items-center space-x-4">
        <span class="text-gray-600">Jose Portillo</span>
        <span class="text-yellow-500">{{ reviewsRating }}</span>
        <span class="text-sm text-gray-600">({{ reviews.length }})</span>
        <a
          class="underline cursor-pointer"
          @click="reviewsTab = !reviewsTab"
        >{{ reviewsTab ? 'Ver clases' : 'Ver reviews' }}</a>
      </div>
    </div>
    <div
      v-if="!reviewsTab"
      class="flex flex-col space-y-4"
    >
      <div
        v-for="(lecture, index) in lectures"
        :key="index"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 hover:bg-gray-50 rounded-xl"
      >
        <div class="flex flex-col w-full space-y-4">
          <span class="text-base font-medium">{{ index }} {{ lecture.title }}</span>
          <p class="text-sm text-gray-700">
            {{ lecture.description }}
          </p>
        </div>
        <div class="flex items-center px-2 space-y-2">
          <span class="text-gray-500 whitespace-nowrap">1 hr 26 min</span>
        </div>
      </div>
    </div>
    <div
      v-else
      class="flex flex-col p-2 space-y-4"
    >
      <div
        v-for="(review, index) in reviews"
        :key="index"
        class="flex flex-col p-2 border border-gray-200 hover:bg-gray-50 rounded-xl space-y-4"
      >
        <div class="flex flex-row items-center justify-between w-full">
          <span class="text-base font-medium">Ignacio Vergara</span>
          <span class="5 estrellas" />
        </div>
        <p class="text-sm text-gray-700">
          {{ review.body }}
        </p>
      </div>
    </div>
    <div class="flex justify-center w-full py-4">
      <button
        v-if="student && reviewsTab"
        @click="addReview"
        class="course-btn"
      >
        Dejar review
      </button>
      <button
        v-else-if="!student && !reviewsTab"
        @click="registerCourse"
        class="course-btn"
      >
        Inscribirse
      </button>
    </div>
  </div>
</template>

<script>
import coursesApi from '../../api/courses';

export default {
  name: 'CourseInfo',
  props: {
    course: { type: Object, required: true },
    lectures: { type: Array, required: true },
    reviews: { type: Array, required: true },
    isStudent: { type: Boolean, required: true },
  },
  data() {
    return {
      reviewsTab: false,
      student: this.isStudent,
    };
  },
  computed: {
    reviewsRating() {
      return (
        this.reviews
          .map((review) => review.rating)
          .reduce((prev, curr) => prev + curr) / this.reviews.length
      );
    },
    totalReviews() {
      return this.reviews ? this.reviews.length : 0;
    },
  },
  methods: {
    async registerCourse() {
      try {
        await coursesApi.register(this.course.id);
        alert('Registrado con exito!');
        this.student = true;
      } catch (e) {
        alert('Hubo un error');
      }
    },
    addReview() {},
  },
};
</script>

<style scoped>
.course-btn {
  @apply px-12 py-2 text-2xl text-center text-white bg-red-500 rounded-lg hover:bg-red-600;
}
</style>
