<script setup>
import { ref, onMounted } from 'vue';
import { loadRestaurantes, loadPlatos } from './path/to/your/javascript/file';

const restaurantes = ref([]);
const platos = ref([]);
const isLoading = ref(false);
const errorMessage = ref(null);

const fetchDataFromAPI = async () => {
  isLoading.value = true;
  try {
    restaurantes.value = await loadRestaurantes();
    platos.value = await loadPlatos();
  } catch (error) {
    errorMessage.value = error.message;
  } finally {
    isLoading.value = false;
  }
};

onMounted(() => {
  fetchDataFromAPI();
});
</script>
