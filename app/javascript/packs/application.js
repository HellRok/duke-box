import './application.css';
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'
import 'vue-loading-overlay/dist/vue-loading.min.css'

import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import VueYoutube from 'vue-youtube'
import App from '../components/app.vue'

Vue.use(VueRouter);
Vue.use(VueYoutube);

document.addEventListener('DOMContentLoaded', () => {
  new Vue(App).$mount('#app');
});
