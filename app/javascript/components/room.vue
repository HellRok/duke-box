<template>
  <div>
    <loading :active.sync="loading" :is-full-page="true"></loading>
    <md-tabs class="md-transparent" md-alignment="fixed">
      <md-tab id="tab-search" md-label="Search">
        <md-card>
          <md-card-content>
            <md-field>
              <label>Search</label>
              <md-input v-model="query"></md-input>
            </md-field>
          </md-card-content>
          <md-card-actions>
            <md-button class="md-primary" v-on:click="search()">
              Search
            </md-button>
          </md-card-actions>
        </md-card>

        <search-result v-for="(video, index) in searchResults"
          :video="video" :key="index"></search-result>
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
        searchResults: [{ id: 'sth' }],
        videoQueue: []
      }
    },
    methods: {
      search() {
        this.loading = true;
        console.log(this.query);
      }
    }
  }
</script>

<style scoped></style>
