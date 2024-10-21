<script setup>

import { ref, onMounted } from 'vue';

// Variables de estado
const restaurantes = ref([]);
const platos = ref([]);
const isLoading = ref(false);
const errorMessage = ref(null);

// Función para realizar la petición a la API
const fetchData = async (url) => {
  isLoading.value = true; // Muestra el mensaje de carga
  errorMessage.value = null; // Limpia mensajes de error
  const timeoutDuration = 5000; // 5 segundos de timeout

  try {
    // Timeout para la petición
    const response = await Promise.race([
      fetch(url),
      new Promise((_, reject) => setTimeout(() => reject(new Error('Request timed out')), timeoutDuration))
    ]);

    if (response.ok) {
      const data = await response.json();
      return data;
    } else {
      // Manejo de diferentes códigos de estado HTTP
      switch (response.status) {
        case 404:
          throw new Error('Recurso no encontrado (404)');
        case 401:
          throw new Error('No autorizado (401)');
        case 500:
          throw new Error('Error en el servidor (500)');
        default:
          throw new Error(`Error desconocido (${response.status})`);
      }
    }
  } catch (error) {
    errorMessage.value = error.message;
  } finally {
    isLoading.value = false; // Oculta el mensaje de carga
  }
};

// Función para cargar restaurantes
const loadRestaurantes = async () => {
  const data = await fetchData('https://api-jummy.onrender.com/restaurantes');
  if (data) {
    restaurantes.value = data;
  }
};

// Función para cargar platos
const loadPlatos = async () => {
  const data = await fetchData('https://api-jummy.onrender.com/platos');
  if (data) {
    platos.value = data;
  }
};

// Ejecuta la carga de datos al montar el componente
onMounted(() => {
  loadRestaurantes();
  loadPlatos();
});
</script>

<template>
  <div>
    <div v-if="isLoading">Cargando datos, por favor espera...</div>
    <div v-if="errorMessage">{{ errorMessage }}</div>

    <div v-if="!isLoading && !errorMessage">
      <!-- Vistas de Gastronomías -->
      <h2>Restaurantes</h2>
      <ul>
        <li v-for="restaurante in restaurantes" :key="restaurante.id">
          <h3>{{ restaurante.nombre }}</h3>
          <p>{{ restaurante.gastronomia }}</p>
          <p>{{ restaurante.descripcion }}</p>
          <img :src="restaurante.logo" alt="Logo del restaurante">
        </li>
      </ul>

      <!-- Vistas del Menú -->
      <h2>Menú</h2>
      <ul>
        <li v-for="plato in platos" :key="plato.id">
          <h3>{{ plato.nombre }}</h3>
          <p>{{ plato.descripcion }}</p>
          <p>Ingredientes: {{ plato.ingredientes }}</p>
          <p>Precio: {{ plato.precio }}€</p>
          <img :src="plato.foto" alt="Foto del plato">
        </li>
      </ul>
    </div>
  </div>
</template>
