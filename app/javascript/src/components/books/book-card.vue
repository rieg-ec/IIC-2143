<template>
  <div
    @click="handleClick"
    class="flex flex-col"
  >
    <img :src="book.image">
    <div class="flex flex-col text-sm space-y-1">
      <span class="text-gray-700">{{ book.title }}</span>
      <span class="text-yellow-700">{{ book.price }}</span>
    </div>
  </div>
</template>

<script>

export default {
  name: 'BookCard',
  props: {
    book: { type: Object, required: true },
  },
  methods: {
    handleClick() {
      window.location.href = this.book.url;
    },
  },
};
</script>

