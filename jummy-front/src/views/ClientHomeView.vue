<script setup>
import HeaderHome from '@/components/HeaderHome.vue';
import Footer from '@/components/Footer.vue';
</script>

<template>
  <main>
    <HeaderHome/>
    <section class="container-general">
      <img src="../assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
      <div>
        <input type="text" placeholder="Usuario" class="styled-input txt-2vw"/>
        <br/>
        <input type="password" placeholder="Contraseña" class="styled-input txt-2vw"/>
        <br><br>
        <div class="div-space">
          <router-link :to="{ name: 'client-gastronomy' }" class="btn-loggin txt-2vw" >Ingresar</router-link>
        </div>
        <br><br><br>
        <div class="container-link">
          <router-link :to="{ name: 'client-register' }" class="txt-registro txt-1-5vw">Registrarse como cliente</router-link>
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