<script setup>
</script>

<template>
  <div class="btn-volver-container">
    <router-link to="/company" class="btn-volver txt-1-5vw">Salir</router-link>
  </div>
  <div class="container-general">
    <img src="../../../assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
    <div class="button-container">
      <router-link to="/company-menu" class="btn-loggin txt-2vw">Modificar Carta</router-link>
      <router-link to="/company-menu" class="btn-loggin txt-2vw">Ver Carta</router-link>
    </div>
  </div>
  <div class="container-config">
    <router-link to="/configuration" class="btn-config txt-1-5vw">Configuracion</router-link>
  </div>
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

.btn-volver-container {
  display: flex;
  justify-content: flex-end;
  max-width: 83%;
  padding-top: 60px;
}

.btn-volver {
  color: var(--primary-300);
  text-decoration: none;
}

.container-general {
  display: flex;
  justify-content: space-evenly;
  margin: 0 auto;
  padding-top: 150px;
}

.container-general img {
  width: 25%;
  max-width: 25%;
  height: auto;
}

.button-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 50px;
}

.btn-loggin {
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 15px 100px; 
  border: none;
  cursor: pointer;
  border-radius: 50px;
  text-decoration: none;
}

.container-config {
  max-width: 83%;
  text-align: right;
}

.btn-config {
  color: var(--text-300);
  cursor: pointer;
  text-decoration: none;
}
</style>
