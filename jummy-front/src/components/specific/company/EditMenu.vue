<script setup>
import { ref } from 'vue';
import Dish from '@/components/common/Dish.vue';
import Footer from '@/components/common/Footer.vue';

// Variables de estado
const popupPlatoVisible = ref(false);
const popupBebidaVisible = ref(false);
const nuevoPlato = ref({
  nombre: '',
  descripcion: '',
  ingredientes: '',
  precio: 0,
});
const nuevaBebida = ref({
  nombre: '',
  precio: 0,
});

// Métodos
const mostrarPopupPlato = () => {
  popupPlatoVisible.value = true;
};

const cerrarPopupPlato = () => {
  popupPlatoVisible.value = false;
};

const agregarPlato = () => {
  console.log('Nuevo plato:', nuevoPlato.value);
  cerrarPopupPlato(); // Cierra el modal después de guardar
};

const mostrarPopupBebida = () => {
  popupBebidaVisible.value = true;
};

const cerrarPopupBebida = () => {
  popupBebidaVisible.value = false;
};

const agregarBebida = () => {
  console.log('Nueva bebida:', nuevaBebida.value);
  cerrarPopupBebida(); // Cierra el modal después de guardar
};
</script>

<template>
  <div>
    <h1>Carta</h1>
    <router-link to="/company-menu" class="boton-salir txt-1-5vw">Salir</router-link>
    <router-link to="/look-menu" class="btn-carta txt-1vw">Ver menu</router-link>
    <ul>
      <li><button class="txt-1-5vw" @click="mostrarPopupPlato">Entrantes</button></li>
      <li><button class="txt-1-5vw" @click="mostrarPopupPlato">Principales</button></li>
      <li><button class="txt-1-5vw" @click="mostrarPopupPlato">Postres</button></li>
      <li><button class="txt-1-5vw" @click="mostrarPopupBebida">Bebidas</button></li>
    </ul>
  </div>
  
  <div>
    <p class="txt-1-5vw">Entrantes</p>
    <div class="boton-anadir-container">
      <button class="anadir" @click="mostrarPopupPlato">Añadir plato</button>
      
      <!-- Popup (Modal) para plato -->
      <div v-if="popupPlatoVisible" class="modal">
        <h2>Añadir Nuevo Plato</h2>
        <form @submit.prevent="agregarPlato">
          <div>
            <label for="nombre-plato">Nombre:</label>
            <input type="text" id="nombre-plato" v-model="nuevoPlato.nombre" required />
          </div>
          <div>
            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" v-model="nuevoPlato.descripcion" required></textarea>
          </div>
          <div>
            <label for="ingredientes">Ingredientes:</label>
            <textarea id="ingredientes" v-model="nuevoPlato.ingredientes" required></textarea>
          </div>
          <div>
            <label for="precio">Precio:</label>
            <input type="number" id="precio" v-model="nuevoPlato.precio" required />
          </div>
          <div class="modal-buttons">
            <button type="submit">Guardar</button>
            <button type="button" @click="cerrarPopupPlato">Cancelar</button>
          </div>
        </form>
      </div>
    </div>

    <div class="lista-platos">
      <Dish />
      <Dish />
      <Dish />
    </div>

    <p class="txt-1-5vw">Principales</p>
    <div class="boton-anadir-container">
      <button class="anadir" @click="mostrarPopupPlato">Añadir plato</button>
    </div>

    <div class="lista-platos">
      <Dish />
      <Dish />
      <Dish />
    </div>

    <p class="txt-1-5vw">Postres</p>
    <div class="boton-anadir-container">
      <button class="anadir" @click="mostrarPopupPlato">Añadir plato</button>
    </div>

    <div class="lista-platos">
      <Dish />
      <Dish />
      <Dish />
    </div>

    <p class="txt-1-5vw">Bebidas</p>
    <div class="boton-anadir-container">
      <button class="anadir" @click="mostrarPopupBebida">Añadir Bebida</button>
    </div>

    <!-- Popup (Modal) para bebida -->
    <div v-if="popupBebidaVisible" class="modal">
      <h2>Añadir Nueva Bebida</h2>
      <form @submit.prevent="agregarBebida">
        <div>
          <label for="nombre-bebida">Nombre:</label>
          <input type="text" id="nombre-bebida" v-model="nuevaBebida.nombre" required />
        </div>
        <div>
          <label for="precio-bebida">Precio:</label>
          <input type="number" id="precio-bebida" v-model="nuevaBebida.precio" required />
        </div>
        <div class="modal-buttons">
          <button type="submit">Guardar</button>
          <button type="button" @click="cerrarPopupBebida">Cancelar</button>
        </div>
      </form>
    </div>

    <div class="lista-platos">
      <Dish />
      <Dish />
      <Dish />
    </div>
  </div>

  <Footer />
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

div {
  max-width: 70%;
  margin: 0 auto;
  position: relative;
}

h1 {
  font-weight: lighter;
  text-decoration: underline;
  text-align: center;
  color: var(--text-100);
}

.boton-salir {
  display: flex;
  justify-content: flex-end;
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
  text-align: right;
}

li {
  color: var(--primary-300);
}

button {
  background-color: var(--bg-200);
  border: none;
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
}

p {
  text-decoration: underline;
  color: var(--primary-300);
  text-align: center;
}

.boton-anadir-container {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 20px;
}

.anadir {
  background-color: var(--bg-200);
  border: none;
  color: var(--primary-300);
  cursor: pointer;
  text-decoration: underline;
}

.lista-platos {
  display: flex;
  flex-direction: column;
  max-width: 100%;
  margin: 0 auto;
  gap: 30px;
  padding-bottom: 30px;
}

.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  width: 90%;
  max-width: 30rem;
  z-index: 10000; /* Aumentar z-index para asegurarse de que esté sobre todos los elementos */
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.4);
  border: 4px solid var(--primary-300); /* Añadir borde con color var(--primary-300) */
}

/* Estilo para los campos del formulario en el popup */
.modal form > div {
  margin-bottom: 15px;
}

.modal form label {
  display: block;
  margin-bottom: 5px;
}

.modal form input[type="text"],
.modal form input[type="number"],
.modal form textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.modal-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

.modal-buttons button {
  padding: 10px 20px;
  cursor: pointer;
  background-color: var(--primary-300);
  border: none;
  color: white;
  border-radius: 5px;
}

.modal-buttons button:nth-child(2) {
  background-color: gray;
}
</style>
