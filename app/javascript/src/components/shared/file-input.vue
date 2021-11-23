<template>
  <div class="w-full h-full">
    <label
      for="file"
      class="flex items-center justify-center block w-full h-full cursor-pointer"
    >
      <slot />
    </label>
    <input
      type="file"
      class="hidden"
      id="file"
      :accept="accept"
      @change="saveFile($event)"
    >
  </div>
</template>

<script>
export default {
  name: 'FileInput',
  props: {
    accept: { type: String, default: 'image/jpeg, image/png' },
  },
  methods: {
    saveFile(event) {
      this.$emit('upload', event.target.files[0]);
    },
  },
};
</script>
