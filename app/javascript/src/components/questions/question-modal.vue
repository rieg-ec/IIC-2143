<template>
  <modal
    @cancel="cancelClick"
    @confirm="confirmClick"
    :max-width-class="'sm:max-w-lg'"
  >
    <template #title>
      Hacer una pregunta
    </template>
    <template #body>
      <div class="flex flex-col py-4 space-y-4">
        <textarea
          class="w-full h-64 h-full px-2 pt-4"
          v-model="body"
          placeholder="Deja tu pregunta aqui..."
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
import Modal from '../shared/modal';

export default {
  name: 'ReviewModal',
  components: { Modal },
  props: {
    courseId: { type: Number, required: true },
  },
  data() {
    return {
      body: '',
    };
  },
  methods: {
    async confirmClick() {
      this.$emit('confirm', this.body);
    },
    async cancelClick() {
      this.$emit('cancel');
    },
  },
};
</script>
