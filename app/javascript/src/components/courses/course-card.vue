<template>
  <div
    @click="handleClick"
    class="w-64 h-64 overflow-hidden border border-transparent border-double rounded-lg cursor-pointer hover:border-gray-200"
  >
    <div class="bg-red-50 h-1/2">
      <img
        :src="course.backgroundUrl"
        class="w-full h-full object-fit"
      >
    </div>
    <div class="flex flex-col items-start w-full h-full p-1 p-2 space-y-2">
      <span class="text-lg">{{ course.name }}</span>
      <span class="text-sm text-gray-500">{{ course.teacher.attributes.fullName }}</span>
      <review-rating
        :reviews="course.reviews"
      />
      <div class="px-2 py-1 text-sm bg-yellow-500">
        <span class="font-semibold capitalize">{{ course.category }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import ReviewRating from '../reviews/review-rating.vue';

export default {
  name: 'CourseCard',
  components: { ReviewRating },
  props: {
    course: { type: Object, required: true },
  },
  data() {
    console.log(this.course);

    return {};
  },
  methods: {
    handleClick() {
      window.location = `/courses/${this.course.id}`;
    },
  },
};
</script>
