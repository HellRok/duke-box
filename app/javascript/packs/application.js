import './application.css';

import Vue from 'vue/dist/vue.js'
import App from '../components/app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: 'app',
    template: '<App/>',
    components: { App }
  })
})
