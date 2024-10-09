<script setup>
import { ref } from 'vue';
import Dish from '@/components/Dish.vue';
import Footer from '@/components/Footer.vue';

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
  <main>
    <h1 class="txt-3vw">Carta</h1>
    <div class="container-btn-nav">
      <div>
        <ul>
          <li><button class="txt-1-5vw" @click="mostrarPopupPlato">Entrantes</button></li>
          <li><button class="txt-1-5vw" @click="mostrarPopupPlato">Principales</button></li>
          <li><button class="txt-1-5vw" @click="mostrarPopupPlato">Postres</button></li>
          <li><button class="txt-1-5vw" @click="mostrarPopupBebida">Bebidas</button></li>
        </ul>
      </div>
      <div class="container-volver-salir">
        <router-link to="/company" class="btn-volver-salir txt-1-5vw">Salir</router-link>
        <router-link to="/company-menu" class="btn-volver-salir txt-1-5vw">Volver</router-link>
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Entrantes</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="mostrarPopupPlato">Añadir entrante</button>
      </div>
      <div class="lista-platos">
        <Dish />
        <Dish />
        <Dish />
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Principales</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="mostrarPopupPlato">Añadir principal</button>
      </div>
      <div class="lista-platos">
        <Dish />
        <Dish />
        <Dish />
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Bebidas</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="mostrarPopupBebida">Añadir bebida</button>
      </div>
      <div class="lista-platos">
        <Dish />
        <Dish />
        <Dish />
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Postres</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="mostrarPopupPlato">Añadir postre</button>
      </div>
      <div class="lista-platos">
        <Dish />
        <Dish />
        <Dish />
      </div>
    </div>
    <Footer/>
  </main>
  
  <!-- Popup (Modal) para los platos -->
  <div class="boton-anadir-container">
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
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';
@import '@/assets/styles/base.css';

h1 {
  font-weight: initial;
  text-align: center;
}

.container-btn-nav {
  display: flex;
  max-width: 70%;
  margin: 0 auto;
  justify-content: space-between;
}

.container-btn-nav li {
  color: var(--primary-300);
}

.container-btn-nav button {
  background-color: var(--bg-200);
  border: none;
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
}

.container-volver-salir {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.btn-volver-salir {
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
  text-align: right;
}

.lista-platos {
  display: flex;
  flex-direction: column;
  gap: 30px;
}

.contaniner-dish {
  display: flex;
  flex-direction: column;
  max-width: 70%;
  margin: 0 auto;
  padding-bottom: 50px;
}

.contaniner-dish p {
  text-align: center;
  color: var(--primary-300);
  margin: 0px;
}

.anadir {
  background-color: var(--bg-200);
  border: none;
  color: var(--primary-300);
  cursor: pointer;
  text-decoration: underline;
}

.contaniner-anadir {
  display: flex;
  justify-content: flex-end;
  padding-bottom: 10px;
}

.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: var(--bg-100);
  padding: 40px;
  border-radius: 10px;
  width: 100%;
  max-width: 30rem;
  z-index: 10000; /* Aumentar z-index para asegurarse de que esté sobre todos los elementos */
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.4);
  border: 3px solid var(--primary-300); /* Añadir borde con color var(--primary-300) */
}

.modal h2 {
  text-align: center;
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
  width: 96%;
  padding: 8px;
  border: 1px solid var(--primary-300);
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
  background-color: var(--text-300);
}

</style>


