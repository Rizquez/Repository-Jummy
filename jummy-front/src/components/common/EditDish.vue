<template>
  <div class="info-plato">
    <!--
    <input v-model="dish.nombre" placeholder="Nombre del plato" />
    <input v-model="dish.precio" placeholder="Precio" type="number" />
    <textarea v-model="dish.descripcion" placeholder="Descripción"></textarea>
    <button @click="$emit('remove')">Eliminar</button> -->
    <!-- Prueba -->
    <p>Nº Plato (por asignar)</p>
    <input class="barra txt-1vm" type="text" value="" placeholder="Nombre"/>
    <input class="barra txt-1vm" type="text" value="" placeholder="Descripción"/>
    <input class="barra txt-1vm" type="text" value="" placeholder="Ingredientes"/>
    <input class="barra txt-1vm" type="text" value="" placeholder="Precio"/>
    <button class="btn-carta txt-1vw">Guardar</button>
    <button class="btn-carta txt-1vw" @click="$emit('remove')">Eliminar</button>
    <img src="../../assets/images/temp/plato-lujo.jpeg" alt="Imagen plato" class=""/>
  </div>
</template>

<script>
export default {
  name: 'EditDish',
  props: {
    dish: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style scoped>
.dish-form {
  margin-bottom: 15px;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}
input, textarea {
  display: block;
  margin-bottom: 10px;
}
/*
button {
  background-color: red;
  color: white;
  padding: 5px 10px;
}*/
.info-plato {
border: 3px solid var(--primary-300);
border-radius: 20px;
box-sizing: border-box;
padding: 10px 20px 30px 20px;
display: flex;
max-width: 70%;
margin: 0 auto;
justify-content: space-evenly;
flex-direction: column;
margin-bottom: 3%;
}
</style>