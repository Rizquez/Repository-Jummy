<script setup>
</script>

<template>
    <div class="container-general">
    <img src="/public/logo-jummy.png" alt="Logo Jummy"/>
    <div class="button-container">
      <router-link to="/" class="btn-loggin">Modificar Carta</router-link>
      <router-link to="/" class="btn-loggin">Ver Carta</router-link>
    </div>
    <br>

  </div>
  <div class="container-config">
    <router-link to="/" class="btn-config">Configuracion</router-link>
  </div>
</template>

<style scoped>

.container-general {
  display: flex;
  width: 75%;
  justify-content: space-around;
  align-items: center;
  margin-top: 8%;
  margin-left: 15%; 
}

img {
  width: 40%;
  height: auto;
}

.button-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-left: 15%;
  gap: 50px; /* Añadir espacio entre los botones */
}

.btn-loggin {
  color: var(--text-100);
  background-color: var(--primary-100);
  font-size: 3vw; /* Aumenta el tamaño del texto */
  padding: 15px 100px; /* Aumenta el padding */
  border: none;
  cursor: pointer;
  border-radius: 50px;
  text-decoration: none;
  border: 3px solid var(--text-100);
}

.container-config{
  text-align:right;
  padding-right: 12%;
  padding-top: 4%;
}

.btn-config{
  background-color: var(--bg-200);
  color: var(--text-300);
  cursor: pointer;
  text-decoration: none;
  font-size: 20px;
  padding-bottom: 30px;
  
}
</style>
