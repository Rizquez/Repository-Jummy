f<template>
     <div id="plato" class="info-plato">
      <div class="container-info">
        <div>
          <p class="txt-1vw">Nombre</p>
          <p class="txt-1vw">Descripción</p>
          <p class="txt-1vw">Ingredientes</p>
          <p class="txt-1vw">Precio</p>
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

</style>
