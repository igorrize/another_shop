<template>
  <div>
    <div class="drop-down per-page">
      <b-dropdown id="ddown1" :text="perPageText()" class="m-md-2">
        <b-dropdown-item @click="setPerPage(15)">15</b-dropdown-item>
        <b-dropdown-item @click="setPerPage(30)">30</b-dropdown-item>
        <b-dropdown-item @click="setPerPage(50)">50</b-dropdown-item>
        <b-dropdown-item @click="setPerPage(100)">100</b-dropdown-item>
      </b-dropdown>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    perPage: {
      get: function () {
        return this.$store.getters.perPage.toString()
      },

      set: function (perPageVal) {
        this.$store.dispatch('getProductsList', {
          currentPageVal: this.$store.getters.currentPage,
          perPageVal: perPageVal
        })
      }
    }
  },

  methods: {
    setPerPage: function (perPageVal) {
      this.perPage = perPageVal
    },

    perPageText: function () {
      return 'Per page: ' + this.perPage
    }
  }
}
</script>

<style lang="scss" scoped>
  @import 'src/assets/stylesheets/common/per_page.scss';
</style>
