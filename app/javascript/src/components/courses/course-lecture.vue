<template>
  <div class="flex flex-col items-center w-full h-full py-4 space-y-4">
    <div>
      <video controls>
        <source
          :src="lecture.videoUrl"
          type="video/mp4"
        >
      </video>
    </div>
    <div class="flex flex-row justify-between w-full pt-8">
      <span class="text-2xl font-semibold">Preguntas</span>
      <button
        @click="openReviewModal = true"
        class="main-btn"
      >
        Preguntar
      </button>
    </div>
    <div class="flex flex-col w-full space-y-2">
      <div
        class="relative flex flex-col justify-between w-full h-full px-4 py-12 border"
        v-for="(question, index) in questions"
        :key="index"
      >
        <p class="">
          {{ question.body }}
        </p>
        <span class="absolute bottom-0 left-0 px-4 py-2 text-sm text-base font-normal text-gray-500">{{ question.createdAt }}</span>
      </div>
    </div>
    <question-modal
      @cancel="openReviewModal = false"
      @confirm="handleQuestionCreate"
      v-if="openReviewModal"
      :course-id="course.id"
    />
  </div>
</template>

<script>
export default {
  name: 'CourseLecture',
  props: {
    course: { type: Object, required: true },
    lecture: { type: Object, required: true },
    questions: { type: Array, default: () => [] },
  },
  data() {
    return {
      openReviewModal: false,
    };
  },
  methods: {
    historyBack() {
      window.history.back();
    },
    handleQuestionCreate() {
      this.openReviewModal = false;
      location.reload();
    },
  },
};
</script>
