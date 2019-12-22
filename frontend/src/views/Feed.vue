<template>
  <div>
    <v-container>
      <v-row
        v-for="(post, index) in posts"
        :key="index"
        align="center"
        justify="center"
      >
        <post-card
          :post="post.attributes"
          :userId="parseInt(post.relationships.user.data.id)"
          :postId="parseInt(post.id)"
        ></post-card>
      </v-row>
      <infinite-loading @infinite="infiniteHandler"></infinite-loading>
    </v-container>
  </div>
</template>

<script>
import PostCard from '@/components/PostCard';
export default {
  data() {
    return {
      page: 0,
      posts: []
    };
  },
  components: {
    PostCard
  },
  methods: {
    infiniteHandler($state) {
      this.$axios
        .get(`http://localhost:3000/api/posts?page=${this.page}`, {
          headers: {
            Authorization: `Bearer ${this.$store.getters['token/getToken']}`
          }
        })
        .then(response => {
          if (response.data.data.length > 0) {
            this.$store.commit('posts/APPEND_POST', response.data.data);
            this.posts = this.posts.concat(response.data.data);

            $state.loaded();
            this.page++;
          } else {
            $state.complete();
          }
        })
        .catch(error => {
          this.$alertify.error(error.response.data.errors);
        });
    },
    beforeMount() {
      console.log(`Bearer ${this.$store.getters['token/getToken']}`);
    }
  }
};
</script>

<style></style>
