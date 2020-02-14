<template>
  <b-button size="" variant="warning" @click="clickButton">
    {{title}}
  </b-button>
</template>

<script>
export default {
  data () {
    return {}
  },

  props: [
    'title'
  ],

  methods: {
    clickButton: function () {
      this.$emit('method')
    }
  }
}
</script>
