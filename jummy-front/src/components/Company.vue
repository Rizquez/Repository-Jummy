<script setup>
</script>

<template>
  <header class="container-general">
    <router-link to="/company" class="nav-link">Cuenta Profesional</router-link>
    <router-link to="/" class="nav-link">Cuenta Cliente</router-link>
  </header>
  <section class="container-general">
    <img src="/public/logo-jummy.png" alt="Logo Jummy"/>
    <div>
      <input type="text" placeholder="NIF/CIF" class="styled-input"/>
      <br/>
      <input type="password" placeholder="Contraseña" class="styled-input"/>
      <br><br>
      <div class="div-space">
        <router-link to="/company-menu" class="btn-loggin">Ingresar</router-link>
      </div>
      <br><br><br>
      <div class="container-link">
        <router-link to="/register-company" class="txt-registro">Registrarse como empresa</router-link>
        <router-link to="/password-recovery" class="txt-registro">Olvide mi contraseña</router-link>
      </div>
    </div>
  </section>
</template>

<style scoped>
header{
  padding-top: 3%;
  padding-bottom: 3%;
  padding-right: 1.6%;
}

section div {
  text-align: center;
}

section img {
  width: 30%;
  height: auto;
}

.btn-loggin {
  color: var(--text-100);
  background-color: var(--primary-100);
  font-size: 2vw;
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
}

section div input {
  display: flex;
  flex-direction: column;
}

.txt-registro {
  font-size: 1.5vw;
  color: var(--text-100);
  font-weight: lighter;
}

.container-general {
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin-top: 20px;
}

.nav-link {
  font-size: 2vw;
  color: var(--accent-100);
  text-decoration: none;
}

.container-link {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.styled-input {
  font-size: 2vw;
  text-align: center;
  padding: 10px 35px;
  margin: 10px 0;
  border: 5px solid var(--primary-300);
  border-radius: 30px;
  background-color: transparent;
}

.div-space {
  padding: 20px;
}
</style>
