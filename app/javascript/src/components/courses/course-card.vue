<template>
  <div
    @click="handleClick"
    class="w-64 overflow-hidden border border-transparent border-double rounded-lg cursor-pointer hover:border-gray-200"
  >
    <div>
      <img :src="course.backgroundUrl">
    </div>
    <div class="flex flex-col items-start w-full h-full p-1 p-2 space-y-2">
      <span class="text-lg">{{ course.name }}</span>
      <span class="text-sm text-gray-500">{{ course.teacher.fullName }}</span>
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
import ReviewRating from '../review-rating.vue';

export default {
  name: 'CourseCard',
  components: { ReviewRating },
  props: {
    courseUrl: { type: String, required: true },
    course: { type: Object, required: true },
  },
  mounted() {
    console.log(this.course);
  },
  methods: {
    handleClick() {
      window.location = this.courseUrl;
    },
  },
};
</script>
