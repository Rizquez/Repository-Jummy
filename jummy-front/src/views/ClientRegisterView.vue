<script setup>
import Footer from '@/components/Footer.vue';
import { validateNumber } from '@/stores/utils';






/* import { ref } from 'vue';

// Variables reactivas para los datos del formulario
const nombre = ref('');
const apellidos = ref('');
const direccion = ref('');
const localidad = ref('');
const codigoPostal = ref('');
const telefono = ref('');
const correo = ref('');
const contrasena = ref('');
const mensajeError = ref('');

// Función para enviar los datos a la API y guardarlos en la base de datos
async function registerUser() {
  try {
    const response = await fetch('', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        nombre: nombre.value,
        apellidos: apellidos.value,
        direccion: direccion.value,
        localidad: localidad.value,
        codigoPostal: codigoPostal.value,
        telefono: telefono.value,
        correo: correo.value,
        contrasena: contrasena.value
      })
    });
    

    if (response.status === 201) {
    console.log("Registro exitoso");
    mensajeError.value = ''; // Resetea el mensaje de error si el registro es exitoso
  } else if (response.status === 409) {
    mensajeError.value = 'Error: el teléfono o el correo ya están registrados.';
  } else if (response.status === 404) {
    mensajeError.value = 'Error: la URL solicitada no fue encontrada.';
  } else if (response.status === 500) {
    mensajeError.value = 'Error: problema en el servidor. Intente nuevamente más tarde.';
  } else {
    mensajeError.value = 'Error desconocido. Intente nuevamente.';
  }
} catch (error) {
  console.error("Error de conexión", error);
  mensajeError.value = 'Error de conexión. Intente más tarde.';
}
}

// Manejador de envío del formulario
function handleSubmit(event) {
  event.preventDefault();
  registerUser();
} */





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
      <form>
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
