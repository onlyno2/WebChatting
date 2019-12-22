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
import 'bootstrap-css-only/css/bootstrap.min.css'
import 'mdbvue/lib/css/mdb.min.css'
import '@fortawesome/fontawesome-free/css/all.min.css';
import * as mdbvue from 'mdbvue';

Vue.use(Vuetify);
export default new Vuetify({});
Vue.use(regeneratorRuntime);
Vue.config.productionTip = false;
Vue.prototype.$axios = axios;
Vue.config.productionTip = false;

Vue.use(InfiniteLoading);
for (const component in mdbvue) {
  Vue.component(component, mdbvue[component])
}

new Vue({
  router,
  store,
  axios,
  vuetify: new Vuetify(),
  i18n,
  alertify,
  render: h => h(App)
}).$mount('#app');
