<template>
  <md-app>
    <md-app-toolbar class="md-primary" ref="menubar">
      <div class="md-toolbar-row">
        <div class="md-toolbar-section-start">
          <router-link to="/">
            <span class="md-title">Duke Box</span>
          </router-link>
        </div>
      </div>
    </md-app-toolbar>

    <md-app-content>
      <router-view></router-view>
    </md-app-content>
  </md-app>
</template>

<script>
  import Vue from 'vue/dist/vue.esm.js'
  import VueRouter from 'vue-router'
  import VueMaterial from 'vue-material'
  import UUID4 from 'uuid/v4'

  Vue.use(VueMaterial)

  import Home from '../components/home.vue'
  import Room from '../components/room.vue'
  import Display from '../components/display.vue'

  const routes = [
    { path: '/', component: Home },
    { path: '/rooms/:id', component: Room },
    { path: '/rooms/:id/display', component: Display }
  ];

  const router = new VueRouter({ routes: routes });

  export default {
    router: router,
    data: function () {
      return {
      }
    },
    created: function() {
      if (window.localStorage.uuid === undefined) {
        window.localStorage.uuid =  UUID4();
      }
    }
  }
</script>

<style scoped>
  .md-app-content {
    margin: 0;
    padding: 0;
  }

  .md-card {
    margin: 0 auto;
  }
</style>
