<script>
import { ref } from 'vue';
import { validateNumber, fetchWithTimeout } from '@/stores/utils';
import AlertModal from '@/components/AlertModal.vue';

export default {
  props: {
    plato: {
      type: Object,
      required: true,
    },
  },
  components: {
    AlertModal,
  },
  setup() {
    const modalMessage = ref('');
    const isModalVisible = ref(false);

    const handleModalClose = () => {
      isModalVisible.value = false;
    };

    return {
      modalMessage,
      isModalVisible,
      handleModalClose,
    };
  },
  methods: {
    handleInput(event) {
      validateNumber(event);
    },
    async udpateDishDrink() {
      const data = {
        email: sessionStorage.getItem('email'),
        nombre: this.plato.nombre,
        descripcion: this.plato.descripcion,
        ingredientes: this.plato.ingredientes,
        precio: this.plato.precio,
      };

      try {
        const response = await fetchWithTimeout('http://127.0.0.1:5000/update-dish', {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(data)
        }, 10000);

        if (response.ok) {
          this.modalMessage = 'El plato se actualizo correctamente';
        } else {
          this.modalMessage = `Error al guardar el plato: ${response.statusText}`;
        }
      } catch (error) {
        this.modalMessage = `Error inesperado: ${error.message}`;
      } finally {
        this.isModalVisible = true;
      }
    },
  },
};
</script>

<template>
  <div class="form-center">
    <form @submit.prevent="savePlato">
      <input type="text" v-model="plato.nombre" required readonly />
      <input type="text" v-model="plato.descripcion" required />
      <input type="text" v-model="plato.ingredientes" required />
      <input type="text" v-model="plato.precio" @input="handleInput" required />
      <button @click="udpateDishDrink" class="txt-0-8vw" type="submit">Guardar cambios</button>
    </form>
    <img src="@/assets/images/temp/plato-lujo.jpeg" alt="Imagen plato" />
  </div>
  <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
</template>

<style scoped> 
@import '@/assets/styles/fonts.css';

.form-center {
  display: flex;
  justify-content: center;
  align-items: center;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 2%;
}

.form-center div {
  display: flex;
  flex-direction: row;
}

.form-center img {
  width: 40%;
  height: auto;
  padding-left: 5%;
}

input[type="text"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
}

button {
  color: var(--text-100);
  background-color: var(--primary-100);
  font-weight: bolder;
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
}
</style>
