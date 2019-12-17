<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <HelloWorld msg="Welcome to Your Vue.js App" />
    <VFacebookLogin app-id="480114589280370" @login="test"></VFacebookLogin>
    <img
      src="https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1615965675211633&height=50&width=50&ext=1577870214&hash=AeQGmQqVLwBozM86"
      alt="asd"
    />
    <v-btn text large color="error">Hello</v-btn>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";
import { VFBLogin as VFacebookLogin } from "vue-facebook-login-component";

export default {
  name: "home",
  components: {
    HelloWorld,
    VFacebookLogin
  },
  methods: {
    test(res) {
      console.log(res);
      this.$axios
        .post(
          "http://localhost:3000/auth/facebook_login",
          { credential: res },
          {}
        )
        .then(response => {
          this.$store.commit('token/TOKEN', response.data.data);
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
