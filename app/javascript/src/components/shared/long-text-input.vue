<template>
  <base-input
    :label="label"
    :error="error"
    :description="description"
    :required="required"
  >
    <template #input>
      <textarea
        v-bind="$attrs"
        v-on="inputListeners"
        class="w-full px-3 py-2 text-sm leading-tight text-gray-700 rounded appearance-none"
        :class="variantClass"
        rows="4"
      />
    </template>
  </base-input>
</template>

<script>

import BaseInput from './base-input';

export default {
  name: 'LongTextInput',
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
