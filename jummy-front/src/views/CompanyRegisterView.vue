<script setup>
import Footer from '@/components/Footer.vue';
import { validateNumber } from '@/stores/utils';

const handleInput = (event) => {
  validateNumber(event);
};
</script>

<template>
  <main>
    <header>
      <h1 class="txt-2vw">Formulario de registro para empresas</h1>
    </header>
    <div class="form-center">
      <form>
        <div class="input-group">
          <input type="text" placeholder="Nombre fiscal" required/>
          <input type="text" placeholder="CIF/NIF" required/>
        </div>
        <input type="text" placeholder="Dirección" required/>
        <div class="input-group">
          <input type="text" placeholder="Localidad" required/>
          <input type="text" v-model="postalCode" @input="handleInput" placeholder="Código Postal" required/>
        </div>
        <div class="input-group">
          <select name="Pais" class="codigopais" required>
            <option value="" disabled selected>País</option>
            <option value="spain">+34 (España)</option>
            <option value="italia">+39 (Italia)</option>
            <option value="francia">+33 (Francia)</option>
            <option value="portugal">+351 (Portugal)</option>
            <option value="alemania">+49 (Alemania)</option>
            <option value="reinounido">+44 (Reino Unido)</option>
          </select>
          <input type="text" v-model="phoneNumber" @input="handleInput" placeholder="Teléfono" required/>
        </div>
        <div class="input-group">
          <input type="email" placeholder="Correo electrónico" required/>
        </div>
        <div class="input-group">
            <input type="password" placeholder="Contraseña" required/>
            <span class="help-text txt-1vw">Debe contener entre 6 y 8 caracteres alfanuméricos</span>
        </div>
        <div class="input-group">
          <select name="gastronomia" class="gastronomia" required>
            <option value="" disabled selected>Gastronomía</option>
            <option value="japonesa">Japonesa</option>
            <option value="italiana">Italiana</option>
            <option value="espanola">Española</option>
            <option value="venezolana">Venezolana</option>
            <option value="mexicana">Mexicana</option>
            <option value="tailandesa">Tailandesa</option>
          </select>
          <input type="text" placeholder="Restaurante (Nombre Comercial)" required/>
        </div>
        <textarea placeholder="Descripción del restaurante" maxlength="250" required></textarea>
        <label for="file-upload" class="custom-file-upload">Subir logo del restaurante</label>
        <input id="file-upload" type="file" accept="image/*" class="input-img"/>
        <div class="div-button">
          <button type="submit" class="form-button txt-1vw">Registrar empresa</button>
          <router-link :to="{ name: 'home' }" class="form-button txt-1vw">Volver</router-link>
        </div>
      </form>
    </div>
    <Footer/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/register.css';

form textarea {
  height: 70px;
  resize: none;
}

.gastronomia {
  max-width: 30%;
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

.input-img {
  display: none;
}
</style>
