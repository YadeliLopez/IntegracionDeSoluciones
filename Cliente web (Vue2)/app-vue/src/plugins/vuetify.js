import Vue from "vue";
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css";
import "@mdi/font/css/materialdesignicons.css";
//import 'vue-toast-notification/dist/theme-bootstrap.css'
import VueSession from "vue-session";

Vue.use(Vuetify);
Vue.use(VueSession);
//Vue.use(VueToast)

const opts = {}

export default new Vuetify(opts)