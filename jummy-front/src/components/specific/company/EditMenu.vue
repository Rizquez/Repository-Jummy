<script setup>
import EditDish from '@/components/common/EditDish.vue'
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

  <div id="Entrantes">
    <p class="txt-1-5vw">Entrantes</p>
    <EditDish/>
    <EditDish/>
    <EditDish/>
    <EditDish/>
  </div>

  <div id="Principales">
    <p class="txt-1-5vw">Principales</p>
    <EditDish/>
    <EditDish/>
    <EditDish/>
    <EditDish/>
  </div>

  <div id="Postres">
    <p class="txt-1-5vw">Postres</p>
    <EditDish/>
    <EditDish/>
    <EditDish/>
    <EditDish/>
  </div>


  <div id="Bebidas">
    <p class="txt-1-5vw">Bebidas</p>
    <EditDish/>
    <EditDish/>
    <EditDish/>
    <EditDish/>
  </div>
  
    
  <!-- <router-link to="/look-menu" class="btn-carta txt-1vw">Ver menu</router-link> -->
  

  <Footer/>
</template>



<style scoped>
.container-nav {
  display: flex;
  justify-content: space-between;
  max-width: 70%;
  margin: 0 auto;
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



/* @import '@/assets/styles/common/fonts.css';
@import '@/assets/styles/common/common.css';

.lista-restaurantes {
  display: flex;
  
  flex-direction: column;
  max-width: 70%;
  margin: 0 auto;
  gap: 30px;
  padding-bottom: 30px;
  padding: 10px 20px 30px 20px;
}

.info-restaurante {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 10px 20px 30px 20px;
}

.container-info {
  display: flex;
  justify-content: space-between;
}

div {
  max-width: 70%;
  margin: 0 auto;
  max-width: 70%;
  margin: 0 auto;
  position: sticky;
  z-index: 999;
}
button {
    background-color: var(--bg-200);
    border: none;
    color: var(--primary-300);
    text-decoration: none;
    cursor: pointer;
}


.lista-platos {
  display: flex;
  flex-direction: column;
  max-width: 100%;
  margin: 0 auto;
  gap: 30px;
  padding-bottom: 30px;
}


h1 {
  font-weight: lighter;
  text-decoration: underline;
  text-align: center;
  color: var(--text-100);
}

.btn-carta {
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
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
} */


</style>
