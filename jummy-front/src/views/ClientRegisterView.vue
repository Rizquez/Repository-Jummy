<script setup>
import { reactive } from 'vue';
import Footer from '@/components/Footer.vue';
import { validateNumber } from '@/stores/utils';

const formData = reactive({
  nombre: '',
  apellidos: '',
  email: '',
  direccion: '',
  localidad: '',
  cp: 0,
  telefono: 0,
  password: ''
})

const submitForm = () => {
  const data = Object.keys(formData).reduce((acc, key) =>{
    acc[key] = formData[key]
    return acc
  }, {})
  console.log(data);
}

const handleInput = (event) => {
  validateNumber(event);
};
</script>

<template>
  <main>
    <header>
    <h1 class="txt-2vw">Formulario de registro para clientes</h1>
    </header>
    <div class="form-center">
      <form @submit.prevent="submitForm">
        <div class="input-group">
          <input type="text" placeholder="Nombre" required/>
          <input type="text" placeholder="Apellidos" required/>
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
        <div class="div-button">
          <button type="submit" class="form-button txt-1vw">Registrarme</button>
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
</style>
