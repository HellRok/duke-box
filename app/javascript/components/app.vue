<template>
  <div id='app'>
    <p>{{ message }}</p>
    <router-link to="/test">Go to Test</router-link>
    <router-view></router-view>
  </div>
</template>

<script>
  import VueRouter from 'vue-router'
  import Test from '../components/test.vue'

  const routes = [
    { path: '/test', component: Test }
  ];

  const router = new VueRouter({ routes: routes });

  export default {
    router: router,
    data: function () {
      return {
        message: "Welcome to Cinematronix!"
      }
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
