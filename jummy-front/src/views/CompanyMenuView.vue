<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import Footer from '@/components/Footer.vue';

const { logout } = useAuth0();
const handleLogout = () => {
  logout({ returnTo: window.location.origin });
};
</script>

<template>
  <main>
    <div class="btn-volver-container">
      <p class="boton-salir txt-1-5vw" @click="handleLogout">Salir</p>
    </div>
    <div class="container-general">
      <img src="@/assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
      <div class="button-container">
        <router-link :to="{ name: 'company-edit-menu' }" class="btn-loggin txt-2vw">Modificar carta</router-link>
        <router-link :to="{ name: 'company-menu' }" class="btn-loggin txt-2vw">Lista de pedidos (sin uso)</router-link>
      </div>
    </div>
    <Footer/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

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

