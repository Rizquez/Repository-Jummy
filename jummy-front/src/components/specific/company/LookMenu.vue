<script setup>
import Dish from '@/components/common/Dish.vue'
import Footer from '@/components/common/Footer.vue';
</script>


<template>
    <div>
        <h1>Carta</h1>
        <router-link to="/company-menu" class="boton-salir txt-1-5vw">Salir</router-link>
        <router-link to="/look-menu" class="btn-carta txt-1vw">Ver menu</router-link>
        <ul>
            <li>
                <button class="txt-1-5vw">Entrantes</button>
            </li>
            <li>
                <button class="txt-1-5vw">Principales</button>
            </li>
            <li>
                <button class="txt-1-5vw">Postres</button>
            </li>
            <li>
                <button class="txt-1-5vw">Bebidas</button>
            </li>
        </ul>
        
        
    </div>
    <div>
        <p class="txt-1-5vw"> Entrantes</p>

        <div class="lista-platos">
            <Dish/>
            <Dish/>
            <Dish/>
        </div>

        <p class="txt-1-5vw"> Principales</p>

        <div class="lista-platos">
            <Dish/>
            <Dish/>
            <Dish/>
        </div>

        <p class="txt-1-5vw"> Postres</p>

        <div class="lista-platos">
            <Dish/>
            <Dish/>
            <Dish/>
        </div>

        <p class="txt-1-5vw"> Bebidas</p>

        <div class="lista-platos">
            <Dish/>
            <Dish/>
            <Dish/>
        </div>

    </div>
    <Footer></Footer>
</template>

<style scoped>

@import '@/assets/styles/common/fonts.css';

div{
   max-width: 70%;
   margin: 0 auto;
   position: sticky;
   z-index: 999;
}


h1 {
  font-weight:lighter;
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

.lista-platos {
  display: flex;
  flex-direction: column;
  max-width: 100%;
  margin: 0 auto;
  gap: 30px;
  padding-bottom: 30px;
}

</style>