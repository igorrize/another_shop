<template>
  <div>
    <b-form-input v-model="inputMsg"
                  type="text"
                  :placeholder="placeholder"
                  :value="value">
    </b-form-input>
  </div>
</template>

<script>
export default {
  data () {
    return {
      inputMsg: ''
    }
  },

  props: [
    'placeholder',
    'inputType',
    'valueDef'
  ],

  computed: {
    value: function () {
      return this.valueDef || ''
    }
  },

  watch: {
    inputMsg: function () {
      this.$emit('method', this.inputMsg)
    }
  }
}
</script>
