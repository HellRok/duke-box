<template>
  <div>
    <md-card>
      <md-card-media-cover-override md-solid>
        <md-card-media md-ratio="4:3">
          <img :src="video.snippet.thumbnails.high.url" />
        </md-card-media>

        <md-card-area>
          <md-card-header>
            <span class="md-title">{{ video.snippet.title }}</span>
          </md-card-header>

          <md-card-actions>
            <md-button v-on:click="add()">Add</md-button>
          </md-card-actions>
        </md-card-area>
      </md-card-media-cover-override>
    </md-card>
  </div>
</template>

<script>
  import VueMaterial from 'vue-material'
  import MdCardMediaCoverOverride from '../components/md-card-media-cover-override'
  import jsonApi from '../models'

  export default {
    components: {
      MdCardMediaCoverOverride
    },
    props: ['video', 'roomId'],
    methods: {
      add() {
        jsonApi.create('video', {
          room_id: this.roomId,
          creator_uuid: '#not-yet-implemented',
          youtube_id: this.video.id.videoId,
          title: this.video.snippet.title,
          thumbnail: this.video.snippet.thumbnails.high.url
        }).then(function(response) {
          console.log(response.data)
        });

      }
    }
  }
</script>

<style scoped>
  .md-card {
    margin-top: 5px;
  }
</style>
