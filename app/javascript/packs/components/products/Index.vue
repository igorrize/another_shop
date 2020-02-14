<template>
  <div id="products_index">
    <PerPage />
    <ProductsFilter />
    <Pagination />
    <b-container class="bv-example-row products-list">
      <div v-if="productsEmpty">
        <Loader />
      </div>
      <div v-else v-for="product in products" :key="product.id">
        <router-link :to="{ name: 'product', params: { id: product.id }}">
          <Product :product="product"/>
        </router-link>
      </div>
    </b-container>
  </div>
</template>

<script>
import ProductsFilter from './ProductsFilter'
import PerPage from '../common/PerPage.vue'
import Pagination from '../common/Pagination.vue'
import Product from './SharedProduct'
import Loader from '../common/Loader'

export default {
  data () {
    return {
    }
  },

  components: {
    ProductsFilter,
    PerPage,
    Pagination,
    Product,
    Loader
  },

  mounted () {
    this.$store.dispatch('getProductsList')
  },

  computed: {
    products: function () {
      return this.$store.getters.productsList
    },

    productsEmpty: function () {
      var result = this.$store.getters.productsList.length === 0
      return result
    }
  }
}
</script>

<style lang="scss" scoped>
  @import 'src/assets/stylesheets/products/index.scss';
</style>
