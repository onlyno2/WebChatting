<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <!-- cái này cho xuống footer -->
    <v-btn large color="error" @click="changeLocale('vi')">Vi</v-btn>
    <v-btn large color="success" @click="changeLocale('en')">En</v-btn>
    <HelloWorld msg="Welcome to Your Vue.js App" />
    <VFacebookLogin app-id="480114589280370" @login="test"></VFacebookLogin>
    <img
      src="https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1615965675211633&height=50&width=50&ext=1577870214&hash=AeQGmQqVLwBozM86"
      alt="asd"
    />
  </div>
</template>

<script>
// @ is an alias to /src
import i18n from "@/plugins/locales/i18n.js";
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
          this.$store.commit("token/TOKEN", response.data.data);
        })
        .catch(error => {
          console.log(error);
        });
    },
    changeLocale(locale) {
      i18n.locale = locale;
    }
  }
};
</script>
