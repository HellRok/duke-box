<template>
  <div>
    <loading :active.sync="loading" :is-full-page="true"></loading>
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
        jsonApi.create('room', { owner_uuid: window.localStorage.uuid}).then((data) => {
          _this.$router.push('/rooms/' + data.data.id);
        });
      },
      redirectToRoom() {
        jsonApi.findAll('room', { 'local': 1 }).then((response) => {
          if (response.data.length > 0) {
            this.$router.push('/rooms/' + response.data[0].id);
          } else {
            this.createRoom();
          }
        })
      }
    },
    created: function() {
      this.redirectToRoom();
    }
  }
</script>

<style scoped></style>
