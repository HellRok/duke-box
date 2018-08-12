<template>
  <div>
    <youtube ref="videoPlayer" v-on:ended="removeFromQueue()"></youtube>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueMaterial from 'vue-material'
  import QueuedVideo from '../components/queued-video'
  import jsonApi from '../models'

  export default {
    components: {
      QueuedVideo
    },
    data: function () {
      return {
        id: this.$route.params.id,
        videoQueue: [],
        interval: undefined,
        playNextVideo: true
      }
    },
    methods: {
      updateQueue() {
        var _this = this;
        jsonApi.findAll('video', { 'filter[room_id]': this.id, include: 'room' }).then(function(response) {
          _this.videoQueue = response.data;
          if (_this.playNextVideo === true) {
            _this.loadNextVideo();
          }
        })
      },
      loadNextVideo() {
        if (this.videoQueue.length === 0) {
          this.playNextVideo =  true;
          return;
        }

        this.playNextVideo = false;
        this.$refs.videoPlayer.player.loadVideoById(
          this.videoQueue[0].youtube_id
        );
      },
      startPolling() {
        this.updateQueue();
        this.interval = setInterval(function() { this.updateQueue(); }.bind(this), 2000);
      },
      removeFromQueue() {
        clearInterval(this.interval);
        var _this = this;
        jsonApi.destroy('video', this.videoQueue[0].id).then(function() {
          _this.playNextVideo = true;
          _this.startPolling();
        });
      }
    },
    created: function() {
      this.startPolling();
    },
    mounted: function() {
      document.querySelector('.md-app-toolbar').classList.add('md-hide');
    },
    beforeDestroy: function() {
      clearInterval(this.interval);
    }
  }
</script>

<style>
</style>

