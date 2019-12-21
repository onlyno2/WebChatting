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
        <v-list-item to="/about">
          <v-list-item-content>{{ $t('about') }}</v-list-item-content>
        </v-list-item>
        <v-list-item to="/contact">
          <v-list-item-content>{{ $t('contact') }}</v-list-item-content>
        </v-list-item>
        <v-list-item to="/about">
          <v-list-item-content>{{ $t('signup') }}</v-list-item-content>
        </v-list-item>
        <v-list-item to="/about">
          <v-list-item-content>{{ $t('signin') }}</v-list-item-content>
        </v-list-item>
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
        <v-btn flat text to="/">
          {{ $t('home') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn flat text to="/about">
          {{ $t('about') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn flat text to="/contact">
          {{ $t('contact') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn flat text to="/about">
          {{ $t('signup') }}
        </v-btn>
      </v-toolbar-items>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn flat text to="/about">
          {{ $t('signin') }}
        </v-btn>
      </v-toolbar-items>
    </v-toolbar>
  </div>
</template>
<script>
export default {
  mounted() {
    console.log(this.$t('home'));
  },
  data() {
    return {
      appTitle: 'Web Chatting',
      sidebar: false
    };
  }
};
</script>
