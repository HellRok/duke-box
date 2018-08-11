<template>
  <div>
    <loading :active.sync="loading" :is-full-page="true"></loading>

    <md-button class="md-primary md-raised" v-on:click="createRoom()">
      Start a new room
    </md-button>
  </div>
</template>

<script>
  import VueMaterial from 'vue-material'
  import Loading from 'vue-loading-overlay'
  import jsonApi from '../models'

  export default {
    components: {
      Loading
    },
    data: function () {
      return {
        loading: false
      }
    },
    methods: {
      createRoom () {
        this.loading = true;
        var _this = this;
        jsonApi.create('room', { owner_uuid: window.localStorage.uuid}).then(function(data) {
          _this.$router.push('/rooms/' + data.data.id);
        });
      }
    }
  }
</script>

<style scoped></style>
