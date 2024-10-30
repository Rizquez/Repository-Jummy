<script>
export default {
  name: 'App'
}
</script>

<template>
  <div id="app">
    <router-view v-slot="{ Component }" :key="$route.fullPath">
      <transition name="fade" mode="out-in" appear>
        <component :is="Component" />
      </transition>
    </router-view>
  </div>
</template>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
</style>
