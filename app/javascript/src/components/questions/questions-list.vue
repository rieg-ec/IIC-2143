<template>
  <div class="flex flex-col w-full h-full space-y-1">
    <div
      v-for="question in questions"
      :key="'question' + question.id"
      @click="$emit('delete-question', question.id)"
      class="flex flex-row p-2 border border-gray-200 rounded space-x-4"
    >
      <div class="flex items-center justify-center">
        <img
          :src="question.author.attributes.avatarUrl"
          class="w-24 rounded-full"
        >
      </div>
      <div class="flex flex-row justify-between w-full space-x-6">
        <div class="flex flex-col">
          <span class="text-lg text-gray-500">{{ question.author.attributes.fullName }}</span>
          <p>{{ question.body }}</p>
        </div>
        <div class="flex flex-col items-end space-y-2 whitespace-nowrap">
          <span class="whitespace-nowrap">{{ question.createdAt }}</span>
          <button
            v-if="currentUserQuestionIds.includes(question.id)"
            @click="$emit('delete-question', question.id)"
            class="secondary-btn"
          >
            Eliminar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'QuestionsList',
  props: {
    currentUser: { type: Object, required: true },
    questions: { type: Array, required: true },
  },
  computed: {
    currentUserQuestionIds() {
      return this.questions
        .filter((question) => question.author.attributes.id === this.currentUser.id)
        .map((question) => question.id);
    },
  },
};
</script>
