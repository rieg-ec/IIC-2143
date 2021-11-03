<template>
  <div class="flex flex-col px-2 space-y-4">
    <div class="flex flex-col space-y-4">
      <div class="w-full">
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
        <a class="underline cursor-pointer">Ver reviews</a>
      </div>
    </div>
    <div class="flex flex-col space-y-4">
      <div
        v-for="(lecture, index) in lectures"
        :key="index"
        class="flex flex-row justify-between w-full p-2 border border-gray-200 rounded-xl"
      >
        <div class="flex flex-col w-full">
          <span class="text-base font-medium">{{ index }} {{ lecture.title }}</span>
          <p>{{ lecture.description }}</p>
        </div>
        <div class="flex flex-col items-center w-32 h-ful space-y-2">
          <img :src="lecture.backgroundUrl">
          <span class="text-gray-500">1 hr 26 min</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CourseInfo',
  props: {
    course: { type: Object, required: true },
    lectures: { type: Array, required: true },
    reviews: { type: Array, required: true },
  },
  data() {
    return {};
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
};
</script>

<style scoped>
</style>
