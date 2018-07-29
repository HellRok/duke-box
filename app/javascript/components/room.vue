<template>
  <div>
    <loading :active.sync="loading" :is-full-page="true"></loading>
    <md-tabs class="md-transparent" md-alignment="fixed">
      <md-tab id="tab-search" md-label="Search">
        <md-card>
          <form @submit.prevent="search">
            <md-card-content>
              <md-field>
                <label>Search</label>
                <md-input v-model="query"></md-input>
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
          :video="video" :key="video.id.videoId"></search-result>
      </md-tab>
      <md-tab id="tab-queue" md-label="Queue">
        QUEUE
      </md-tab>
    </md-tabs>
  </div>
</template>

<script>
  import VueMaterial from 'vue-material'
  import Loading from 'vue-loading-overlay'
  import axios from 'axios'
  import SearchResult from '../components/search-result'
  import jsonApi from '../models'

  export default {
    components: {
      Loading,
      SearchResult
    },
    data: function () {
      return {
        loading: false,
        query: '',
        searchResults: [],
        videoQueue: []
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
      }
    }
  }
</script>

<style scoped></style>
