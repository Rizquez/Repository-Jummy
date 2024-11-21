<script setup>
import { ref, onMounted, computed } from 'vue'
import HeaderClient from '@/components/HeaderClient.vue'
import Footer from '@/components/Footer.vue';
import Dish from '@/components/Dish.vue';
import AlertModal from '@/components/AlertModal.vue';

const platos = ref([])
const nombre_restaurante = ref('')
const comanda = ref([]);
const modalMessage = ref('');
const isModalVisible = ref(false);

const loadRestaurants = () => {
  const storedPlatos = sessionStorage.getItem('platos');
  const storedNombreRestaurante = sessionStorage.getItem('nombre_restaurante');
  if (storedPlatos) {
    platos.value = JSON.parse(storedPlatos);
  }

  if (storedNombreRestaurante) {
    nombre_restaurante.value = storedNombreRestaurante;
  }
};

onMounted(() => {
  loadRestaurants();
});

const total = computed(() => {
  return comanda.value.reduce((sum, plato) => {
    return sum + parseFloat(plato.precio || 0);
  }, 0);
});

const filterDish = (tipo) => {
  return platos.value.filter((plato) => plato.tipo_plato === tipo);
};

const addDishMenu = (plato) => {
  comanda.value.push(plato);
};

const handleOrder = () => {
  if (comanda.value.length === 0) {
    modalMessage.value = 'Debe agregar al menos un producto a la comanda para realizar el pedido 😕';
    isModalVisible.value = true;
  } else {
    modalMessage.value = 'La comanda ha sido enviada correctamente, gracias por confiar en Jummy 😎';
    isModalVisible.value = true;
    comanda.value = [];
  }
};

const handleModalClose = () => {
  isModalVisible.value = false
  window.location.reload()
}
</script>

<template>
    <main>
        <HeaderClient :show-return="true"/>
        <div>
            <h1 class="titulo-menu txt-3vw">{{ nombre_restaurante }}</h1>
        </div>
        <div class="container-general">
            <div class="container-menu">
                <div class="container-dish">
                    <h2 class="txt-1-5vw">Entrantes</h2>
                    <div class="lista-platos">
                        <Dish v-for="(plato, index) in filterDish('Entrantes')" :key="index" :plato="plato" @add="addDishMenu" />
                    </div>
                </div>
                <div class="container-dish">
                    <h2 class="txt-1-5vw">Principales</h2>
                    <div class="lista-platos">
                        <Dish v-for="(plato, index) in filterDish('Principales')" :key="index" :plato="plato" @add="addDishMenu" />
                    </div>
                </div>
                <div class="container-dish">
                    <h2 class="txt-1-5vw">Postres</h2>
                    <div class="lista-platos">
                        <Dish v-for="(plato, index) in filterDish('Postres')" :key="index" :plato="plato" @add="addDishMenu" />
                    </div>
                </div>
                <div class="container-dish">
                    <h2 class="txt-1-5vw">Bebidas</h2>
                    <div class="lista-platos">
                        <Dish v-for="(plato, index) in filterDish('Bebidas')" :key="index" :plato="plato" @add="addDishMenu" />
                    </div>
                </div>
            </div>
            <div class="container-comanda">
                <h2 class="txt-2vw">Comanda</h2>
                <div v-for="(plato, index) in comanda" :key="index" class="container-plato">
                    <p class="txt-1-5vw">{{ plato.nombre }} {{ plato.precio }}€</p>
                    <span class="txt-1-5vw" @click="comanda.splice(index, 1)">🗑️</span>
                </div>
                <p class="txt-1-5vw">Total: {{ total }}€</p>
                <button class="btn-realizar-pedido txt-1vw" @click="handleOrder">Realizar pedido</button>
            </div>
        </div>
        <Footer/>
        <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
    </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';

.titulo-menu {
    font-weight: bolder;
    text-decoration: underline;
    text-align: center;
    padding: 40px;
}

.container-general {
    display: flex;
    flex-direction: row;
    gap: 3%;
}

.container-comanda {
    width: 28%;
}

.container-comanda h2 {
    padding-left: 0px;
}

.container-menu {
    max-width: 65%;
    border-right: 3px solid var(--primary-300);
}

.container-dish {
    display: flex;
    flex-direction: column;
    padding: 0px 50px 50px 50px;
}

.container-plato {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
}

h2 {
    color: var(--primary-300);
    margin: 0px;
    text-decoration: underline;
    padding-bottom: 15px;
    padding-left: 10px;
    font-weight: lighter;
}

.lista-platos {
    display: flex;
    flex-direction: column;
    gap: 30px;
}

.btn-realizar-pedido {
    color: var(--text-100);
    background-color: var(--primary-100);
    padding: 10px 35px;
    border: none;
    cursor: pointer;
    border-radius: 30px;
    text-decoration: none;
}

span {
    cursor: pointer;
}
</style>