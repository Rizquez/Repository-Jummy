<script setup>
</script>

<template>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gastronomias</title>
</head>
<body>
<div class="contenedor-hipervinculo">
    <router-link to="/">Salir</router-link>
</div >

<div class="contenedor-fijo">

    <div class="contenedor-logo">

        <img src="./public/img-gastronomy.png" alt="logo Jummy" class="logo">
    </div>

    <div class = "contenedor-buscador">
        <h4>Busca en Jummy</h4>
        <input class="barra" type="text" value="">
        
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

.contenedor-hipervinculo {
    text-align: right;
    margin: 30px;
}

.hipervinculo{
    color: rgb(143, 30, 0);
}

.contenedor-fijo {
    display: grid;
    grid-template-columns: auto auto;
    gap: 3rem;
    position: sticky;
    top: 0px;
    z-index: 999;
    background-color: var(--bg-200);
}

.contenedor-buscador {
    display: flex;
    align-items: center;
    flex-direction: column;
    margin-top: 30%;
    gap: 1rem;
}

h4 {
    font-weight: lighter;
}

.barra {
    background-color: rgb(196, 188, 171);
    width: 70%;
    height: 8%;
    border-radius: 10px;
}

.contenedor-scroll {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 3rem;
   
    
}

.boton-gastronomia {
    width: 70%;
    height: auto;
    font-size: 2.5rem;
    font-weight: bold;
    color: rgb(255, 255, 255);
    text-shadow: black -1px -1px 0px, black 1px -1px 0px, black -1px 1px 0px, black 1px 1px 0px;
    border-radius: 10px;
    padding: 2rem;
}

#japonesa {
    background-image: url(/jummy-front/public/fotos-comida/japonesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#italiana {
    background-image: url(/jummy-front/public/fotos-comida/italiana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#española {
    background-image: url(/jummy-front/public/fotos-comida/española.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#venezolana {
    background-image: url(/jummy-front/public/fotos-comida/venezolana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#mexicana {
    background-image: url(/jummy-front/public/fotos-comida/mexicana.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#tailandesa {
    background-image: url(/jummy-front/public/fotos-comida/tailandesa.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

</style>