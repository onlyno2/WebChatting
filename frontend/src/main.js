import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import axios from 'axios';
import regeneratorRuntime from 'regenerator-runtime';
import Vuetify from 'vuetify';
import i18n from '@/plugins/locales/i18n';
import alertify from '@/plugins/alertify/alertify';
import InfiniteLoading from 'vue-infinite-loading';

Vue.use(Vuetify);
export default new Vuetify({});
Vue.use(regeneratorRuntime);
Vue.config.productionTip = false;
Vue.prototype.$axios = axios;
Vue.config.productionTip = false;

Vue.use(InfiniteLoading);

new Vue({
  router,
  store,
  axios,
  vuetify: new Vuetify(),
  i18n,
  alertify,
  render: h => h(App)
}).$mount('#app');
