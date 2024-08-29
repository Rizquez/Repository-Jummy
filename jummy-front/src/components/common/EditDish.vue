<template>
  <div class="container-info info-plato">
    <p>Nº Plato (por asignar)</p>
      <input class="barra txt-1vm" type="text" value="" placeholder="Nombre"/>
      <input class="barra txt-1vm" type="text" value="" placeholder="Descripción"/>
      <input class="barra txt-1vm" type="text" value="" placeholder="Ingredientes"/>
      <input class="barra txt-1vm" type="text" value="" placeholder="Precio"/>
      <button class="btn-carta txt-1vw">Guardar</button>
      <button class="btn-carta txt-1vw">Eliminar</button>
      <img src="../../assets/images/temp/plato-lujo.jpeg" alt="Imagen plato" class=""/>
  </div>
</template>


<style scoped>
.container-info {
  display: flex;
  max-width: 70%;
  margin: 0 auto;
  justify-content: space-evenly;
  flex-direction: column;
  margin-bottom: 3%;
}

.container-info img {
  width: 50%;
  height: auto;
}

.info-plato {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 10px 20px 30px 20px;
}



/* @import '@/assets/styles/common/fonts.css';
@import '@/assets/styles/common/common.css';


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

.info-restaurante {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 10px 20px 30px 20px;
}
 */

</style>