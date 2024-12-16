<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import { ref, defineProps } from 'vue';
import { useRouter } from 'vue-router';
import { fetchWithTimeout } from '@/stores/utils';
import AlertModal from '@/components/AlertModal.vue';

const router = useRouter();
const searchRestaurant = ref('');
const modalMessage = ref('');
const isModalVisible = ref(false);
const { isAuthenticated, user, isLoading } = useAuth0();
const email = user.value.name;

const props = defineProps({
    showReturn: {
        type: Boolean,
        default: false
    }
});

const { logout } = useAuth0();
const handleLogout = () => {  
    sessionStorage.clear();
    logout({ returnTo: window.location.origin });
};

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}

async function handleSearch() {
    const restaurante = searchRestaurant.value.trim(); 
    if (!restaurante) return; 

    try {
        const response = await fetchWithTimeout('https://api-jummy.onrender.com/find-restaurants', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ nombre_comercial: restaurante })
        }, 10000);

        if (response.status === 200) {
            const data = await response.json();
            const restaurantes = data.data;
            const type = restaurantes[0].gastronomia
            sessionStorage.setItem('restaurantes', JSON.stringify(restaurantes));
            router.push({ name: 'client-restaurant', params: { type }, query: { reload: Date.now() } });
        } else if (response.status === 404) {
            modalMessage.value = `El restaurante solicitado no se encuentra registrado en Jummy`;
            isModalVisible.value = true;
        } else {
            modalMessage.value = `Error inesperado en el servidor\n${response.statusText} 🛠️`;
            isModalVisible.value = true;
        }
    } catch (error) {
        modalMessage.value = error.message.includes('tiempo de espera')
            ? 'La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo más tarde'
            : 'Error inesperado durante la solicitud';
        isModalVisible.value = true;
    }
}

async function obtainAllOrders() {
    try {
        const response = await fetchWithTimeout('https://api-jummy.onrender.com/get-orders', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email_comensal: email })
        }, 10000);
        if (response.status === 200) {
            const data = await response.json();
            const allOrders = data.data;
            sessionStorage.setItem('allOrders', JSON.stringify(allOrders));
            router.push({ name: 'client-orders', query: { reload: Date.now() } });
        } else if (response.status === 500) {
            modalMessage.value = `No se han podido obtener el resumen de los pedidos`;
            isModalVisible.value = true;
        } else {
            modalMessage.value = `Error inesperado en el servidor\n${response.statusText} 🛠️`;
            isModalVisible.value = true;
        }
    } catch (error) {
        modalMessage.value = error.message.includes('tiempo de espera')
            ? 'La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo más tarde'
            : 'Error inesperado durante la solicitud';
        isModalVisible.value = true;
    }
}
</script>

<template>
   <header>
        <div class="contenedor-fijo">
            <img src="@/assets/images/general/img-gastronomy.png" alt="Logo Gastronomias"/>
            <div class="contenedor-general">
                <div class="salir-volver">
                    <p class="boton-salir txt-1-5vw boton-volver" @click="obtainAllOrders">Pedidos</p>
                    <p class="boton-salir txt-1-5vw" @click="handleLogout">Salir</p>
                    <router-link v-if="showReturn" :to="{ name: 'client-gastronomy' }" class="boton-salir txt-1-5vw boton-volver">Volver</router-link>
                </div>
                <div class="contenedor-general">
                    <input v-model="searchRestaurant" class="barra txt-1-5vw" type="text" placeholder="Busca en Jummy" />
                    <button @click="handleSearch" class="boton-buscador txt-1-5vw">Buscar</button>
                </div>
            </div>
        </div>
    </header>
    <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

.contenedor-general {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 100%;
}

.contenedor-fijo {
    display: flex;
    max-width: 70%;
    margin: 0 auto;
    position: sticky;
    z-index: 999;
    background-color: var(--bg-200);
    padding-top: 60px;
    gap: 20%;
}

.contenedor-fijo img {
    width: 30%;
    height: 20%;
    display: flex;
    align-items: flex-start;
}

.boton-volver {
    padding: 30px 0px;
}

.boton-buscador {
    color: var(--text-100);
    background-color: var(--primary-100);
    padding: 10px 35px;
    border: none;
    cursor: pointer;
    border-radius: 30px;
    text-decoration: none;
    margin-top: 30px;
    text-align: center;
}

.barra {
    background-color: var(--bg-300);
    width: calc(boton-buscador);
    border-radius: 10px;
    padding: 10px;
}
</style>