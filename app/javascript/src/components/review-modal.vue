<template>
  <modal
    @cancel="cancelClick"
    @confirm="confirmClick"
    :max-width-class="'sm:max-w-lg'"
  >
    <template #title>
      Dejar un review
    </template>
    <template #body>
      <div class="flex flex-col py-4 space-y-4">
        <textarea
          class="w-full h-64 h-full px-2 pt-4"
          v-model="body"
          placeholder="Deja aqui tu review..."
          rows="4"
        />
        <div class="flex flex-col space-y-2">
          <number-input
            :label="'Qué rating del 1 al 5 le darias al curso?'"
            :required="false"
            :variant="'red'"
            :max="5"
          />
        </div>
      </div>
    </template>
    <template #cancelText>
      Cancelar
    </template>
    <template #confirmText>
      Crear
    </template>
  </modal>
</template>

<script>
import Modal from './shared/modal';
import NumberInput from './shared/number-input.vue';

export default {
  name: 'ReviewModal',
  components: { Modal, NumberInput },
  props: {
    courseId: { type: Number, required: true },
  },
  data() {
    return {
      body: '',
      rating: 5,
    };
  },
  methods: {
    async confirmClick() {
      this.$emit('confirm', this.body, this.rating);
    },
    async cancelClick() {
      this.$emit('cancel');
    },
  },
};
</script>

<style scoped>
</style>
