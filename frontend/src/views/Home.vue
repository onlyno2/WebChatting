<template>
  <div>
    <div class="bg d-flex">
      <div class="container text-center my-auto">
        <h1 class="mb-1 font-weight-black display-3 indigo--text">
          Web Chatting
        </h1>
        <h3 class="mb-5 font-italic title">
          <em>{{ $t('webTitle') }}</em>
        </h3>
        <div class="my-2">
          <v-btn large color="primary" v-if="!loggedIn" to="/login">{{
            $t('joinNow')
          }}</v-btn>
        </div>
        <div class="my-2">
          <v-btn large color="primary" v-if="loggedIn" to="/feed">{{
            $t('feed')
          }}</v-btn>
        </div>
      </div>
      <div class="overlay"></div>
    </div>

    <v-card class="pa-2 mt-auto" outlined tile>
      <v-btn text large color="error" @click="changeLocale('vi')">Vi</v-btn>
      <v-btn text large color="success" @click="changeLocale('en')">En</v-btn>
    </v-card>
  </div>
</template>

<script>
import i18n from '@/plugins/locales/i18n.js';
export default {
  name: 'home',
  components: {},
  methods: {
    changeLocale(locale) {
      localStorage.setItem('locale', locale);
      i18n.locale = locale;
    }
  },
  computed: {
    loggedIn() {
      return !!this.$store.getters['token/getToken'];
    }
  }
};
</script>

<style scoped>
.bg {
  min-height: 50rem;
  position: relative;
  display: table;
  width: 100%;
  height: auto;
  padding-top: 8rem;
  padding-bottom: 8rem;
  background: linear-gradient(
      90deg,
      rgba(255, 255, 255, 0.1) 0%,
      rgba(255, 255, 255, 0.1) 100%
    ),
    url('https://images.unsplash.com/photo-1472289065668-ce650ac443d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80');
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
