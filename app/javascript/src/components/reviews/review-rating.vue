<template>
  <div
    class="flex flex-row items-center justify-center text-yellow-600 space-x-3"
    :class="textSize"
  >
    <span class="font-bold">{{ average }}</span>
    <div class="flex flex-row items-center">
      <font-awesome-icon
        v-for="index in starCount.full"
        :key="index + 'full'"
        :icon="['fas', 'star']"
      />
      <font-awesome-icon
        v-if="starCount.half"
        :icon="['fas', 'star-half-alt']"
      />
      <font-awesome-icon
        v-for="index in starCount.empty"
        :key="index + 'empty'"
        :icon="['far', 'star']"
      />
    </div>
    <span>({{ localReviews.length }})</span>
  </div>
</template>

<script>

export default {
  name: 'ReviewRating',
  props: {
    reviews: { type: Array, required: true },
    textSize: { type: String, default: 'text-sm' },
  },
  computed: {
    starCount() {
      const full = Math.floor(this.average);
      const half = this.average - full > 0 ? 1 : 0;
      const empty = 5 - (full + half);

      return { full, half, empty };
    },
    localReviews() {
      return this.reviews.map((review) => {
        if (review.hasOwnProperty('attributes')) {
          return { ...review, ...review.attributes };
        }

        return review;
      });
    },
    average() {
      if (!!this.localReviews.length) {
        return Math.round(
          10 * this.localReviews
            .map(review => review.rating)
            .reduce((prev, current) => prev + current) / this.localReviews.length,
        ) / 10;
      }

      return 0;
    },
  },
};
</script>
