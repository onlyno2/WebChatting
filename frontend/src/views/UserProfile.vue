<template>
  <v-container class="text-center">
    <v-col offset="1" md="10">
      <user-profile :data="user" class="mx-auto"> </user-profile>
    </v-col>
  </v-container>
</template>

<script>
import UserProfile from '@/components/UserProfile.vue';
export default {
  data() {
    return {
      user: {}
    };
  },
  components: {
    UserProfile
  },
  methods: {
    fetchUserInformation() {
      this.$axios
        .get('http://localhost:3000/api/users/' + this.$route.params.id)
        .then(response => {
          this.user = response.data.data[0].attributes;
        })
        .catch(error => {
          console.log(error);
        });
      console.log(this.$route.params.id);
    }
  },
  mounted() {
    this.fetchUserInformation();
  }
};
</script>

<style></style>
