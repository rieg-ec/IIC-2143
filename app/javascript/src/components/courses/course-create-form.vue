<template>
  <div class="flex flex-col items-center w-full py-12 bg-white rounded-lg shadow space-y-6">
    <h1 class="text-3xl font-medium text-red-500">
      Crear curso
    </h1>
    <form
      class="flex flex-col items-center w-64 space-y-4 sm:w-96"
      @submit.prevent="createCourse"
      action="/courses"
      method="post"
      enctype="multipart/form-data"
    >
      <short-text-input
        class="w-full"
        variant="gray"
        label="Nombre"
        v-model="name"
      />
      <base-input
        :label="'Categoria'"
        class="w-full"
      >
        <template #input>
          <select
            v-model="selectedCategory"
            class="w-full py-2 rounded shadow focus:outline-red bg-gray-50"
          >
            <option
              v-for="(category, index) in categories"
              :key="index"
              :value="category"
              class="capitalize"
            >
              {{ category }}
            </option>
          </select>
        </template>
      </base-input>
      <number-input
        v-model="duration"
        class="w-full"
        label="Duración del curso (semanas)"
        variant="red"
      />
      <label
        for="background"
        class="w-full py-10 text-center border-2 border-gray-400 border-dashed rounded cursor-pointer"
      >
        {{ background ? background.name : 'Foto de curso' }}
      </label>
      <input
        type="file"
        class="hidden"
        id="background"
        accept="image/jpeg, image/png"
        @change="saveFile($event)"
      >

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
import courseApi from '../../api/courses';
import ShortTextInput from '../shared/short-text-input.vue';
import BaseInput from '../shared/base-input.vue';
import NumberInput from '../shared/number-input.vue';

export default {
  name: 'CourseCreateForm',
  components: { ShortTextInput, BaseInput, NumberInput },
  props: {
    categories: { type: Array, required: true },
  },
  data() {
    return {
      name: '',
      description: '',
      duration: 1,
      selectedCategory: this.categories[0],
      background: '',
      loading: false,
    };
  },
  methods: {
    // eslint-disable-next-line
    async createCourse() {
      if (
        !this.name ||
        !this.selectedCategory ||
        !this.background ||
        !this.duration
      ) {
        return alert('Debe llenar todos los campos');
      }
      try {
        this.loading = true;
        await courseApi.create(this.form);
        window.location.href = '/users/profile';
      } catch (e) {
        alert('Hubo un error. Intentalo de nuevo.');
      } finally {
        this.loading = false;
      }
    },
    saveFile(event) {
      this.background = event.target.files[0];
    },
  },
  computed: {
    endDate() {
      const now = new Date();
      now.setDate(now.getDate() + this.duration * 7);

      const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

      return now.toLocaleDateString('en-US', options);
    },
    form() {
      const form = new FormData();
      form.append('course[name]', this.name);
      form.append('course[category]', this.selectedCategory);
      form.append('course[background]', this.background);
      form.append('course[end_date]', this.endDate);

      return form;
    },
  },
};
</script>
