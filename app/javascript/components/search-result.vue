<template>
  <div>
    <md-card>
      <md-card-media-cover-override md-solid>
        <md-card-media md-ratio="16:9">
          <img :src="video.snippet.thumbnails.high.url" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title">{{ video.snippet.title }}</span>
          </md-card-header>

          <md-card-actions>
            <md-button>Add</md-button>
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover-override>
    </md-card>
  </div>
</template>

<script>
  import VueMaterial from 'vue-material'
  import MdCardMediaCoverOverride from '../components/md-card-media-cover-override'

  export default {
    components: {
      MdCardMediaCoverOverride
    },
    props: ['video'],
    methods: {
    }
  }
</script>

<style scoped>
  .md-card {
    margin-top: 5px;
  }
</style>
