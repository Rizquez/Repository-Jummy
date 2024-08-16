<template>
     <div id="plato" class="info-plato">
      <div class="container-info">
        <div>
          <p>n#</p>
            <input class="barra txt-1-5vw" type="text" value="" placeholder="Nombre"/>
            <br>
            
            <input class="barra txt-1-5vw" type="text" value="" placeholder="Descripción"/>
            <br>
            
            <input class="barra txt-1-5vw" type="text" value="" placeholder="Ingredientes"/>
            <br>
            
            <input class="barra txt-1-5vw" type="text" value="" placeholder="Precio"/>
            <br>
            <br>
            <button class="txt-1-5vw">Guardar</button>
            
            <button class="txt-1-5vw">Borrar</button>

        </div>
        <img src="../../assets/images/temp/plato-lujo.jpeg" alt="Imagen plato"/>
      </div>
    </div>
</template>


<style scoped>
.info-plato {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 10px 20px 30px 20px;
}

.info-plato img {
  width: 40%;
  height: auto;
}

.container-info {
  display: flex;
  justify-content: space-between;
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
.barra {
    background-color: var(--bg-300);
    width: calc(boton-buscador);
    border-radius: 10px;
    padding: 10px;
}

</style>