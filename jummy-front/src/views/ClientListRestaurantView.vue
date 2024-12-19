<script setup>
import { ref, computed, watch, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { fetchWithTimeout } from '@/stores/utils';
import HeaderClient from '@/components/HeaderClient.vue'
import Footer from '@/components/Footer.vue';
import AlertModal from '@/components/AlertModal.vue';

const route = useRoute()
const router = useRouter();
const type = computed(() => route.params.type)
const restaurantes = ref([]);
const modalMessage = ref('');
const isModalVisible = ref(false);

const images = import.meta.glob('@/assets/images/gastronomy/*.jpg', { eager: true })
const imageUrl = computed(() => {
  return images[`/src/assets/images/gastronomy/${type.value}.jpg`]?.default
})

const loadRestaurants = () => {
  const storedRestaurantes = sessionStorage.getItem('restaurantes');
  if (storedRestaurantes) {
    restaurantes.value = JSON.parse(storedRestaurantes);
  }
};

onMounted(() => {
  loadRestaurants();
});

watch([type, () => route.query.reload], () => {
  loadRestaurants();
});

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}

async function redirectToMenuRestaurant(nombre_restaurante) {
    try {
      const response = await fetchWithTimeout('https://api-jummy.onrender.com/find-dishes', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ nombre_comercial: nombre_restaurante })
      }, 10000);

      if (response.status === 200) {
        const data = await response.json();
        const platos = data.data; 
        sessionStorage.setItem('platos', JSON.stringify(platos));
        sessionStorage.setItem('nombre_restaurante', nombre_restaurante);
        router.push({ name: 'menu-restaurant', params: { nombre_comercial: nombre_restaurante } });
      } else if (response.status === 500) {
        modalMessage.value = `No se ha obtenido la carta sobre el restaurante indicado`;
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
    <HeaderClient :show-return="true"/>
    <div class="contenedor-scroll">
      <button v-if="imageUrl" class="boton-gastronomia txt-1-5vw" :style="{ backgroundImage: `url(${imageUrl})` }">{{ type.toUpperCase() }}</button>
    </div>
    <div class="lista-restaurantes">
      <div v-for="(restaurante, index) in restaurantes" :key="index" id="restaurante" class="info-restaurante">
        <div class="container-info">
          <div>
            <p class="txt-1vw">{{ restaurante.nombre_comercial }}</p>
            <p class="txt-1vw">{{ restaurante.descripcion }}</p>
          </div>
          <img src="@/assets/images/dishes/restaurante.png" alt="Imagen plato"/>
        </div>
        <button @click="redirectToMenuRestaurant(restaurante.nombre_comercial)" class="btn-carta txt-1vw">Ver carta</button>
      </div>
    </div>
    <Footer/>
    <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
  </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

.lista-restaurantes {
  display: flex;
  flex-direction: column;
  max-width: 70%;
  margin: 0 auto;
  gap: 30px;
}

.info-restaurante {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 20px;
}

.info-restaurante img {
  width: 15%;
  height: auto;
}

.container-info {
  display: flex;
  justify-content: space-between;
}

.btn-carta {
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
}
</style>

