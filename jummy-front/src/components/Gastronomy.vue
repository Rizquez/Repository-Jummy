<script setup>
</script>

<template>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gastronomias</title>
    </head>
    <body>
        <div class="contenedor-fijo">
            
            <img src="/img-gastronomy.png" alt="logo Jummy" class="logo">
            
            <div class = "contenedor-buscador">
                <router-link to="/" class="boton-salir" >Volver</router-link>
                <input class="barra" type="text" value="" placeholder="Busca en Jummy">
                <button class="boton-buscador">Buscar</button>
            </div>
        </div>
        <div class = "contenedor-scroll">
            <button class="boton-gastronomia" id="japonesa">JAPONESA</button>
            <button class="boton-gastronomia" id="italiana">ITALIANA</button>
            <button class="boton-gastronomia" id="española">ESPAÑOLA</button>
            <button class="boton-gastronomia" id="venezolana">VENEZOLANA</button>
            <button class="boton-gastronomia" id="mexicana">MEXICANA</button>
            <button class="boton-gastronomia" id="tailandesa">TAILANDESA</button>
        </div>
    </body>
</template>

<style scoped>

.contenedor-fijo {
    display: flex;
    /* flex-direction: row; */
     width: 70%; 
    justify-content: space-around;
    align-items: center;
    margin: 0 auto;
    top:0px;
    padding-left: 20%;
    padding-top: 5%;
    position: sticky;
    z-index: 999;
    background-color: var(--bg-200);
    padding-bottom: 50px;
}

.logo{
    width: 20%;
    height: auto;
}

.contenedor-buscador {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin: 70px 0px;
    margin-right: 15%;

}

.boton-salir{
    background-color: var(--bg-200);
    color: var(--primary-300);
    cursor: pointer;
    text-decoration: none;
    padding: 8px 16px;
    font-size: 14px;
    padding-bottom: 30px;
}

.barra {
    background-color: var(--bg-300);
    width: 60%;
    border-radius: 10px;
    padding: 5px;
}

.boton-buscador{
    width: 30%;
    margin-top: 5%;
    border-radius: 10px;
    background-color: var(--primary-300);
    color: var(--bg-100);
    padding: 5px;
}

.contenedor-scroll {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 3rem;
    padding-top: 120px;
    padding-bottom: 30px;
}

.boton-gastronomia {
    width: 50%;
    height: auto;
    font-size: 1.5rem;
    font-weight: bold;
    color: var(--bg-100);
    text-shadow: 2px 2px 4px var(--text-100), 2px 2px 4px var(--text-200);
    border-radius: 10px;
    padding: 2rem;
}

#japonesa {
    background-image: url(/fotos-comida/japonesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center ;
}

#italiana {
    background-image: url(/fotos-comida/italiana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#española {
    background-image: url(/fotos-comida/española.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#venezolana {
    background-image: url(/fotos-comida/venezolana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#mexicana {
    background-image: url(/fotos-comida/mexicana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#tailandesa {
    background-image: url(/fotos-comida/tailandesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

</style>