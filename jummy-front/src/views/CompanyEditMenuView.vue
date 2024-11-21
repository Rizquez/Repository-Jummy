<script setup>
import { ref } from 'vue';
import { useAuth0 } from '@auth0/auth0-vue';
import Footer from '@/components/Footer.vue';
import FormDish from '@/components/FormDish.vue';

const { isAuthenticated, user, isLoading } = useAuth0();
const email = user.value.name;
const popupDishDrinkVisible = ref(false);
const nuevoDishDrink = ref({
  nombre: '',
  descripcion: '',
  ingredientes: '',
  precio: 0,
});

const addDishDrink = () => {
  closePopupDishDrink();
};

const showPopupDishDrink = () => {
  popupDishDrinkVisible.value = true;
};

const closePopupDishDrink = () => {
  popupDishDrinkVisible.value = false;
};

const { logout } = useAuth0();
const handleLogout = () => {
  logout({ returnTo: window.location.origin });
};
</script>

<template>
  <main>
    <h1 class="txt-3vw">Carta</h1>
    <div class="container-btn-nav">
      <div>
        <ul>
          <li><button class="txt-1-5vw" @click="showPopupDishDrink">Entrantes</button></li>
          <li><button class="txt-1-5vw" @click="showPopupDishDrink">Principales</button></li>
          <li><button class="txt-1-5vw" @click="showPopupDishDrink">Postres</button></li>
          <li><button class="txt-1-5vw" @click="showPopupDishDrink">Bebidas</button></li>
        </ul>
      </div>
      <div class="container-volver-salir">
        <p class="boton-salir txt-1-5vw" @click="handleLogout">Salir</p>
        <router-link :to="{ name: 'company-menu' }" class="btn-volver txt-1-5vw">Volver</router-link>
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Entrantes</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="showPopupDishDrink">Añadir entrante</button>
      </div>
      <div class="lista-platos">
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Principales</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="showPopupDishDrink">Añadir principal</button>
      </div>
      <div class="lista-platos">
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Bebidas</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="showPopupDishDrink">Añadir bebida</button>
      </div>
      <div class="lista-platos">
      </div>
    </div>
    <div class="contaniner-dish">
      <p class="txt-1-5vw">Postres</p>
      <div class="contaniner-anadir">
          <button class="anadir" @click="showPopupDishDrink">Añadir postre</button>
      </div>
      <div class="lista-platos">
      </div>
    </div>
    <Footer/>
  </main>
  
  <!-- Popup (Modal) para los platos/bebidas -->
  <div class="boton-anadir-container">
    <div v-if="popupDishDrinkVisible" class="modal">
      <h2>Añadir Plato/Bebida</h2>
      <form @submit.prevent="addDishDrink">
        <div>
          <label for="nombre-plato">Nombre:</label>
          <input type="text" id="nombre-plato" v-model="nuevoDishDrink.nombre" required />
        </div>
        <div>
          <label for="descripcion">Descripción:</label>
          <textarea id="descripcion" v-model="nuevoDishDrink.descripcion" required></textarea>
        </div>
        <div>
          <label for="ingredientes">Ingredientes:</label>
          <textarea id="ingredientes" v-model="nuevoDishDrink.ingredientes" required></textarea>
        </div>
        <div>
          <label for="precio">Precio:</label>
          <input type="number" id="precio" v-model="nuevoDishDrink.precio" required />
        </div>
        <div class="modal-buttons">
          <button type="submit">Guardar</button>
          <button type="button" @click="closePopupDishDrink">Cancelar</button>
        </div>
      </form>
    </div>
  </div>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

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

.btn-volver {
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
  text-align: right;
  padding-top: 20px;
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


