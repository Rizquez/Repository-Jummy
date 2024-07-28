<script setup>
import GastronomyRestaurant from '@/components/common/headers/GastronomyRestaurant.vue';
</script>

<template>
    <GastronomyRestaurant/>
    <section>
        <div class = "contenedor-scroll">
            <button class="boton-gastronomia txt-1-5vw" id="japonesa">JAPONESA</button>
            <button class="boton-gastronomia txt-1-5vw" id="italiana">ITALIANA</button>
            <button class="boton-gastronomia txt-1-5vw" id="española">ESPAÑOLA</button>
            <button class="boton-gastronomia txt-1-5vw" id="venezolana">VENEZOLANA</button>
            <button class="boton-gastronomia txt-1-5vw" id="mexicana">MEXICANA</button>
            <button class="boton-gastronomia txt-1-5vw" id="tailandesa">TAILANDESA</button>
        </div>
    </section>
</template>

<style scoped>
@import '@/assets/styles/common/fonts.css';

.contenedor-scroll {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 3vw;
    padding-top: 50px;
    padding-bottom: 30px;
}

.boton-gastronomia {
    width: 50%;
    height: auto;
    font-weight: bold;
    color: var(--bg-100);
    text-shadow: 2px 2px 4px var(--text-100), 2px 2px 4px var(--text-200);
    border-radius: 10px;
    padding: 2vw;
}

#japonesa {
    background-image: url(../../../assets/images/gastronomy/japonesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
}

#italiana {
    background-image: url(../../../assets/images/gastronomy/italiana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#española {
    background-image: url(../../../assets/images/gastronomy/española.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#venezolana {
    background-image: url(../../../assets/images/gastronomy/venezolana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#mexicana {
    background-image: url(../../../assets/images/gastronomy/mexicana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#tailandesa {
    background-image: url(../../../assets/images/gastronomy/tailandesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}
</style>