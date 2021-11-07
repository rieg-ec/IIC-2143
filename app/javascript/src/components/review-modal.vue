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
      <div class="py-4">
        <textarea
          class="w-full h-64 h-full px-2 pt-4"
          v-model="body"
          placeholder="Deja aqui tu review..."
          rows="4"
        />
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
import reviewsApi from '../api/reviews.js';

export default {
  name: 'ReviewModal',
  components: { Modal },
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
      try {
        await reviewsApi.create(this.courseId, {
          body: this.body,
          rating: this.rating,
        });
        location.reload();
      } catch (e) {
        console.log(e);
      }
      this.$emit('confirm');
    },
    async cancelClick() {
      alert('cancel');
      this.$emit('cancel');
    },
  },
};
</script>

<style scoped>
</style>
