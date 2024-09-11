<script setup>
import Footer from '@/components/common/Footer.vue';
</script>


<template>
      <div>
    <h1>Carta</h1>
    <div class="container-nav">
      <div>
        <ul>
          <li>
              <a class="txt-1-5vw" href="#Entrantes">Entrantes</a>
          </li>
          <li>
              <a class="txt-1-5vw" href="#Principales">Principales</a>
          </li>
          <li>
              <a class="txt-1-5vw" href="#Postres">Postres</a>
          </li>
          <li>
              <a class="txt-1-5vw" href="#Bebidas">Bebidas</a>
          </li>
        </ul>
      </div>
      <div class="container-btn-salir">
        <router-link to="/" class="txt-1-5vw">Salir</router-link>
        <router-link to="/company-menu" class="txt-1-5vw">Volver</router-link>
      </div>
    </div>
  </div>

    <div class = "continer-nav">
      <!-- Sección Entrantes -->
      <!--<div class="section">-->
        <div class="section" id="Entrantes">
        <p class="txt-1-5vw">Entrantes</p>
        <button @click="addItem('entrantes')">Añadir Entrante</button>
        <div v-for="(item, index) in entrantes" :key="'entrante-' + index">
          <EditDish :dish="item" @remove="removeItem('entrantes', index)" />
        </div>
      </div>
  
      <!-- Sección Principales -->
      <div class="section" id="Principales">
        <p class="txt-1-5vw">Principales</p>
        <button @click="addItem('principales')">Añadir Principal</button>
        <div v-for="(item, index) in principales" :key="'principal-' + index">
          <EditDish :dish="item" @remove="removeItem('principales', index)" />
        </div>
      </div>
  
      <!-- Sección Postres -->
      <div class="section" id="Postres">
        <p class="txt-1-5vw">Postres</p>
        <button @click="addItem('postres')">Añadir Postre</button>
        <div v-for="(item, index) in postres" :key="'postre-' + index">
          <EditDish :dish="item" @remove="removeItem('postres', index)" />
        </div>
      </div>
  
      <!-- Sección Bebidas -->
      <div class="section" id="Bebidas">
        <p class="txt-1-5vw">Bebidas</p>
        <button @click="addItem('bebidas')">Añadir Bebida</button>
        <div v-for="(item, index) in bebidas" :key="'bebida-' + index">
          <EditDish :dish="item" @remove="removeItem('bebidas', index)" />
        </div>
      </div>
    </div>
    <Footer/>
  </template>
  
  <script>
  import EditDish from '@/components/common/EditDish.vue';

  
  export default {
    name: 'MenuEditor',
    components: {
      EditDish,
    },
    data() {
      return {
        entrantes: [],
        principales: [],
        postres: [],
        bebidas: [],
      };
    },
    methods: {
      addItem(section) {
        this[section].push({ nombre: '', precio: '', descripcion: '' }); // Añade un nuevo objeto plato vacío
      },
      removeItem(section, index) {
        this[section].splice(index, 1); // Elimina el plato en la posición indicada
      },
    },
  };
  </script>
  
  <style>

  .container-nav {
  display: flex;
  justify-content: space-between;
  max-width: 70%;
  margin: 0 auto;
  }

  .menu-editor {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .section {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 10px;
  }
  
  button {
    margin-bottom: 10px;
  }

  .container-btn-salir {
  display: flex;
  flex-direction: column;
  }

  h1 {
  text-align: center;
  }

  p {
  text-align: center;
  }



  </style>
