<template>
  <div class="fixed inset-0 z-10 overflow-y-auto">
    <div class="flex items-end justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
      <div class="fixed inset-0 transition-opacity">
        <div class="absolute inset-0 bg-gray-500 opacity-75" />
      </div>

      <!-- This element is to trick the browser into centering the modal contents. -->
      <span class="hidden sm:inline-block sm:align-middle sm:h-screen" />&#8203;
      <div
        class="inline-block overflow-hidden text-left align-bottom bg-white rounded-lg shadow-xl transition-all transform sm:my-8 sm:align-middle sm:w-full"
        :class="maxWidthClass"
        role="dialog"
        aria-modal="true"
        aria-labelledby="modal-headline"
      >
        <div class="px-4 pt-5 pb-4 bg-white sm:p-6 sm:pb-4">
          <div class="sm:flex sm:items-start">
            <div
              class="flex items-center justify-center flex-shrink-0 w-12 h-12 mx-auto bg-gray-200 rounded-full sm:mx-0 sm:h-10 sm:w-10"
              v-if="!!$slots.icon"
            >
              <slot name="icon" />
            </div>
            <div class="flex-1 mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
              <h3
                class="text-lg font-medium text-gray-900 leading-6"
                id="modal-headline"
              >
                <slot name="title" />
              </h3>
              <div class="mt-2">
                <slot name="body" />
              </div>
            </div>
          </div>
        </div>
        <div class="px-4 py-3 bg-gray-50 sm:px-6 sm:flex sm:flex-row-reverse">
          <template v-if="!loading">
            <span
              class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto"
              v-if="!!$slots.confirmText"
            >
              <button
                @click="confirmClick()"
                class="main-btn"
              >
                <slot name="confirmText" />
              </button>
            </span>
            <span
              class="flex w-full mt-3 rounded-md shadow-sm sm:mt-0 sm:w-auto"
              v-if="!!$slots.cancelText"
            >
              <button
                @click="cancelClick()"
                class="secondary-btn"
              >
                <slot name="cancelText" />
              </button>
            </span>
          </template>
          <template
            v-else
          >
            <span class="text-base">
              Cargando...
            </span>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    maxWidthClass: {
      type: String,
      default: 'sm:max-w-lg',
    },
  },
  data() {
    return { loading: false };
  },
  methods: {
    cancelClick() {
      this.$emit('cancel');
    },
    confirmClick() {
      this.loading = true;
      this.$emit('confirm');
    },
  },
};
</script>
