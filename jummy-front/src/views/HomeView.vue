<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import Footer from '@/components/Footer.vue';

const { loginWithRedirect } = useAuth0();

const handleLogin = () => {
  loginWithRedirect();
};
</script>

<template>
  <main>
    <section class="container-general space-top">
      <div>
        <img src="../assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
        <div class="div-space">
          <button @click="handleLogin" class="btn-loggin txt-2vw">Acceder a Jummy</button>
        </div>
        <div class="container-link">
          <router-link :to="{ name: 'client-register' }" class="txt-registro txt-1-5vw">Registrarse como cliente</router-link>
          <router-link :to="{ name: 'company-register' }" class="txt-registro txt-1-5vw">Registrarse como empresa</router-link>
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

section {
  padding-top: 50px;
}

.div-space {
  padding: 30px 30px;
}
</style>