<script setup>
</script>

<template>
    <div class="container-general">
    <div class="button-container">
      <h2>Configuracion</h2>
      <router-link to="/" class="btn-config">Tipo de cuenta</router-link>
      <router-link to="/" class="btn-config">Perfil Cliente</router-link>
      <router-link to="/" class="btn-config">Eliminar Cuenta</router-link>
    </div>
    <br>
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

.button-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-left: 15%;
  gap: 50px; 
}

h2{
    color: var(--text-300);
    font-size: 40px;
}

.btn-config {
  color: var(--text-100);
  background-color: var(--primary-100);
  font-size: 3vw; 
  padding: 15px 100px; 
  border: none;
  cursor: pointer;
  border-radius: 50px;
  text-decoration: none;
  border: 5px solid var(--text-300);
  width: 70%;
  text-align: center;
  
}

</style>