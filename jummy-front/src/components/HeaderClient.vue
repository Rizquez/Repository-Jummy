<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import { defineProps } from 'vue';

const props = defineProps({
    showReturn: {
        type: Boolean,
        default: false
    }
});

const { logout } = useAuth0();
const handleLogout = () => {
  logout({ returnTo: window.location.origin });
};
</script>

<template>
   <header>
        <div class="contenedor-fijo">
            <img src="@/assets/images/general/img-gastronomy.png" alt="Logo Gastronomias"/>
            <div class="contenedor-general">
                <div class="salir-volver">
                    <p class="boton-salir txt-1-5vw" @click="handleLogout">Salir</p>
                    <router-link v-if="showReturn" :to="{ name: 'client-gastronomy' }" class="boton-salir txt-1-5vw boton-volver">Volver</router-link>
                </div>
                <div class="contenedor-general">
                    <input class="barra txt-1-5vw" type="text" value="" placeholder="Busca en Jummy">
                    <router-link :to="{ name: 'client-gastronomy' }" class="boton-buscador txt-1-5vw">Buscar</router-link>
                </div>
            </div>
        </div>
    </header>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

.contenedor-general {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 100%;
}

.contenedor-fijo {
    display: flex;
    max-width: 70%;
    margin: 0 auto;
    position: sticky;
    z-index: 999;
    background-color: var(--bg-200);
    padding-top: 60px;
    gap: calc(20%);
}

.contenedor-fijo img {
    width: 30%;
    height: auto;
    display: flex;
    align-items: flex-start;
}

.boton-volver {
    padding: 30px 0px;
}

.boton-buscador {
    color: var(--text-100);
    background-color: var(--primary-100);
    padding: 10px 35px;
    border: none;
    cursor: pointer;
    border-radius: 30px;
    text-decoration: none;
    margin-top: 30px;
    text-align: center;
}

.barra {
    background-color: var(--bg-300);
    width: calc(boton-buscador);
    border-radius: 10px;
    padding: 10px;
}

</style>