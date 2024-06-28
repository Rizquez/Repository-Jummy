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
            <router-link to="/" class="boton-salir" >Volver</router-link>
        </div >
        <div class="contenedor-fijo">
            <div class="contenedor-logo">
                <img src="/img-gastronomy.png" alt="logo Jummy" class="logo">
            </div>
            <div class = "contenedor-buscador">
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
.contenedor-hipervinculo {
    text-align: right;
    margin: 30px;
}

.boton-salir{
    padding: 5px 10px;
    background-color: var(--bg-200);
    color: var(--primary-300);
    cursor: pointer;
    text-decoration: none;
}


.contenedor-fijo {
    display: flex;
    flex-direction: row;
    width: 90%;
    margin: 0 auto;
    position: sticky;
    top: 0px;
    z-index: 999;
    background-color: var(--bg-200);
    padding-bottom: 50px;
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

.boton-buscador{
    width: 30%;
    margin-top: 2%;
    border-radius: 10px;
    background-color: var(--primary-300);
    color: var(--bg-100);
    padding: 5px;
}

.contenedor-logo{
    display: flex;
    width: 100%;
    justify-content: center;
    margin-left: 12%;
}

.logo{
    width: 30%;
}

.barra {
    background-color: var(--bg-300);
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

@media(min-width: 980px){
   .logo{
    width: 40%;
   } 

   .boton-gastronomia{
    width: 50%;
    font-size: 1.5rem;
   }

   .barra{
    width: 60%;
   }
}

@media(min-width: 800px) and ( max-width: 980px){
    .logo{
        width: 50%;
    }
}

@media (max-width: 1200px) {
  .boton-salir {
    padding: 8px 16px;
    font-size: 14px;
  }

  .barra {
    font-size: 14px;    
   }

   .boton-buscador{
        padding: 8px 16px;
        font-size: 14px;
    }


}

@media (max-width: 800px) {
    .boton-salir {
    padding: 6px 12px;
    font-size: 12px;
  }
  .barra{
    font-size: 12px;
  }

  .logo{
    width: 60%;
   } 

   .boton-buscador {
    padding: 6px 12px;
    font-size: 12px;
  }

}

@media (max-width: 500px) {
    .boton-salir {
    padding: 4px 8px;
    font-size: 10px;
  }
  .barra{
    font-size: 10px;
  }

  .logo{
    width: 80%;
   } 

   .boton-buscador{
    padding: 4px 8px;
    font-size: 10px;
   }

}
</style>