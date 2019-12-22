<template>
<v-container class="text-center">
    <v-col offset="1">
      <v-card>
    <v-container>
      <div class="purple lighten-5 text-center font-weight-bold display-2 title-top">
       <span>Create post</span>
      </div>  
      <v-row align="center" justify="center">
        <v-col cols="12" sm="10" md="10">
            <v-text-field
              label="Title"
            ></v-text-field>
          </v-col>
  
          <v-col cols="12" sm="10" md="10">
            <v-textarea
              label="Content"
            ></v-textarea>
          </v-col>
      </v-row>
    </v-container>
  </v-card>
    </v-col>
  </v-container>
  
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
.title-top {
  padding: 10px;
}
</style>
