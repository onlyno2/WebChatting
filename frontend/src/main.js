import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import axios from "axios";
import regeneratorRuntime from "regenerator-runtime";
import Vuetify from "vuetify";

Vue.use(Vuetify);
export default new Vuetify({});
Vue.use(regeneratorRuntime);
Vue.config.productionTip = false;
Vue.prototype.$axios = axios;

new Vue({
  router,
  store,
  axios, 
  vuetify: new Vuetify(),
  render: h => h(App)
}).$mount("#app");
