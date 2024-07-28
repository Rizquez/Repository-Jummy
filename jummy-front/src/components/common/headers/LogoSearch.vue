<script setup>
</script>

<template>
   <header>
        <div class="contenedor-fijo">
            <img src="../../../assets/images/general/img-gastronomy.png" alt="Logo Gastronomias"/>
            <div class="contenedor-general">
                <div>
                    <router-link to="/" class="boton-salir txt-1-5vw">Salir</router-link>
                </div>
                <div class="contenedor-general">
                    <input class="barra txt-1-5vw" type="text" value="" placeholder="Busca en Jummy">
                    <button class="boton-buscador txt-1-5vw">Buscar</button>
                </div>
            </div>
        </div>
    </header>
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

.contenedor-general {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    width: 100%;
}

.contenedor-fijo {
    display: flex;
    max-width: 50%;
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

.boton-salir {
    display: flex;
    justify-content: flex-end;
    color: var(--primary-300);
    text-decoration: none;
    cursor: pointer;
    text-align: right;
    padding-bottom: 70px;
}

.boton-buscador {
    color: var(--text-100);
    background-color: var(--primary-100);
    cursor: pointer;
    border-radius: 30px;
    text-decoration: none;
    margin-top: 30px;
}

.barra {
    background-color: var(--bg-300);
    width: calc(boton-buscador);
    border-radius: 10px;
    padding: 10px;
}

</style>