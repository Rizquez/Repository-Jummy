<script>
import { ref } from 'vue';
import { fetchWithTimeout } from '@/stores/utils';
import AlertModal from '@/components/AlertModal.vue';

export default {
  props: {
    order: {
      type: Object,
      required: true,
    },
    showComercial: {
        type: Boolean,
        default: false
    },
    showComensal: {
        type: Boolean,
        default: false
    },
  },
  components: {
    AlertModal,
  },
  setup(props) {
    const modalMessage = ref('');
    const isModalVisible = ref(false);

    const handleModalClose = () => {
      isModalVisible.value = false;
    };

    const finishOrder = async () => {
      try {
        const response = await fetchWithTimeout('http://127.0.0.1:5000/complete-order', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ id_pedido: props.order.id_pedido })
        }, 10000);

        if (response.status === 200) {
          modalMessage.value = 'El pedido se completó correctamente';
          props.order.estado = 'Completado';
        } else if (response.status === 400) {
          modalMessage.value = 'El pedido ya se encuentra en estado de completado, por favor reinicie la pagina';
        } else {
          modalMessage.value = `Error al completar el pedido: ${response.statusText}`;
        }
      } catch (error) {
        modalMessage.value = `Error inesperado: ${error.message}`;
      } finally {
        isModalVisible.value = true; 
      }
    };

    return {
      modalMessage,
      isModalVisible,
      handleModalClose,
      finishOrder,
    };
  },
};
</script>

<template>
  <div>
    <p v-if="showComercial" class="txt-1vw">{{ order.nombre_comercial || 'N/A' }}</p>
    <p v-if="showComensal" class="txt-1vw">{{ order.email_comensal || 'N/A' }}</p>
    <p class="txt-1vw">{{ order.nombres_platos.join(', ') || 'N/A' }}</p>
    <p class="txt-1vw">{{ order.fecha || 'N/A' }}</p>
    <p class="txt-1vw">{{ order.estado || 'N/A' }}</p>
    <button v-if="showComensal && order.estado==='Pendiente'" class="txt-0-8vw" @click="finishOrder">Completar pedido</button>
  </div>
  <AlertModal :message="modalMessage" :visible="isModalVisible" @close="handleModalClose"/>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';

div {
  border: 3px solid var(--primary-300);
}

p {
  text-align: center;
}

button {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 15px 20px; 
  border: none;
  cursor: pointer;
  border-radius: 50px;
  text-decoration: none;
  margin: 20px auto;
}
</style>
