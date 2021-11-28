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
  </div>
</template>

<script>
export default {
  name: 'Lecture',
  props: {
    lecture: { type: Object, required: true },
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
