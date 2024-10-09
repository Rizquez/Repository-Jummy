<script setup>
import Footer from '@/components/Footer.vue';
</script>

<template>
  <main>
    <div class="container-general">
      <p class="txt-3vw">Configuracion</p>
      <router-link to="/configuration" class="btn-config txt-2vw">Tipo de cuenta</router-link>
      <router-link to="/configuration" class="btn-config txt-2vw">Perfil Cliente</router-link>
      <router-link to="/configuration" class="btn-config txt-2vw">Eliminar Cuenta</router-link>
    </div>
    <div class="container-salir-volver">
      <router-link to="/company-menu" class="btn-salir txt-1-5vw">Volver</router-link>
      <router-link to="/company" class="btn-salir txt-1-5vw">Salir</router-link>
    </div>
    <Footer/>
  </main>
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

.container-salir-volver {
  display: flex;
  max-width: 25%;
  padding: 50px 0px 20px 0px;
  justify-content: space-between;
  margin: 0 auto; 
}

.btn-salir {
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
  text-align: right;
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
