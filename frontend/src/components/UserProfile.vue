<template>
  <v-card>
    <v-container>
      <div class="purple lighten-5 text-center font-weight-bold display-2 profile">
       <span>PROFILE</span>
      </div>  
      <v-row align="center" justify="center">
        <v-col md="4" class="text-left">
          <v-avatar size="200">
            <img
              v-bind:src="
                data.picture || 'https://cdn.vuetifyjs.com/images/john.jpg'
              "
              alt="John"
            />
          </v-avatar>
        </v-col>
        <v-col md="4" class="text-left">
          <p class="border border-info rounded-pill">{{ data.name }}</p>
          <p class="border border-info rounded-pill">{{ data.email }}</p>
        </v-col>
      </v-row>
      <v-row align="center" justify="center">
        <v-col md="4" class="text-left">
          <p class="font-weight-bold">Like  <v-icon color="blue lighten-2">mdi-thumb-up</v-icon></p>
          <v-avatar color="blue lighten-3" size="200">
            <p class="display-3">{{ data.like }}</p>
          </v-avatar>
        </v-col>
        <v-col md="4" class="text-left">
          <p class="font-weight-bold">Dislike  <v-icon color="red lighten-2">mdi-thumb-down</v-icon></p>
          <v-avatar color="red lighten-3" size="200">
            <p class="display-3">{{ data.dislike }}</p>
          </v-avatar>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {},
  props: {
    data: {
      type: Object
    }
  },
  mounted() {
    console.log(this.data);
  }
};
</script>
  
<style scoped>
p {
    margin: 5px;
    padding: 5px;
  }
.profile {
  padding: 10px;
}
</style>
