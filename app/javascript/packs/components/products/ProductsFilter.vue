<template>
  <div id="products_filter">
    <div class="sidenav">
      <span class="filters">
        <h3>
          Filters
        </h3>
      </span>
      <span class="categories">
        Categories:
      </span>
      <div class="input">
        <Input placeholder="Enter categoies(',' - separator)" @method="setSearchCategory"/>
      </div>

      <span class="name-like">
        Name like:
      </span>
      <div class="input">
        <Input placeholder="Enter name" @method="setSearchNameLike"/>
      </div>

      <span class="price-more">
        Price more:
      </span>
      <div class="input">
        <Input placeholder="Enter price more" @method="setSearchPriceMore"/>
      </div>

      <span class="price-less">
        Price less:
      </span>
      <div class="input">
        <Input placeholder="Enter price less" @method="setSearchPriceLess"/>
      </div>
    </div>
  </div>
</template>

<script>
import Input from '../form_parts/Input'
import Button from '../form_parts/Button'

export default {
  data () {
    return {
      search: {
        categories: '',
        name_like: '',
        price_less: '',
        price_more: ''
      }
    }
  },

  components: {
    Input,
    Button
  },

  methods: {
    setSearchCategory: function (category) {
      this.search.categories = category
    },

    setSearchNameLike: function (name) {
      this.search.name_like = name
    },

    setSearchPriceMore: function (priceMore) {
      this.search.price_more = priceMore
    },

    setSearchPriceLess: function (priceLess) {
      this.search.price_less = priceLess
    },

    sendFilter: function (filters) {
      this.$store.dispatch('getProductsList', {
        currentPageVal: this.currentPage,
        perPageVal: this.perPage,
        filters: filters
      })
    }
  },

  computed: {
    perPage: function () {
      return this.$store.getters.perPage
    },

    currentPage: function () {
      return this.$store.getters.currentPage
    }
  },

  watch: {
    'search.categories': function () {
      this.sendFilter(this.search)
    },

    'search.name_like': function () {
      this.sendFilter(this.search)
    },

    'search.price_less': function () {
      this.sendFilter(this.search)
    },

    'search.price_more': function () {
      this.sendFilter(this.search)
    }
  }
}
</script>

<style lang="scss" scoped>
  @import 'src/assets/stylesheets/products/products_filter.scss';
</style>
