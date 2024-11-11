<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { fetchWithTimeout } from '@/stores/utils';
import Footer from '@/components/Footer.vue';
import HeaderClient from '@/components/HeaderClient.vue';
import AlertModal from '@/components/AlertModal.vue';

const modalMessage = ref('');
const isModalVisible = ref(false);

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}

const router = useRouter();
async function redirectToRestaurant(type) {
    try {
        const response = await fetchWithTimeout('http://127.0.0.1:5000/find-restaurants', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ gastronomia: type })
        }, 10000);

        if (response.status === 200) {
            const data = await response.json();
            const restaurantes = data.data; 
            router.push({
                name: 'client-restaurant',
                params: { type },
                query: { restaurantes: JSON.stringify(restaurantes) }
            });
        } else if (response.status === 500) {
            modalMessage.value = `No se han obtenido datos de la gastronomia indicada\n(${response.statusText}) 🛠️`;
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
        <HeaderClient/>
        <section>
            <div class="contenedor-scroll">
                <button @click="redirectToRestaurant('japonesa')" class="boton-gastronomia txt-1-5vw" id="japonesa">JAPONESA</button>
                <button @click="redirectToRestaurant('italiana')" class="boton-gastronomia txt-1-5vw" id="italiana">ITALIANA</button>
                <button @click="redirectToRestaurant('espanola')" class="boton-gastronomia txt-1-5vw" id="española">ESPAÑOLA</button>
                <button @click="redirectToRestaurant('venezolana')" class="boton-gastronomia txt-1-5vw" id="venezolana">VENEZOLANA</button>
                <button @click="redirectToRestaurant('mexicana')" class="boton-gastronomia txt-1-5vw" id="mexicana">MEXICANA</button>
                <button @click="redirectToRestaurant('tailandesa')" class="boton-gastronomia txt-1-5vw" id="tailandesa">TAILANDESA</button>
            </div>
        </section>
        <Footer/>
        <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
    </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

#japonesa {
    background-image: url(@/assets/images/gastronomy/japonesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}

#italiana {
    background-image: url(@/assets/images/gastronomy/italiana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#española {
    background-image: url(@/assets/images/gastronomy/espanola.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#venezolana {
    background-image: url(@/assets/images/gastronomy/venezolana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#mexicana {
    background-image: url(@/assets/images/gastronomy/mexicana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#tailandesa {
    background-image: url(@/assets/images/gastronomy/tailandesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}
</style>