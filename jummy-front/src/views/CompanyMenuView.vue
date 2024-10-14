<script setup>
import Footer from '@/components/Footer.vue';
</script>

<template>
  <main>
    <div class="btn-volver-container">
      <router-link :to="{ name: 'home' }" class="btn-volver txt-1-5vw">Salir</router-link>
    </div>
    <div class="container-general">
      <img src="@/assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
      <div class="button-container">
        <router-link :to="{ name: 'company-edit-menu' }" class="btn-loggin txt-2vw">Modificar Carta</router-link>
        <router-link :to="{ name: 'company-configuration' }" class="btn-loggin txt-2vw">Configuracion</router-link>
      </div>
    </div>
    <Footer/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';

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

.btn-config {
  color: var(--text-300);
  cursor: pointer;
  text-decoration: none;
}
</style>

