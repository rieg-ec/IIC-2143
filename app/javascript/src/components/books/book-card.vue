<template>
  <div
    @click="handleClick"
    class="w-64 h-64 overflow-hidden border border-transparent border-double rounded-lg cursor-pointer hover:border-gray-200"
  >
    <div class="bg-red-50 h-1/2">
      <img
        :src="book.image"
        class="w-full h-full object-fit"
      >
    </div>
    <div class="flex flex-col items-start w-full h-full p-1 p-2 space-y-2">
      <span class="text-lg">{{ book.title }}</span>
      <span class="text-sm text-gray-500">{{ book.subtitle }}</span>
    </div>
  </div>
</template>

<script>

export default {
  name: 'BookCard',
  props: {
    book: { type: Object, required: true },
  },
};
</script>