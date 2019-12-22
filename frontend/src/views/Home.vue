<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <!-- cái này cho xuống footer -->
    <v-btn large color="error" @click="changeLocale('vi')">Vi</v-btn>
    <v-btn large color="success" @click="changeLocale('en')">En</v-btn>
    <HelloWorld msg="Welcome to Your Vue.js App" />
    <v-btn to="/feed">feed</v-btn>
    <v-btn to="/users/101">test</v-btn>
  </div>
</template>

<script>
// @ is an alias to /src
import i18n from '@/plugins/locales/i18n.js';
import HelloWorld from '@/components/HelloWorld.vue';

export default {
  name: 'home',
  components: {
    HelloWorld
  },
  methods: {
    changeLocale(locale) {
      localStorage.setItem("locale", locale);
      i18n.locale = locale;
    }
  }
};
</script>
