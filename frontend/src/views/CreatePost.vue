<template>
  <v-container class="text-center mt-6">
    <v-card>
      <v-container>
        <div
          class="purple lighten-5 text-center font-weight-bold display-2 title-top"
        >
          <span>{{ $t('createPost') }}</span>
        </div>
        <v-row align="center" justify="center">
          <v-col cols="12" sm="10" md="10">
            <v-text-field label="Title" v-model="title" outlined></v-text-field>
          </v-col>

          <v-col cols="12" sm="10" md="10">
            <v-textarea label="Content" v-model="content" outlined></v-textarea>
          </v-col>
        </v-row>
        <v-row align="center" justify="center">
          <v-btn color="success" @click="post">{{ $t('post') }}</v-btn>
        </v-row>
      </v-container>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      title: '',
      content: ''
    };
  },
  methods: {
    post() {
      this.$axios
        .post(
          'http://localhost:3000/api/posts',
          {
            title: this.title,
            content: this.content
          },
          {
            headers: {
              Authorization: `Bearer ${this.$store.getters['token/getToken']}`
            }
          }
        )
        .then(response => {
          this.$alertify.success(response.data.message);
          this.$router.push('/feed');
        })
        .catch(error => {
          this.$alertify.error(error.response.data.errors);
        });
    }
  },
  props: {}
};
</script>

<style scoped>
p {
  margin: 5px;
  padding: 5px;
}
.title-top {
  padding: 10px;
}
</style>
