<template>
  <div>
    <loading :active.sync="loading" :is-full-page="true"></loading>

    <md-button class="display-button md-primary" v-on:click="openDisplay">
      Start Display
    </md-button>

    <md-tabs class="md-transparent" md-alignment="fixed">
      <md-tab id="tab-search" md-label="Search">
        <md-card>
          <form @submit.prevent="search">
            <md-card-content>
              <md-field>
                <label>Search</label>
                <!--
                  v-model doesn't work on phones, found this workaround (but
                  had to switch from input to keyup for unkown reasons)

                  https://github.com/vuejs/vue/issues/8231#issuecomment-437359416
                -->
                <md-input v-bind:value="query" v-on:keyup="query=$event.target.value"></md-input>
              </md-field>
            </md-card-content>
            <md-card-actions>
              <md-button type="submit" class="md-primary">
                Search
              </md-button>
            </md-card-actions>
          </form>
        </md-card>

        <search-result v-for="video in searchResults"
          :video="video" :roomId="id" :key="video.id.videoId"></search-result>
      </md-tab>
      <md-tab id="tab-queue" md-label="Queue">
        <queued-video v-for="queuedVideo in videoQueue"
          :video="queuedVideo" :key="queuedVideo.id"></queued-video>
      </md-tab>
    </md-tabs>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueMaterial from 'vue-material'
  import Loading from 'vue-loading-overlay'
  import axios from 'axios'
  import SearchResult from '../components/search-result'
  import QueuedVideo from '../components/queued-video'
  import jsonApi from '../models'

  export default {
    components: {
      Loading,
      SearchResult,
      QueuedVideo
    },
    data: function () {
      return {
        loading: false,
        id: this.$route.params.id,
        query: '',
        searchResults: [],
        videoQueue: [],
        interval: undefined
      }
    },
    methods: {
      search() {
        this.loading = true;
        var _this = this;
        axios.get('/api/v1/search', { params: { query: this.query } }).
          then(function (response) {
            _this.searchResults = response['data']['items'];
            _this.loading = false;
          });
      },
      updateQueue() {
        var _this = this;
        jsonApi.findAll('video', { 'filter[room_id]': this.id, include: 'room' }).then(function(response) {
          _this.videoQueue = response.data;
        })
      },
      checkExists() {
        var _this = this;
        jsonApi.find('room', this.id).catch(function(_) {
          _this.$router.push("/");
        })
      },
      openDisplay() {
        window.open('/#/rooms/' + this.id + '/display', '_blank');
      }
    },
    created: function() {
      this.checkExists();
      this.updateQueue();
      this.interval = setInterval(function() { this.updateQueue(); }.bind(this), 2000);
    },
    beforeDestroy: function() {
      clearInterval(this.interval);
    }
  }
</script>

<style scoped>
  .display-button {
    width: 100%;
  }
</style>
