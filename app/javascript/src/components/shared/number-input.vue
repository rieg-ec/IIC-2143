<template>
  <base-input
    :label="label"
    :error="error"
    :description="description"
    :required="required"
  >
    <template #input>
      <div
        class="flex flex-row justify-between w-full overflow-hidden rounded-xl"
        :class="variantClass"
      >
        <div
          @click="substract"
          class="btn"
          :class="variantClassBtn"
        >
          -
        </div>
        <div class="flex items-center justify-center text-xl font-normal">
          {{ counter }}
        </div>
        <div
          @click="add"
          class="btn"
          :class="variantClassBtn"
        >
          +
        </div>
      </div>
    </template>
  </base-input>
</template>

<script>
import BaseInput from './base-input';

export default {
  name: 'NumberInput',
  inheritAttrs: false,
  props: {
    max: { type: Number, default: () => 0 },
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
  data() {
    return {
      counter: 0,
    };
  },
  methods: {
    add() {
      if (this.max && this.counter > this.max) return;

      this.counter++;
    },
    substract() {
      if (this.counter < 1) return;
      this.counter--;
    },
  },
  components: {
    BaseInput,
  },
  computed: {
    variantClass() {
      const classes = {
        'white': 'bg-white border-2 border-black',
        'gray': 'bg-gray-50',
        'red': 'bg-white border-2 border-red-500',
      };

      return classes[this.variant];
    },
    variantClassBtn() {
      const classes = {
        'white': 'bg-black text-white',
        'gray': 'bg-black text-white',
        'red': 'bg-red-500 text-white',
      };

      return classes[this.variant];
    },
  },
  watch: {
    counter: {
      immediate: true,
      handler() {
        this.$emit('input', this.counter);
      },
    },
  },
};
</script>

<style scoped>
.btn {
  @apply px-5 py-1 outline-none text-xl cursor-pointer select-none font-semibold;
}
</style>
