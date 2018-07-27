<template>
  <div>
    <md-card>
      <md-card-content>
        <md-field>
          <label>Search</label>
        </md-field>
      </md-card-content>
      <md-card-actions>
        <md-button class="md-primary">
          Search
        </md-button>
      </md-card-actions>
    </md-card>
  </div>
</template>

<script>
  import VueMaterial from 'vue-material'

  export default {
    data: function () {
      return {
        video: {}
      }
    }
  }
</script>

<style scoped>
  .md-card {
    margin-top: 5px;
  }
</style>
