<script setup>
import Footer from '@/components/common/Footer.vue';
</script>

<template>
  <div class="btn-volver-container">
    <router-link to="/company-menu" class="btn-volver txt-1-5vw">Volver</router-link>
  </div>
  <div class="container-general">
    <p class="txt-3vw">Configuracion</p>
    <router-link to="/configuration" class="btn-config txt-2vw">Tipo de cuenta</router-link>
    <router-link to="/configuration" class="btn-config txt-2vw">Perfil Cliente</router-link>
    <router-link to="/configuration" class="btn-config txt-2vw">Eliminar Cuenta</router-link>
  </div>
  <Footer/>
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

.container-general {
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
  margin: 0 auto;
  gap: 50px;
  max-width: 70%;
}

.btn-volver-container {
  display: flex;
  justify-content: flex-end;
  max-width: 70%;
  padding-top: 60px;
}

.btn-volver {
  color: var(--primary-300);
  text-decoration: none;
}


.btn-config {
  color: var(--text-100);
  background-color: var(--primary-100); 
  padding: 15px 100px; 
  border: none;
  cursor: pointer;
  border-radius: 50px;
  text-decoration: none;
  text-align: center;
}
</style>