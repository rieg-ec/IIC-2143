<template>
  <div class="flex flex-col">
    <label class="block text-lg text-gray-600">
      {{ label }}
      <template v-if="required">
        *
      </template>
    </label>
    <span
      v-if="description"
      class="text-sm text-gray-700"
      v-html="description"
    />
    <div
      class="my-2"
      :class="{'border-red-800 border rounded': error }"
    >
      <slot name="input" />
    </div>
    <span
      v-if="error"
      class="text-sm text-red-800"
    >
      {{ error }}
    </span>
  </div>
</template>

<script>
export default {
  name: 'BaseInput',
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
    required: {
      type: Boolean,
      default: true,
    },
  },
};
</script>
