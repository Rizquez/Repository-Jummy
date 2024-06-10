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
    <a href="/" class="boton-salir" >Salir</a>
</div >

<div class="contenedor-fijo">

    <div class="contenedor-logo">

        <img src="/img-gastronomy.png" alt="logo Jummy" class="logo">

    </div>

    <div class = "contenedor-buscador">
        
        <input class="barra" type="text" value="" placeholder="Busca en Jummy">
        
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

.boton-salir{
    padding: 5px 10px;
    background-color: black;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    text-decoration: none;
}

.hipervinculo{
    color: rgb(143, 30, 0);
}

.contenedor-fijo {
    display: flex;
    flex-direction: column;
    width: 80%;
    margin: 0 auto;
    position: sticky;
    top: 0px;
    z-index: 999;
    background-color: var(--bg-200);
}

.contenedor-buscador {
    display: flex;
    justify-content: center;
    width: 100%;
    margin: 40px 0px;

}

.contenedor-logo{
    display: flex;
    width: 100%;
    justify-content: center;
}

.logo{
    width: 20%;
}





.barra {
    background-color: rgb(196, 188, 171);
    width: 80%;
    border-radius: 10px;
    padding: 5px;
}

.contenedor-scroll {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 3rem;
    padding-top: 40px;
    padding-bottom: 30px;
   
    
}

.boton-gastronomia {
    width: 70%;
    height: auto;
    font-size: 1rem;
    font-weight: bold;
    color: rgb(255, 255, 255);
    text-shadow: black -1px -1px 0px, black 1px -1px 0px, black -1px 1px 0px, black 1px 1px 0px;
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

@media(min-width: 980px){
   .logo{
    width: 10%;
   } 

   .boton-gastronomia{
    width: 50%;
    font-size: 1.5rem;
   }
   .barra{
    width: 60%;
   }

}

</style>