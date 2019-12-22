<template>
  <div>
    <v-navigation-drawer
      v-model="sidebar"
      src="https://cdn.vuetifyjs.com/images/backgrounds/bg-2.jpg"
      dark
      app
    >
      <v-list>
        <v-list-item to="/">
          <v-list-item-content>{{ $t('home') }}</v-list-item-content>
        </v-list-item>
        <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
          <v-btn text to="/feed">
            {{ $t('feed') }}
          </v-btn>
        </v-toolbar-items>
        <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
          <v-btn text to="/myposts">
            {{ $t('myPost') }}
          </v-btn>
        </v-toolbar-items>
        <v-list-item to="/about">
          <v-list-item-content>{{ $t('about') }}</v-list-item-content>
        </v-list-item>
        <v-list-item to="/contact">
          <v-list-item-content>{{ $t('contact') }}</v-list-item-content>
        </v-list-item>
        <v-list-item to="/signup">
          <v-list-item-content v-if="!loggedIn">{{
            $t('signup')
          }}</v-list-item-content>
        </v-list-item>
        <v-list-item to="/login" v-if="!loggedIn">
          <v-list-item-content>{{ $t('signin') }}</v-list-item-content>
        </v-list-item>
        <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
          <v-btn text v-bind:to="userProfileLink">
            {{ $t('profile') }}
          </v-btn>
        </v-toolbar-items>
        <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
          <v-btn text @click="logout">
            {{ $t('logout') }}
          </v-btn>
        </v-toolbar-items>
      </v-list>
    </v-navigation-drawer>

    <v-toolbar
      dark
      src="https://cdn.vuetifyjs.com/images/backgrounds/vbanner.jpg"
      app
    >
      <span class="hidden-sm-and-up">
        <v-app-bar-nav-icon @click="sidebar = !sidebar"></v-app-bar-nav-icon>
      </span>
      <v-toolbar-title>
        <router-link to="/" tag="span" style="cursor: pointer">
          {{ appTitle }}
        </router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn text to="/">
          {{ $t('home') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
        <v-btn text to="/feed">
          {{ $t('feed') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
        <v-btn text to="/myposts">
          {{ $t('myPost') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn text to="/about">
          {{ $t('about') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn text to="/contact">
          {{ $t('contact') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only" v-if="!loggedIn">
        <v-btn text to="/signup">
          {{ $t('signup') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only" v-if="!loggedIn">
        <v-btn text to="/login">
          {{ $t('signin') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
        <v-btn text v-bind:to="userProfileLink">
          {{ $t('profile') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only" v-if="loggedIn">
        <v-btn text @click="logout">
          {{ $t('logout') }}
        </v-btn>
      </v-toolbar-items>
    </v-toolbar>
  </div>
</template>
<script>
export default {
  data() {
    return {
      appTitle: 'Web Chatting',
      sidebar: false
    };
  },
  methods: {
    logout() {
      this.$store.commit('token/LOG_OUT');
    }
  },
  computed: {
    loggedIn() {
      let token = this.$store.getters['token/getToken'];
      return !!token;
    },
    userId() {
      return this.$store.getters['token/getUserId'];
    },
    userProfileLink() {
      return '/users/' + this.$store.getters['token/getUserId'];
    }
  }
};
</script>
