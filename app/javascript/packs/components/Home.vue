<template>
  <div id="app">
    <Header />
    <router-view/>
  </div>
</template>

<script>
import Header from './common/Header'

export default {
  components: {
    Header
  }
}
</script>
