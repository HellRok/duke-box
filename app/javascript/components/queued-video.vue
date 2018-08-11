<template>
  <div class="root">
    <loading :active.sync="loading" :is-full-page="false"></loading>
    <md-card>
      <md-card-media-cover-override md-solid>
        <md-card-media md-ratio="4:3">
          <img :src="video.thumbnail" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title">{{ video.title }}</span>
          </md-card-header>

          <md-card-actions v-if="canRemove()">
            <md-button v-on:click="remove()">Remove</md-button>
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover-override>
    </md-card>
  </div>
</template>

<script>
  import VueMaterial from 'vue-material'
  import Loading from 'vue-loading-overlay'
  import MdCardMediaCoverOverride from '../components/md-card-media-cover-override'
  import jsonApi from '../models'

  export default {
    components: {
      MdCardMediaCoverOverride,
      Loading
    },
    props: ['video'],
    data: function() {
      return {
        loading: false
      }
    },
    methods: {
      remove() {
        this.loading = true;
        jsonApi.destroy('video', this.video.id);
      },
      canRemove() {
        if (this.video.room.owner_uuid === window.localStorage.uuid) {
          return true;
        }
        return this.video.creator_uuid === window.localStorage.uuid;
      }
    }
  }
</script>

<style scoped>
  .md-card {
    margin-top: 5px;
  }

  .root {
    position: relative;
  }
</style>

