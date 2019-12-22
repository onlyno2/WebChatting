import Vue from 'vue';
import Vuex from 'vuex';
import token from './modules/token';
import post from './modules/post';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
  },
  mutations: {},
  actions: {},
  modules: {
    token: token,
    posts: post
  }
});
