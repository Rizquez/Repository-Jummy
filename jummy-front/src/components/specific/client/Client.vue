<script setup>
import HeaderHome from '@/components/common/HeaderHome.vue';
import Footer from '@/components/common/Footer.vue';
</script>

<template>
  <HeaderHome/>
  <section class="container-general">
    <img src="../../../assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
    <div>
      <input type="text" placeholder="Usuario" class="styled-input txt-2vw"/>
      <br/>
      <input type="password" placeholder="Contraseña" class="styled-input txt-2vw"/>
      <br><br>
      <div class="div-space">
        <router-link to="/gastronomy" class="btn-loggin txt-2vw" >Ingresar</router-link>
      </div>
      <br><br><br>
      <div class="container-link">
        <router-link to="/register-client" class="txt-registro txt-1-5vw">Registrarse como cliente</router-link>
        <router-link to="/password-recovery" class="txt-registro txt-1-5vw">Olvide mi contraseña</router-link>
      </div>
    </div>
  </section>
  <Footer :show-return="true"/>
</template>

<style scoped>
@import '@/assets/styles/common/common.css';
@import '@/assets/styles/common/home.css';
@import '@/assets/styles/common/fonts.css';
</style>
