<template>
  <base-input
    :label="label"
    :error="error"
    :description="description"
    :required="required"
  >
    <template #input>
      <input
        v-bind="$attrs"
        v-on="inputListeners"
        class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-red border-red"
        :class="variantClass"
      >
    </template>
  </base-input>
</template>

<script>
import BaseInput from './base-input';

export default {
  name: 'ShortTextInput',
  inheritAttrs: false,
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
    error: {
      type: String,
      default: null,
    },
    variant: {
      type: String,
      default: 'white',
    },
    required: {
      type: Boolean,
      default: true,
    },
  },
  computed: {
    variantClass() {
      const classes = {
        'white': 'bg-white',
        'gray': 'bg-gray-50',
      };

      return classes[this.variant];
    },
    inputListeners() {
      return {
        ...this.$listeners, input: (event) => this.$emit('input', event.target.value),
      };
    },
  },
};
</script>
