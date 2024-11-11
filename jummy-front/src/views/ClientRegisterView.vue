<script setup>
import { ref } from 'vue';
import Footer from '@/components/Footer.vue';
import AlertModal from '@/components/AlertModal.vue';
import { validateNumber, fetchWithTimeout } from '@/stores/utils';

const modalMessage = ref('');
const isModalVisible = ref(false);

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}

const handleInput = (event) => {
  validateNumber(event);
};

const formData = ref({
  nombre: '',
  apellidos: '',
  direccion: '',
  localidad: '',
  codigoPostal: '',
  pais: '',       
  numeroTelefono: '', 
  telefono: '', 
  email: '',
  password: ''
});

const handleSubmit = (event) => {
  event.preventDefault();

  formData.value.telefono = formData.value.pais + formData.value.numeroTelefono;
  
  const data = {
    nombre: formData.value.nombre,
    apellidos: formData.value.apellidos,
    direccion: formData.value.direccion,
    localidad: formData.value.localidad,
    cp: formData.value.codigoPostal,
    telefono: formData.value.telefono,
    email: formData.value.email,
    password: formData.value.password
  };

  fetchWithTimeout('http://127.0.0.1:5000/build-diner', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  }, 60000)
  .then(response => {
    if (response.status === 201){
      modalMessage.value = "Usuario creado correctamente 📑"
    } else if (response.status === 409){
      modalMessage.value = "El usuario ya se encuentra registrado ⛔"
    } else if (response.status === 500){
      modalMessage.value = `Los datos no se han podido registrar\n(${response.statusText}) 🛠️`
    } else {
      modalMessage.value = `Error inesperado en el servidor\n${response.statusText} 🛠️`
    }
    isModalVisible.value = true
  })
  .catch((error) => {
    modalMessage.value = error.message.includes('tiempo de espera')
    ? 'La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo mas tarde'
    : 'Error inesperado durante la solicitud';
    isModalVisible.value = true;
  });
};
</script>

<template>
  <main>
    <header>
      <h1 class="txt-2vw">Formulario de registro para clientes</h1>
    </header>
    <div class="form-center">
      <form @submit="handleSubmit">
        <div class="input-group">
          <input type="text" v-model="formData.nombre" placeholder="Nombre" required/>
          <input type="text" v-model="formData.apellidos" placeholder="Apellidos" required/>
        </div>
        <input type="text" v-model="formData.direccion" placeholder="Dirección" required/>
        <div class="input-group">
          <input type="text" v-model="formData.localidad" placeholder="Localidad" required/>
          <input type="text" v-model="formData.codigoPostal" @input="handleInput" placeholder="Código Postal" required/>
        </div>
        <div class="input-group">
          <select v-model="formData.pais" name="Pais" class="codigopais" required>
            <option value="" disabled selected>País</option>
            <option value="+34">+34 (España)</option>
            <option value="+39">+39 (Italia)</option>
            <option value="+33">+33 (Francia)</option>
            <option value="+351">+351 (Portugal)</option>
            <option value="+49">+49 (Alemania)</option>
            <option value="+44">+44 (Reino Unido)</option>
          </select>
          <input type="text" v-model="formData.numeroTelefono" @input="handleInput" placeholder="Teléfono" required/>
        </div>
        <div class="input-group">
          <input type="email" v-model="formData.email" placeholder="Correo electrónico" required/>
        </div>
        <div class="input-group">
          <input type="password" v-model="formData.password" placeholder="Contraseña" required/>
          <span class="help-text txt-1vw">Debe contener entre 6 y 8 caracteres alfanuméricos</span>
        </div>
        <div class="div-button">
          <button type="submit" class="form-button txt-1vw">Registrarme</button>
          <router-link :to="{ name: 'home' }" class="form-button txt-1vw">Volver</router-link>
        </div>
      </form>
    </div>
    <Footer/>
    <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/register.css';
</style>
