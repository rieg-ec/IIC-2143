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
          :reviews="reviews"
          :text-size="'text-base'"
        />
        <a
          class="underline cursor-pointer"
          @click="reviewsTab = !reviewsTab"
        >
           Ver clases
        </a>
        <a
          class="underline cursor-pointer"
          @click="reviewsTab = !reviewsTab"
        >
          Ver reviews
        </a>
        <a 
          class="underline cursor-pointer"
          @click="questionsTab = !questionsTab"
          :disabled="questionsTab ? true : false"
        >
          Ver preguntas</a>
      </div>
    </div>
    <div
      v-if="!reviewsTab && !questionsTab"
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
        @click="goToLecture(lecture.id)"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 cursor-pointer hover:bg-gray-50 rounded-xl"
      >
        <div class="flex flex-col w-full space-y-4">
          <span
            class="text-base font-medium"
          >
            {{ index }} {{ lecture.title }}
          </span>
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
      v-if="reviewsTab && !questionsTab"
      class="flex flex-col p-2 space-y-4"
    >
      <div
        v-if="!reviews.length"
        class="w-full py-12 text-center"
      >
        <span class="text-lg text-gray-300">No hay reviews.</span>
      </div>
      <div
        v-for="(review, index) in reviews"
        :key="index"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 hover:bg-gray-50 rounded-xl"
      >
        <div class="flex flex-col items-left">
          <div class="flex flex-row items-center justify-between w-full space-x-4">
            <span class="text-base font-medium">{{ review.author.attributes.fullName }}</span>
            <div class="flex flex-row text-yellow-600">
              <font-awesome-icon
                v-for="ratingIndex in review.full"
                :key="ratingIndex + 'full'"
                :icon="['fas', 'star']"
              />
              <font-awesome-icon
                v-if="review.half"
                :key="ratingIndex + 'half'"
                :icon="['fas', 'star-half-alt']"
              />
              <font-awesome-icon
                v-for="ratingIndex in review.empty"
                :key="ratingIndex + 'empty'"
                :icon="['far', 'star']"
              />
            </div>
          </div>
          <p class="text-sm text-gray-700">
            {{ review.body }}
          </p>
        </div>
        <div class="flex items-center justify-center h-full px-2">
          <button
            v-if="review.id === currentUserReviewId"
            @click="deleteReview(review.id)"
            class="main-btn"
          >
            Eliminar
          </button>
        </div>
      </div>
    </div>
    <div 
      v-else-if="!reviewsTab && questionsTab"
      class="flex flex-col p-2 space-y-4"
    >
      <div
        v-if="!questions.length"
        class="w-full py-12 text-center"
      >
        <span class="text-lg text-gray-300">No hay preguntas.</span>
      </div>
      <div
        v-for="(question, index) in questions"
        :key="index"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 hover:bg-gray-50 rounded-xl"
      >
        <div class="flex flex-col items-left">>
          <div class="flex flex-row items-center justify-between w-full space-x-4">
            <span class="text-base font-medium">{{ question.author.attributes.fullName }}</span>>
              <p class="text-sm text-gray-700">{{ question.body }}</p>
          </div>
          <div class="flex items-center justify-center h-full px-2">
          <button
            v-if="currentUserQuestionIds.includes(question.id)"
            @click="deleteQuestion(question.id)"
            class="main-btn"
          >
            Eliminar
          </button>
          </div>
        </div>
      </div>
    </div>
    <div class="flex justify-center w-full py-4">
      <button
        v-if="isCurrentUserStudent && reviewsTab && !currentUserReviewId && !questionsTab"
        @click="openReviewModal = true"
        class="course-btn"
      >
        Dejar review
      </button>
      <button
        v-else-if="!isCurrentUserStudent && !reviewsTab && !questionsTab"
        @click="registerCourse"
        class="course-btn"
      >
        Inscribirse
      </button>
      <button
        v-else-if="isCurrentUserStudent && !reviewsTab && questionsTab"
        @click="openQuestionModal = true"
        class="course-btn"
      >
        Dejar Pregunta
      </button>
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
import ReviewModal from '../review-modal.vue';
import reviewsApi from '../../api/reviews';
import ReviewRating from '../review-rating.vue';
import QuestionModal from '../questions/question-modal.vue';
import questionsApi from '../../api/questions';

export default {
  name: 'CourseInfo',
  components: { ReviewModal, ReviewRating, QuestionModal },
  props: {
    course: { type: Object, required: true },
    currentUser: { type: Object, required: true },
  },
  data() {
    return {
      reviewsTab: false,
      questionsTab: false,
      openReviewModal: false,
      openQuestionModal: false,
      reviews: [],
      questions: [],
    };
  },
  async created() {
    this.reviews = await reviewsApi.getAll(this.course.id);
    this.questions = await questionsApi.getAll(this.course.id);
  },
  computed: {
    isCurrentUserStudent() {
      return !!this.course.students.find(
        (user) => user.attributes.id === this.currentUser.id,
      );
    },
    currentUserReviewId() {
      const currentUserReview = this.reviews.find((review) => review.author.attributes.id === this.currentUser.id);

      return currentUserReview && currentUserReview.id;
    },
    currentUserQuestionIds() {
      return this.questions.filter((question) => question.author.attributes.id === this.currentUser.id).map((question) => question.id);
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
        this.reviews.push(response);
      } catch (e) {
        alert('Rating debe estar entre 0 y 5');
      } finally {
        this.openReviewModal = false;
      }
    },
    async deleteReview(id) {
      await reviewsApi.delete(this.course.id, id);
      this.reviews = this.reviews.filter((review) => review.id !== id);
    },
    goToLecture(id) {
      window.location = `/courses/${this.course.id}/lectures/${id}`;
    },
    async createQuestion(body) {
      console.log(body);
      try {
        const response = await questionsApi.create(this.course.id, body);
        this.questions.push(response);
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
    cambio(){
      this.questionsTab = !this.questionsTab
      this.reviewsTab = !this.reviewsTab
    }
  },
};
</script>

<style scoped>
.course-btn {
  @apply px-12 py-2 text-2xl text-center text-white bg-red-500 rounded-lg hover:bg-red-600;
}
</style>
