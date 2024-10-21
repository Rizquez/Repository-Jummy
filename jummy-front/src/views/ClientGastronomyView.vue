<script setup>
import { useRouter } from 'vue-router';
import HeaderClient from '@/components/HeaderClient.vue';
import Footer from '@/components/Footer.vue';
import { ref, onMounted } from 'vue'; //import promesas
import { loadRestaurants } from '@/stores/utils.js'; //import promesas

// Variables promesas
const restaurants = ref([]); 
const isLoading = ref(false); 
const errorMessage = ref(null); 

const router = useRouter();
function redirectToRestaurant(type) {
  router.push({ name: 'client-restaurant', params: { type } });
}
const fetchDataFromAPI = async () => {
  isLoading.value = true;
  try {
    restaurants.value = await loadRestaurants();

  } catch (error) {
    errorMessage.value = error.message;
  } finally {
    isLoading.value = false;
  }
}; //Método promesas

onMounted(() => {
  fetchDataFromAPI();
}); //Método promesas

</script>

<template>
    <main>
      <HeaderClient/>
      <section>
          <div class="contenedor-scroll">
              <button @click="() => redirectToRestaurant('japonesa')" class="boton-gastronomia txt-1-5vw" id="japonesa">JAPONESA</button>
              <button @click="() => redirectToRestaurant('italiana')" class="boton-gastronomia txt-1-5vw" id="italiana">ITALIANA</button>
              <button @click="() => redirectToRestaurant('espanola')" class="boton-gastronomia txt-1-5vw" id="española">ESPAÑOLA</button>
              <button @click="() => redirectToRestaurant('venezolana')" class="boton-gastronomia txt-1-5vw" id="venezolana">VENEZOLANA</button>
              <button @click="() => redirectToRestaurant('mexicana')" class="boton-gastronomia txt-1-5vw" id="mexicana">MEXICANA</button>
              <button @click="() => redirectToRestaurant('tailandesa')" class="boton-gastronomia txt-1-5vw" id="tailandesa">TAILANDESA</button>
          </div>
      </section>
      <Footer/>
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