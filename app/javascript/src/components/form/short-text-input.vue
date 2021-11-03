<template>
  <BaseInput
    id="email"
    type="email"
    label="email"
    v-model="email"
    class="w-full px-3 py-2 text-sm leading-tight text-gray-700 rounded appearance-none"
  />
</template>

<script>
import BaseInput from './base-input.vue';

export default {
  name: 'ShortTextInput',
  components: {
    BaseInput,
  },
  props: {
    label: {
      type: String,
      default: '',
    },
    description: {
      type: String,
      default: '',
    },
    required: {
      type: Boolean,
      default: true,
    },
  },
  setup() {
    return {
      email: '',
    };
  },
  // v-model:modelValue="email"
};
</script>
