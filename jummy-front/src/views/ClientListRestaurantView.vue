<script setup>
import { ref, computed, watch, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import HeaderClient from '@/components/HeaderClient.vue'
import Footer from '@/components/Footer.vue';

const route = useRoute()
const type = computed(() => route.params.type)
const restaurantes = ref([]);

const images = import.meta.glob('@/assets/images/gastronomy/*.jpg', { eager: true })
const imageUrl = computed(() => {
  return images[`/src/assets/images/gastronomy/${type.value}.jpg`]?.default
})

const loadRestaurants = () => {
  const storedData = sessionStorage.getItem('restaurantes');
  if (storedData) {
    restaurantes.value = JSON.parse(storedData);
  }
};
onMounted(() => {
  loadRestaurants();
});

watch([type, () => route.query.reload], () => {
  loadRestaurants();
});
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
          <img src="@/assets/images/temp/plato-lujo.jpeg" alt="Imagen plato"/>
        </div>
        <router-link :to="{ name: 'menu-restaurant', params: { nombre_comercial: restaurante.nombre_comercial } }" class="btn-carta txt-1vw">Ver carta</router-link>
      </div>
    </div>
    <Footer/>
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
  padding-bottom: 30px;
}

.info-restaurante {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 10px 20px 30px 20px;
}

.info-restaurante img {
  width: 50%;
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

