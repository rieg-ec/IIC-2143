<template>
  <div class="flex flex-col items-center w-full py-12 bg-white rounded-lg shadow space-y-6">
    <h1 class="text-3xl font-medium text-red-500">
      Crear Clase
    </h1>
    <form
      class="flex flex-col items-center w-64 space-y-4 sm:w-96"
      @submit.prevent="createLecture"
    >
      <short-text-input
        class="w-full"
        variant="gray"
        label="Titulo"
        v-model="title"
      />
      <long-text-input
        class="w-full"
        label="Descripción"
        variant="gray"
        :required="false"
        v-model="description"
      />
      <file-input
        accept="video/mp4"
        @upload="handleFile"
      >
        <div class="w-full py-10 text-center border-2 border-gray-400 border-dashed rounded">
          {{ video ? video.name : 'Video de la clase' }}
        </div>
      </file-input>
      <button
        type="submit"
        class="w-full py-2 main-btn-custom"
      >
        {{ loading ? 'Cargando...' : 'Crear' }}
      </button>
    </form>
  </div>
</template>

<script>
import lectureApi from '../../api/lectures';
import ShortTextInput from '../shared/short-text-input.vue';
import LongTextInput from '../shared/long-text-input.vue';
import FileInput from '../shared/file-input.vue';

export default {
  name: 'LectureForm',
  components: { ShortTextInput, FileInput, LongTextInput },
  props: {
    course: { type: Object, required: true },
  },
  data() {
    return {
      loading: false,
      title: '',
      description: '',
      video: null,
    };
  },
  methods: {
    handleFile(file) {
      this.video = file;
    },
    async createLecture() {
      if (!this.validInputs) {
        return alert('Debe llenar los campos obligatorios');
      }

      try {
        this.loading = true;
        await lectureApi.create(this.course.id, this.form);
        window.location.href = `/courses/${this.course.id}`;
      } catch (e) {
        alert('Hubo un error. Intentalo de nuevo.');
      } finally {
        this.loading = false;
      }
    },
  },
  computed: {
    form() {
      const form = new FormData();
      form.append('lecture[title]', this.title);
      form.append('lecture[description]', this.description);
      form.append('lecture[video]', this.video);

      return form;
    },
    validInputs() {
      return !!this.title && !!this.video;
    },
  },
};
</script>
