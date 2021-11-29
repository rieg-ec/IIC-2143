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
      <div class="flex flex-row justify-between">
        <div class="flex flex-row items-center space-x-4">
          <span>{{ course.teacher.attributes.fullName }}</span>
          <review-rating
            :reviews="reviews"
            :text-size="'text-base'"
          />
          <div class="flex flex-row space-x-4">
            <button
              @click="handleClick('reviews')"
              class="underline"
              :class="{'opacity-50 no-underline': reviewsTab}"
            >
              Ver reviews
            </button>
            <button
              @click="handleClick('questions')"
              class="underline"
              :class="{'opacity-50 no-underline': questionsTab}"
            >
              Ver preguntas
            </button>
            <button
              @click="handleClick('lectures')"
              class="underline"
              :class="{'opacity-50 no-underline': lecturesTab}"
            >
              Ver clases
            </button>
          </div>
        </div>
        <button
          @click="handleModalOpen"
          class="main-btn"
          v-if="!lecturesTab && isCurrentUserStudent"
        >
          {{ questionsTab ? 'Hacer pregunta' : 'Dejar review' }}
        </button>
        <button
          @click="registerCourse"
          class="main-btn"
          v-if="!isCurrentUserStudent"
        >
          Inscribirme
        </button>
      </div>
      <div class="w-full">
        <reviews-list
          v-if="reviewsTab"
          :reviews="reviews"
          :current-user="currentUser"
          @delete-review="deleteReview"
        />
        <questions-list
          v-if="questionsTab"
          :questions="questions"
          :current-user="currentUser"
          @delete-question="deleteQuestion"
        />
        <course-lectures-list
          v-if="lecturesTab"
          :lectures="course.lectures"
          @lecture-click="goToLecture"
        />
      </div>
      <h3 class="pt-12 text-xl">
        Libros relacionados que te pueden gustar:
      </h3>
      <book-carousel
        :subject="course.category"
      />
    </div>
    <review-modal
      @cancel="openReviewModal = false"
      @confirm="createReview"
      v-if="openReviewModal"
      :course-id="course.id"
    />
    <question-modal
      @cancel="openQuestionModal = false"
      @confirm="createQuestion"
      v-if="openQuestionModal"
      :course-id="course.id"
    />
  </div>
</template>

<script>
import coursesApi from '../../api/courses';
import questionsApi from '../../api/questions';
import reviewsApi from '../../api/reviews';
import ReviewModal from '../reviews/review-modal.vue';
import QuestionModal from '../questions/question-modal.vue';
import ReviewRating from '../reviews/review-rating.vue';
import QuestionsList from '../questions/questions-list.vue';
import ReviewsList from '../reviews/reviews-list.vue';
import CourseLecturesList from '../courses/course-lectures-list.vue';
import BookCarousel from '../books/book-carousel.vue';

export default {
  name: 'CourseInfo',
  components: {
    ReviewModal,
    ReviewRating,
    QuestionModal,
    QuestionsList,
    ReviewsList,
    CourseLecturesList,
    BookCarousel,
  },
  props: {
    course: { type: Object, required: true },
    currentUser: { type: Object, required: true },
  },
  data() {
    return {
      reviewsTab: true,
      questionsTab: false,
      lecturesTab: false,
      openReviewModal: false,
      openQuestionModal: false,
      reviews: [],
      questions: [],
    };
  },
  async created() {
    const getQuestions = async () => {
      this.questions = await questionsApi.getAll(this.course.id);
    };
    const getReviews = async () => {
      this.reviews = await reviewsApi.getAll(this.course.id);
    };

    Promise.all([getQuestions(), getReviews()]);
  },
  computed: {
    isCurrentUserStudent() {
      return !!this.course.students.find(
        (user) => user.attributes.id === this.currentUser.id,
      );
    },
  },
  methods: {
    async registerCourse() {
      await coursesApi.register(this.course.id);
      location.reload();
    },
    async createReview(body, rating) {
      try {
        const response = await reviewsApi.create(this.course.id, { body, rating });
        this.reviews.unshift(response);
      } catch (e) {
        alert('Ocurrió un error');
      } finally {
        this.openReviewModal = false;
      }
    },
    async deleteReview(id) {
      await reviewsApi.delete(this.course.id, id);
      this.reviews = this.reviews.filter((review) => review.id !== id);
    },
    async createQuestion(body) {
      try {
        const response = await questionsApi.create(this.course.id, body);
        this.questions.unshift(response);
      } catch (e) {
        alert('Ocurrió un error');
      } finally {
        this.openQuestionModal = false;
      }
    },
    async deleteQuestion(id) {
      await questionsApi.delete(this.course.id, id);
      this.questions = this.questions.filter((question) => question.id !== id);
    },
    goToLecture(id) {
      window.location = `/courses/${this.course.id}/lectures/${id}`;
    },
    handleClick(query) {
      this.questionsTab = false;
      this.reviewsTab = false;
      this.lecturesTab = false;

      if (query === 'questions') {
        this.questionsTab = true;
      } else if (query === 'lectures') {
        this.lecturesTab = true;
      } else if (query === 'reviews') {
        this.reviewsTab = true;
      }
    },
    handleModalOpen() {
      if (this.questionsTab) {
        this.openQuestionModal = true;
      } else if (this.reviewsTab) {
        this.openReviewModal = true;
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
