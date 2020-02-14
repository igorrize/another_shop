<template>
  <div class="pagination">
    <b-pagination size="sm" :limit="3" :total-rows="totalRows" v-model="currentPage" :per-page="perPage">
    </b-pagination>
    <div>currentPage: {{currentPage}}</div>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },

  computed: {
    totalRows: function () {
      return this.perPage * this.totalPages
    },

    totalPages: function () {
      return this.$store.getters.totalPages
    },

    perPage: function () {
      return this.$store.getters.perPage
    },

    currentPage: {
      get: function () {
        return this.$store.getters.currentPage
      },

      set: function (currentPage) {
        this.$store.dispatch('getProductsList', {
          currentPageVal: currentPage, perPageVal: this.perPage
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  @import 'src/assets/stylesheets/common/pagination.scss';
</style>
