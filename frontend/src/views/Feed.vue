<template>
  <div>
    <v-container>
      <v-row
        v-for="(post, index) in posts"
        :key="index"
        align="center"
        justify="center"
      >
        <post-card :post="post.attributes"> </post-card>
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
      console.log(`http://localhost:3000/api/posts?page=${this.page}`);
      this.$axios
        .get(`http://localhost:3000/api/posts?page=${this.page}`)
        .then(response => {
          console.log(response.data.data.length);
          if(response.data.data.length > 0) {
            this.$store.commit('posts/APPEND_POST', response.data.data);
            this.posts = this.posts.concat(response.data.data);
            
            $state.loaded();
            this.page++;
          } else {
            $state.complete();
          }
        })
        .catch(error => {
          console.log(error);
        });
    },
  },
  beforeMount() {
  }
};
</script>

<style></style>
