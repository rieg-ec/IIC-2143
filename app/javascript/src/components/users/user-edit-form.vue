<template>
  <div class="flex flex-col items-center w-full h-full space-y-12">
    <h2 class="text-2xl">
      Editar perfil
    </h2>
    <form
      @submit.prevent="updateUser"
      class="flex flex-col w-full space-y-4"
    >
      <div class="flex flex-col items-center space-y-8">
        <div class="relative w-32 h-32">
          <img
            ref="avatar"
            :src="user.avatarUrl"
            class="w-full h-full rounded-full bg-red-50"
          >
          <div class="absolute bg-gray-300 rounded-full w-7 h-7 right-2 bottom-2">
            <file-input
              @upload="handleFile"
            >
              <font-awesome-icon
                :icon="['fas', 'pencil-alt']"
              />
            </file-input>
          </div>
        </div>
        <div class="flex flex-col items-center w-full">
          <short-text-input
            class="w-full"
            variant="gray"
            label="Nombre"
            v-model="firstName"
          />
          <short-text-input
            class="w-full"
            variant="gray"
            label="Apellido"
            v-model="lastName"
          />
        </div>
        <button class="main-btn">
          Guardar
        </button>
      </div>
      <div />
    </form>
  </div>
</template>

<script>
import userApi from '../../api/user.js';
import ShortTextInput from '../shared/short-text-input.vue';
import FileInput from '../shared/file-input.vue';

export default {
  name: 'UserEditForm',
  components: { ShortTextInput, FileInput },
  props: {
    user: { type: Object, required: true },
  },
  data() {
    return {
      avatar: null,
      firstName: this.user.firstName,
      lastName: this.user.lastName,
    };
  },
  methods: {
    handleFile(file) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.$refs.avatar.src = event.target.result;
      };

      reader.readAsDataURL(file);
      this.avatar = file;
    },
    async updateUser() {
      try {
        await userApi.update(this.user.id, this.form);
        window.location.href = '/users/profile';
      } catch (e) {
        alert(e);
      }
    },
  },
  computed: {
    form() {
      const form = new FormData();
      form.append('user[first_name]', this.firstName);
      form.append('user[last_name]', this.lastName);
      if (!!this.avatar) form.append('user[avatar]', this.avatar);

      return form;
    },
  },
};
</script>
