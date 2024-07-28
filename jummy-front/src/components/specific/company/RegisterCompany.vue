<script setup>
</script>

<template>
  <header>
    <h1 class="txt-2vw">Formulario de registro para empresas</h1>
  </header>
  <form>
    <div class="input-group">
      <input type="text" placeholder="Nombre fiscal"/>
      <input type="text" placeholder="CIF/NIF"/>
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
    <div class="input-group">
      <select name="gastronomia">
        <option value="" disabled selected>Gastronomía</option>
        <option value="japonesa">Japonesa</option>
        <option value="italiana">Italiana</option>
        <option value="espanola">Española</option>
        <option value="venezolana">Venezolana</option>
        <option value="mexicana">Mexicana</option>
        <option value="tailandesa">Tailandesa</option>
      </select>
      <input type="text" placeholder="Restaurante (Nombre Comercial)"/>
    </div>
    <textarea placeholder="Descripción del restaurante" maxlength="250"></textarea>
    <label for="file-upload" class="custom-file-upload">Subir logo del restaurante</label>
    <input id="file-upload" type="file" accept="image/*" class="input-img"/>
    <div class="div-button">
      <button type="submit" class="form-button txt-1vw">Registrar empresa</button>
      <router-link to="/company" class="form-button txt-1vw">Volver</router-link>
    </div>
  </form>
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

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

form textarea {
  height: 70px;
  resize: none;
}

form textarea,
form input[type="file"],
form input[type="text"],
form input[type="email"],
form input[type="password"],
.input-group select,
.input-group input[type="text"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
}

.input-group {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.custom-file-upload {
  display: flex;
  padding: 12px;
  cursor: pointer;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  background-color: white;
  margin-bottom: 3%;
  font-weight: lighter;
}

.form-button {
  color: var(--text-100);
  background-color: var(--primary-100);
  font-weight: bold;
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
}

.input-img {
  display: none;
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
