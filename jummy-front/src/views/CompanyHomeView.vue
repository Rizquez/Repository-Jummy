<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import HeaderHome from '@/components/HeaderHome.vue';
import Footer from '@/components/Footer.vue';

const { loginWithRedirect } = useAuth0();

const handleLogin = () => {
  loginWithRedirect({
    appState: { target: '/company-menu' },
  });
};
</script>

<template>
  <main>
    <HeaderHome/>
    <section class="container-general">
      <img src="@/assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
      <div>
        <input type="text" placeholder="NIF/CIF" class="styled-input txt-2vw"/>
        <br/>
        <input type="password" placeholder="Contraseña" class="styled-input txt-2vw"/>
        <br><br>
        <div class="div-space">
          <button @click="handleLogin" class="btn-loggin txt-2vw">Ingresar</button>
          <!-- <router-link :to="{ name: 'company-menu' }" class="btn-loggin txt-2vw">Ingresar</router-link> -->
        </div>
        <br><br><br>
        <div class="container-link">
          <router-link :to="{ name: 'company-register' }" class="txt-registro txt-1-5vw">Registrarse como empresa</router-link>
          <router-link :to="{ name: 'password-recovery' }" class="txt-registro txt-1-5vw">Olvide mi contraseña</router-link>
        </div>
      </div>
    </section>
    <Footer :show-return="true"/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/common.css';
@import '@/assets/styles/home.css';
@import '@/assets/styles/fonts.css';
</style>