<template>
  <v-col md="8">
    <v-card class="mx-auto" color="blue darken-3" dark max-width="600">
      <v-card-title class="white--text">
        <v-avatar>
          <img src="https://cdn.vuetifyjs.com/images/john.jpg" alt="John" />
        </v-avatar>
        <v-btn text @click="redirectToUserProfile">
          <span class="display-1 ml-3 font-weight-bold">{{ post.name }}</span>
        </v-btn>
      </v-card-title>

      <v-card-text class="title text-left white--text">
        <p class="headline font-weight-bold">{{ post.title }}</p>
        {{ post.content }}
      </v-card-text>

      <v-card-actions class="white--text">
        <v-list-item class="grow">
          <v-row align="center" justify="end">
            <v-btn text>
              <v-icon class="mr-1">mdi-thumb-up-outline</v-icon>
              <span class="subheading mr-2">{{ post.like }}</span>
            </v-btn>
            <span class="mr-1">·</span>
            <v-btn text>
              <v-icon class="mr-1">mdi-thumb-down-outline</v-icon>
              <span class="subheading">{{ post.dislike }}</span>
            </v-btn>
          </v-row>
        </v-list-item>
      </v-card-actions>
    </v-card>
  </v-col>
</template>

<script>
export default {
  data() {
    return {};
  },
  props: {
    post: {
      type: Object
    }
  },
  methods: {
    redirectToPost() {
      this.$router.push({ name: 'home' });
    },
    redirectToUserProfile() {
      console.log(this.post);
      this.$router.push({
        name: 'profile',
        params: { id: this.post.relationships.user.data.id }
      });
    }
  }
};
</script>

<style></style>
