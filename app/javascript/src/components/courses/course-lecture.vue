<template>
  <div
    class="flex flex-col items-center w-full h-full"
  >
    <div>
      <video controls>
        <source
          :src="lecture.videoUrl"
          type="video/mp4"
        >
      </video>
    </div>
    <div class="flex flex-row w-full pt-8">
      <button
        @click="historyBack"
        class="flex flex-row items-center justify-center px-4 text-2xl font-bold space-x-2 main-btn"
      >
        <font-awesome-icon
          :icon="['fas', 'caret-left']"
        />
        <span>Volver</span>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CourseLecture',
  props: {
    course: { type: Object, required: true },
    lecture: { type: Object, required: true },
  },
  methods: {
    historyBack() {
      window.history.back();
    },
  },
};
</script>
