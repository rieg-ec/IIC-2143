<template>
  <div class="flex flex-col">
    {{ $filters.camelizeKeys(courses) }}
  </div>
</template>

<script>
export default {
  name: 'PopularCourses',
  props: {
    courses: { type: Array, required: true },
  },
  data() {},
};
</script>

<style scoped>
.btn {
  @apply flex items-center justify-center px-6 text-white bg-blue-500 rounded;
}
</style>
