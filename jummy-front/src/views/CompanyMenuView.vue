<script setup>
import { ref } from 'vue'
import { useAuth0 } from '@auth0/auth0-vue';
import { useRouter } from 'vue-router'
import { fetchWithTimeout } from '@/stores/utils';
import Footer from '@/components/Footer.vue';
import AlertModal from '@/components/AlertModal.vue';

const { isAuthenticated, user, isLoading } = useAuth0();
const email = user.value.name;
const router = useRouter();
const modalMessage = ref('');
const isModalVisible = ref(false);

const { logout } = useAuth0();
const handleLogout = () => {
  logout({ returnTo: window.location.origin });
};

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}

async function redirectToMenuRestaurant() {
    try {
      const response = await fetchWithTimeout('http://127.0.0.1:5000/find-dishes', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: email })
      }, 10000);
      if (response.ok) {
        const data = await response.json();
        const platos = data.data; 
        sessionStorage.setItem('platos', JSON.stringify(platos));
        sessionStorage.setItem('email', email)
        router.push({ name: 'company-edit-menu'});
      } else if (response.status === 500) {
        modalMessage.value = `No se han podido obtener los datos solicitados sobre los platos`;
        isModalVisible.value = true;
      } else {
        modalMessage.value = `Error inesperado en el servidor\n${response.statusText} 🛠️`;
        isModalVisible.value = true;
      }
  } catch (error) {
    modalMessage.value = error.message.includes('tiempo de espera')
      ? 'La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo mas tarde'
      : 'Error inesperado durante la solicitud';
    isModalVisible.value = true;
  }
}
</script>

<template>
  <main>
    <div class="btn-volver-container">
      <p class="boton-salir txt-1-5vw" @click="handleLogout">Salir</p>
    </div>
    <div class="container-general">
      <img src="@/assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
      <div class="button-container">
        <button @click="redirectToMenuRestaurant()" class="btn-loggin txt-2vw">Modificar carta</button>
        <router-link :to="{ name: 'company-menu' }" class="btn-loggin txt-2vw">Lista de pedidos (sin uso)</router-link>
      </div>
    </div>
    <Footer/>
    <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

.btn-volver-container {
  display: flex;
  justify-content: flex-end;
  max-width: 83%;
  padding-top: 60px;
}

.btn-volver {
  color: var(--primary-300);
  text-decoration: none;
}

.container-general {
  display: flex;
  justify-content: space-evenly;
  margin: 0 auto;
  padding-top: 150px;
}

.container-general img {
  width: 25%;
  max-width: 25%;
  height: auto;
}

.button-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 50px;
}

.btn-loggin {
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 15px 100px; 
  border: none;
  cursor: pointer;
  border-radius: 50px;
  text-decoration: none;
}

.btn-config {
  color: var(--text-300);
  cursor: pointer;
  text-decoration: none;
}
</style>

