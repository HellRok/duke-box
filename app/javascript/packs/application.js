import './application.css';

import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import App from '../components/app.vue'

Vue.use(VueRouter);


document.addEventListener('DOMContentLoaded', () => {
  new Vue(App).$mount('#app');
  //new Vue({
  //  el: '#app',
  //  component: App
  //});
});
