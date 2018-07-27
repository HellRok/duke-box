<template>
  <div class="md-card-media-cover" :class="coverClasses">
    <slot />
    <div class="md-card-backdrop" :style="coverStyles" v-if="mdTextScrim" ref="backdrop"></div>
  </div>
</template>

<script>
  // This is one big dirty hack to not trigger CORS issues due to loading the
  // image in a canvas
  export default {
    name: 'MdCardMediaCoverOverride',
    props: {
      mdTextScrim: Boolean,
      mdSolid: Boolean
    },
    data: () => ({
      backdropBackground: {}
    }),
    computed: {
      coverClasses () {
        return {
          'md-text-scrim': this.mdTextScrim,
          'md-solid': this.mdSolid
        }
      },
      coverStyles () {
        return {
          background: this.backdropBackground
        }
      }
    },
    methods: {
      applyScrimColor (darkness) {
        if (this.$refs.backdrop) {
          this.backdropBackground = `linear-gradient(to bottom, rgba(0, 0, 0, 0) 20%, rgba(0, 0, 0, ${darkness / 2}) 66%, rgba(0, 0, 0, ${darkness}) 100%)`
        }
      },
      applySolidColor (darkness) {
        let area = this.$el.querySelector('.md-card-area')

        if (area) {
          area.style.background = `rgba(0, 0, 0, ${darkness})`
        }
      }
    },
    mounted () {
      const applyBackground = (darkness = 0.6) => {
        if (this.mdTextScrim) {
          this.applyScrimColor(darkness)
        } else if (this.mdSolid) {
          this.applySolidColor(darkness)
        }
      }
    }
  }
</script>

<style lang="scss">
  .md-card-media-cover {
    position: relative;
    color: #fff;

    &.md-solid {
      .md-card-area {
        background-color: rgba(#000, .54);
      }
    }

    &.md-text-scrim {
      .md-card-backdrop {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 1;
      }
    }

    .md-card-area {
      display: flex;
      flex-direction: column;
      position: absolute;
      right: 0;
      bottom: 0;
      left: 0;
      z-index: 2;
    }

    .md-card-header {
      display: flex;
      flex-direction: column;

      + .md-card-actions {
        padding-top: 0;
      }
    }

    .md-subhead {
      opacity: 1;
    }

    .md-card-header,
    .md-card-actions {
      .md-button:not(.md-primary):not(.md-accent) {
        color: #fff !important;

        &.md-icon-button {
          .md-icon {
            color: #fff !important;
          }
        }
      }
    }
  }
</style>
