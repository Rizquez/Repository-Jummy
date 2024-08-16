<script setup>
import EditPlato from '@/components/common/EditPlato.vue'
import Footer from '@/components/common/Footer.vue';
</script>


<template>
    <div>
        <h1>Carta</h1>
        <router-link to="/company-menu" class="boton-salir txt-1-5vw">Salir</router-link>
        
        
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
        
        <router-link to="/look-menu" class="btn-carta txt-1vw">Ver menu</router-link>

    </div>
    <div>
        <p class="txt-1-5vw"> Entrantes</p>

        <div class="lista-platos">
            <EditPlato/>
            <EditPlato/>
            <EditPlato/>
        </div>

        <p class="txt-1-5vw"> Principales</p>

        <div class="lista-platos">
            <EditPlato/>
            <EditPlato/>
            <EditPlato/>
        </div>

        <p class="txt-1-5vw"> Postres</p>

        <div class="lista-platos">
            <EditPlato/>
            <EditPlato/>
            <EditPlato/>
        </div>

        <p class="txt-1-5vw"> Bebidas</p>

        <div class="lista-platos">
            <EditPlato/>
            <EditPlato/>
            <EditPlato/>
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

</style>