<script setup>
import { ref } from 'vue';
import Footer from '@/components/Footer.vue';
import AlertModal from '@/components/AlertModal.vue';
import { validateNumber } from '@/stores/utils';

const modalMessage = ref('');
const isModalVisible = ref(false);

const formData = ref({
  cif: '',
  nombre_fiscal: '',
  direccion_fiscal: '',
  localidad: '',
  codigoPostal: '',
  telefono: '',
  email: '',
  nombre_comercial: '',
  descripcion: '',
  password: '',
  gastronomia: ''
});

const handleSubmit = (event) => {
  event.preventDefault();

  formData.value.telefono = formData.value.pais + formData.value.numeroTelefono;
  
  const data = {
    cif: formData.value.cif,
    nombre_fiscal: formData.value.nombre_fiscal,
    direccion_fiscal: formData.value.direccion_fiscal,
    localidad: formData.value.localidad,
    cp: formData.value.codigoPostal,
    telefono: formData.value.telefono,
    email: formData.value.email,
    nombre_comercial: formData.value.nombre_comercial,
    descripcion: formData.value.descripcion,
    logo: null,
    password: formData.value.password,
    gastronomia: formData.value.gastronomia
  };

  console.log(data)

  fetch('http://127.0.0.1:5000/restaurante', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
  .then(response => {
    if (response.status === 201){
      modalMessage.value = "Restaurante creado correctamente 📑"
    } else if (response.status === 409){
      modalMessage.value = "El restaurante ya se encuentra registrado ⛔"
    } else if (response.status === 500){
      modalMessage.value = `Los datos no se han podido registrar\n(${response.statusText}) 🛠️`
    } else {
      modalMessage.value = `Error inesperado en el servidor\n${response.statusText} 🛠️`
    }
    isModalVisible.value = true
  })
  .catch((error) => {
    console.error('unexpected error:', error);
    modalMessage.value = "Error inesperado durante la solicitud"
    isModalVisible.value = true
  });
};

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}

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
      <form @submit="handleSubmit">
        <div class="input-group">
          <input type="text" v-model="formData.nombre_fiscal" placeholder="Nombre fiscal" required/>
          <input type="text" v-model="formData.cif" placeholder="CIF/NIF" required/>
        </div>
        <input type="text" v-model="formData.direccion_fiscal" placeholder="Dirección" required/>
        <div class="input-group">
          <input type="text" v-model="formData.localidad" placeholder="Localidad" required/>
          <input type="text" v-model="formData.codigoPostal" @input="handleInput" placeholder="Código Postal" required/>
        </div>
        <div class="input-group">
          <select name="Pais" v-model="formData.pais" class="codigopais" required>
            <option value="" disabled selected>País</option>
            <option value="+34">+34 (España)</option>
            <option value="+39 ">+39 (Italia)</option>
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
        <div class="input-group">
          <select name="gastronomia" v-model="formData.gastronomia" class="gastronomia" required>
            <option value="" disabled selected>Gastronomía</option>
            <option value="japonesa">Japonesa</option>
            <option value="italiana">Italiana</option>
            <option value="espanola">Española</option>
            <option value="venezolana">Venezolana</option>
            <option value="mexicana">Mexicana</option>
            <option value="tailandesa">Tailandesa</option>
          </select>
          <input type="text" v-model="formData.nombre_comercial" placeholder="Restaurante (Nombre Comercial)" required/>
        </div>
        <textarea v-model="formData.descripcion" placeholder="Descripción del restaurante" maxlength="250" required></textarea>
        <label for="file-upload" class="custom-file-upload">Subir logo del restaurante</label>
        <input id="file-upload" type="file" accept="image/*" class="input-img"/>
        <div class="div-button">
          <button type="submit" class="form-button txt-1vw">Registrar empresa</button>
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
