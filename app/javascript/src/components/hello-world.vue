<template>
  <div class="flex flex-col text-3xl space-y-12">
    <p>
      {{ message }}
    </p>
    <div class="flex flex-row justify-center space-x-6">
      <button
        @click="decreaseCounter"
        class="btn"
      >
        -
      </button>
      <span>{{ counter }}</span>
      <button
        @click="increaseCounter"
        class="btn"
      >
        +
      </button>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  name: 'HelloWorld',
  setup() {
    const counter = ref(1);
    const message = ref('Hello World desde vue3 :)');

    function increaseCounter() {
      counter.value++;
    }

    function decreaseCounter() {
      if (counter.value) {
        counter.value--;
      }
    }

    return {
      message,
      counter,
      increaseCounter,
      decreaseCounter,
    };
  },
};
</script>

<style scoped>
.btn {
  @apply flex items-center justify-center px-6 text-white bg-blue-500 rounded;
}
</style>
