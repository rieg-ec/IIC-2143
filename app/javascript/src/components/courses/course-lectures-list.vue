<template>
  <div class="flex flex-col w-full h-full space-y-1">
    <div
      v-for="lecture in lectures"
      :key="'lecture' + lecture.id"
      @click="$emit('lecture-click', lecture.id)"
      class="flex flex-col p-2 border border-gray-200 rounded cursor-pointer hover:opacity-70"
    >
      <div class="flex flex-col">
        <div class="flex flex-row items-center justify-between">
          <span class="text-xl font-semibold">{{ lecture.attributes.title }}</span>
          <span class="text-base text-gray-700">{{ lecture.attributes.createdAt }}</span>
        </div>
        <span class="text-base text-gray-600">{{ lecture.attributes.description }}</span>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'CourseLecturesList',
  props: {
    lectures: { type: Array, required: true },
  },
};
</script>
