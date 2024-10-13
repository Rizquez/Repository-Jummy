<script setup>
import Footer from '@/components/Footer.vue';
</script>

<template>
  <main>
    <header>
    <h1 class="txt-2vw">Formulario de registro para clientes</h1>
    </header>
    <form>
      <div class="input-group">
        <input type="text" placeholder="Nombre"/>
        <input type="text" placeholder="Apellidos"/>
      </div>
      <input type="text" placeholder="Dirección"/>
      <div class="input-group">
        <input type="text" placeholder="Localidad"/>
        <input type="text" placeholder="Código Postal"/>
      </div>
      <div class="input-group">
        <input type="text" placeholder="Teléfono"/>
        <input type="email" placeholder="Correo electrónico"/>
      </div>
      <div class="input-group">
          <input type="password" placeholder="Contraseña"/>
          <span class="help-text txt-1vw">Debe contener entre 6 y 8 caracteres alfanuméricos</span>
      </div>
      <div class="div-button">
        <button type="submit" class="form-button txt-1vw">Registrarme</button>
        <router-link :to="{ name: 'client-home' }" class="form-button txt-1vw">Volver</router-link>
      </div>
    </form>
    <Footer/>
  </main>
</template>

<style scoped>

@import '@/assets/styles/fonts.css';

header {
  padding-top: 2%;
}

header h1 {
  font-weight:lighter;
  text-decoration: underline;
  text-align: center;
  color: var(--text-100);
}

form {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 2%;
  margin: 2%;
}

.input-group {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.input-group input[type="text"],
form input[type="text"],
form input[type="email"],
form input[type="password"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
}

.form-button {
  color: var(--text-100);
  background-color: var(--primary-100);
  font-weight:bold;
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
}

.div-button {
  display: flex;
  justify-content: space-between;
}

.input-group input[type="text"]:nth-child(1) {
  margin-right: 5px;
}

.input-group input[type="text"]:nth-child(2) {
  margin-left: 5px;
}

.help-text {
  color: var(--text-100); 
  padding-left: 10px;
  text-align: center;
}
</style>
