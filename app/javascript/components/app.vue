<template>
  <md-app>
    <md-app-toolbar class="md-primary">
      <div class="md-toolbar-row">
        <div class="md-toolbar-section-start">
          <md-button class="md-icon-button" @click="menuVisible = !menuVisible">
            <md-icon>menu</md-icon>
          </md-button>
          <span class="md-title">Duke Box</span>
        </div>
      </div>
    </md-app-toolbar>

    <md-app-drawer :md-active.sync="menuVisible">
      <md-toolbar class="md-transparent" md-elevation="0">
        Navigation
      </md-toolbar>

      <md-list>
        <md-list-item to="/" @click="menuVisible = !menuVisible">
          <md-icon>home</md-icon>
          <span class="md-list-item-text">Home</span>
        </md-list-item>
      </md-list>
    </md-app-drawer>

    <md-app-content>
      <router-view></router-view>
    </md-app-content>
  </md-app>
</template>

<script>
  import Vue from 'vue/dist/vue.esm.js'
  import VueRouter from 'vue-router'
  import VueMaterial from 'vue-material'

  Vue.use(VueMaterial)

  import Home from '../components/home.vue'
  import Room from '../components/room.vue'

  const routes = [
    { path: '/', component: Home },
    { path: '/rooms/:id', component: Room }
  ];

  const router = new VueRouter({ routes: routes });

  export default {
    router: router,
    data: function () {
      return {
        menuVisible: false
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
