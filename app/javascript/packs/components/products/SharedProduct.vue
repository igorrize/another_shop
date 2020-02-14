<template>
  <div class="product" :class="{ 'sold-out': soldOut }">
    <div class="name">
      <span>
        {{name}}
      </span>
    </div>
    <div class="image">
      <img src="http://placehold.it/350x200" />
    </div>
    <div class="priceTotal" :class="{ 'under-sale': soldOutProduct() }">
      <span v-if="soldOut" class="sold-msg">SOLD</span>
      <span v-else>
        <span v-bind:class="{ underSale: underSale }">
          ${{price}}
        </span>
        <span v-if="underSale" class="salePrice">
          ${{salePrice}}
        </span>
      </span>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },

  props: [
    'product'
  ],

  computed: {
    sold_out: function () {
      return this.product.attributes.sold_out
    },

    name: function () {
      return this.product.attributes.name
    },

    price: function () {
      let price = this.product.attributes.price

      return this.formatPrice(price)
    },

    underSale: function () {
      return this.product.attributes.under_sale
    },

    saleText: function () {
      return this.product.attributes.sale_text
    },

    salePrice: function () {
      let salePrice = this.product.attributes.sale_price

      return this.formatPrice(salePrice)
    },

    soldOut: function () {
      return this.product.attributes.sold_out
    }
  },

  methods: {
    formatPrice: function (price) {
      let priceStr = price.toString()
      let i = priceStr.slice(0, -2)
      let f = priceStr.slice(-2)

      return `${i},${f}`
    },

    soldOutProduct: function () {
      return !this.soldOut && this.underSale
    }
  }
}
</script>

<style lang="scss" scoped>
  @import 'src/assets/stylesheets/products/shared_product.scss';
</style>
