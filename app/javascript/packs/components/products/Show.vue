<template>
  <div>
    <div v-if="productEmpty">
      <Loader />
    </div>
    <div class="show-product" v-else>
      <Product :product="product" />
      <br />
      <br />
      <div class="descr">
        <div class="category">
          <label>
            Category:
          </label>
          {{category}}
        </div>
        <div v-if="underSale" class="sale-text">
          <label>
            Sale Text:
          </label>
          {{saleText}}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Product from './SharedProduct'
import Loader from '../common/Loader'

export default {
  beforeCreate: function () {
    var id = this.$route.params.id
    this.$store.dispatch('getProduct', id)
  },

  components: {
    Product,
    Loader
  },

  computed: {
    product: function () {
      return this.$store.getters.product
    },

    productEmpty: function () {
      var id = parseInt(this.$route.params.id)
      var result = this.product.id !== id
      return result
    },

    category: function () {
      return this.product.attributes.category
    },

    saleText: function () {
      return this.product.attributes.sale_text
    },

    underSale: function () {
      return this.product.attributes.under_sale
    }
  }
}
</script>

<style lang="scss" scoped>
  @import 'src/assets/stylesheets/products/show.scss';
</style>
