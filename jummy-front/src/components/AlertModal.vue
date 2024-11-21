<script setup>
import { defineProps, defineEmits } from 'vue'

const emit = defineEmits(['close'])

const props = defineProps({
  message: {
    type: String,
    required: true
  },
  visible: {
    type: Boolean,
    required: true
  }
})

const handleAccept = () => {
  emit('close')
}
</script>

<template>
    <div v-if="visible" class="modal-overlay">
      <div class="modal">
        <p>{{ message }}</p>
        <button @click="handleAccept">Aceptar</button>
      </div>
    </div>
</template>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal {
  border: 3px solid var(--primary-300);
  background-color: var(--bg-100);
  padding: 30px;
  border-radius: 10px;
  text-align: center;
  min-width: 300px;
}

.modal p {
  padding-bottom: 10%;
  font-size: 1.3vw;
}

button {
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
  font-size: 1vw;
}
</style>
  