<template>
  <div class="flex flex-col w-full h-full space-y-1">
    <div
      v-for="review in computedReviews"
      :key="'review' + review.id"
      class="flex flex-row p-2 border border-gray-200 rounded space-x-4"
    >
      <div class="flex items-center justify-center">
        <img
          :src="review.author.attributes.avatarUrl"
          class="w-24 rounded-full"
        >
      </div>
      <div class="flex flex-row justify-between w-full space-x-6">
        <div class="flex flex-col">
          <div class="flex flex-row space-x-3">
            <span class="text-lg text-gray-500">{{ review.author.attributes.fullName }}</span>
            <div class="flex flex-row items-center space-x-1">
              <font-awesome-icon
                v-for="ratingIndex in review.full"
                :key="ratingIndex + 'full'"
                :icon="['fas', 'star']"
              />
              <font-awesome-icon
                v-if="review.half"
                :key="ratingIndex + 'half'"
                :icon="['fas', 'star-half-alt']"
              />
              <font-awesome-icon
                v-for="ratingIndex in review.empty"
                :key="ratingIndex + 'empty'"
                :icon="['far', 'star']"
              />
            </div>
          </div>
          <p>{{ review.body }}</p>
        </div>
        <div class="flex flex-col items-end space-y-2 whitespace-nowrap">
          <span>{{ review.createdAt }}</span>
          <button
            v-if="currentUserReviewId === review.id"
            @click="$emit('delete-review', review.id)"
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
  name: 'ReviewsList',
  props: {
    currentUser: { type: Object, required: true },
    reviews: { type: Array, required: true },
  },
  computed: {
    currentUserReviewId() {
      const currentUserReview = this.reviews.find((review) => review.author.attributes.id === this.currentUser.id);

      return currentUserReview && currentUserReview.id;
    },
    computedReviews() {
      return this.reviews.map((review) => {
        review.full = Math.floor(review.rating);
        review.half = review.full < review.rating ? 1 : 0;
        review.empty = 5 - review.full;

        return review;
      });
    },
  },
};
</script>
