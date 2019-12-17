import Vue from "vue";
import VueI18n from "vue-i18n";
import enMessage from "./en.json";
import viMessage from "./vi.json";

Vue.use(VueI18n);

const messages = {
  "en": enMessage,
  "vi": viMessage
}

const i18n = new VueI18n({
  locale: "en",
  messages,
  fallbackLocale: "en"
});

export default new VueI18n(i18n);
