<script setup>
</script>

<template>
  <header class="container-general">
    <router-link :to="{ name: 'company-home' }" class="nav-link txt-2vw">Cuenta Profesional</router-link>
    <router-link :to="{ name: 'client-home' }" class="nav-link txt-2vw">Cuenta Cliente</router-link>
  </header>
</template>

<style scoped>
@import '@/assets/styles/common.css';
@import '@/assets/styles/fonts.css';

header{
  padding-top: 3%;
  padding-bottom: 3%;
  padding-right: 1.6%;
}

.nav-link {
  color: var(--accent-100);
  text-decoration: none;
}
</style>
