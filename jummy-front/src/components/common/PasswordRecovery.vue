<script setup>
</script>

<template>
  <header>
    <h1 class="txt-3vw">Restablecer la contraseña</h1>
    <h3 class="txt-1-5vw">Por favor confirme su móvil y correo electrónico</h3>
  </header>
  <div class="form-group">
    <form>
      <div class="input-group">
        <input type="text" placeholder="Teléfono"/>
        <input type="email" placeholder="Correo electrónico"/>
      </div>
      <div class="button-group">
        <button type="submit" class="form-button txt-1vw">Restablecer la contraseña</button>
        <router-link to="/" class="form-button txt-1vw">Volver</router-link>
      </div>
    </form>
  </div>
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

header {
  padding-top: 2%;
}

header h1, h3 {
  font-weight: lighter;
  text-align: center;
  color: var(--text-100);
}

form {
  display: inline-block;
  text-align: center;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 2%;
  margin: 2%;
}

form input[type="text"],
form input[type="email"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
}

.input-group {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin-bottom: 10px;
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

.button-group {
  display: flex;
  justify-content: space-between;
  gap: 30px;
}

.form-group {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
