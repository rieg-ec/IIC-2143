<template>
  <div class="flex flex-col w-full px-2 space-y-4">
    <div class="flex flex-col space-y-4">
      <div class="flex justify-center w-full bg-red-200">
        <img
          :src="course.backgroundUrl"
          class="object-fill rounded"
        >
      </div>
      <h1 class="text-2xl font-semibold">
        {{ course.name }}
      </h1>
      <div class="flex flex-row items-center space-x-4">
        <span class="text-gray-600">Jose Portillo</span>
        <review-rating
          :reviews="course.reviews"
          :text-size="'text-base'"
        />
        <a
          class="underline cursor-pointer"
          @click="reviewsTab = !reviewsTab"
        >
          {{ reviewsTab ? 'Ver clases' : 'Ver reviews' }}
        </a>
      </div>
    </div>
    <div
      v-if="!reviewsTab"
      class="flex flex-col space-y-4"
    >
      <div
        v-if="!course.lectures.length"
        class="w-full py-12 text-center"
      >
        <span class="text-lg text-gray-300">No hay clases.</span>
      </div>
      <div
        v-for="(lecture, index) in course.lectures"
        :key="index"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 hover:bg-gray-50 rounded-xl"
      >
        <div class="flex flex-col w-full space-y-4">
          <span
            class="text-base font-medium"
          >{{ index }} {{ lecture.title }}</span>
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
        v-if="!course.reviews.length"
        class="w-full py-12 text-center"
      >
        <span class="text-lg text-gray-300">No hay reviews.</span>
      </div>
      <div
        v-for="(review_, index) in course.reviews"
        :key="index"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 hover:bg-gray-50 rounded-xl"
      >
        <div class="flex flex-col items-left">
          <div class="flex flex-row items-center justify-between w-full">
            <span class="text-base font-medium">Ignacio Vergara</span>
            <span class="5 estrellas" />
          </div>
          <p class="text-sm text-gray-700">
            {{ review_.body }}
          </p>
        </div>
        <div class="flex items-center justify-center h-full px-2">
          <button
            v-if="review && review_.id === review.id"
            @click="deleteReview"
            class="main-btn"
          >
            Eliminar
          </button>
        </div>
      </div>
    </div>
    <div class="flex justify-center w-full py-4">
      <button
        v-if="isStudent && reviewsTab && !review"
        @click="openReviewModal = true"
        class="course-btn"
      >
        Dejar review
      </button>
      <button
        v-else-if="!isStudent && !reviewsTab"
        @click="registerCourse"
        class="course-btn"
      >
        Inscribirse
      </button>
    </div>
    <review-modal
      @cancel="openReviewModal = false"
      @confirm="openReviewModal = false"
      v-if="openReviewModal"
      :course-id="course.id"
    />
  </div>
</template>

<script>
import coursesApi from '../../api/courses';
import ReviewModal from '../review-modal.vue';
import reviewsApi from '../../api/reviews';
import ReviewRating from '../review-rating.vue';

export default {
  name: 'CourseInfo',
  components: { ReviewModal, ReviewRating },
  props: {
    course: { type: Object, required: true },
    isStudent: { type: Boolean, required: true },
  },
  data() {
    return {
      reviewsTab: false,
      review: null,
      openReviewModal: false,
    };
  },
  async mounted() {
    try {
      const response = await reviewsApi.getAll({ courseId: this.course.id });
      this.review = response;
    } catch (e) {
      console.log(e);
    }
  },
  methods: {
    async registerCourse() {
      try {
        await coursesApi.register(this.course.id);
        location.reload();
      } catch (e) {
        alert('Hubo un error');
      }
    },
    async deleteReview() {
      try {
        await reviewsApi.delete(this.review.id);
        location.reload();
      } catch (e) {
        alert('Hubo un error');
      }
    },
  },
};
</script>

<style scoped>
.course-btn {
  @apply px-12 py-2 text-2xl text-center text-white bg-red-500 rounded-lg hover:bg-red-600;
}
</style>
