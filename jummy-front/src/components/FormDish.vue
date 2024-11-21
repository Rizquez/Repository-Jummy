<script>
import { validateNumber } from '@/stores/utils';
export default {
  props: {
    plato: {
      type: Object,
      required: true,
    },
  },
  methods: {
    handleInput(event) {
      validateNumber(event);
    },
  },
};
</script>

<template>
    <div class="form-center">
        <form>
            <input type="text" v-model="plato.nombre" required/>
            <input type="text" v-model="plato.descripcion" required/>
            <input type="text" v-model="plato.ingredientes" required/>
            <input type="text" v-model="plato.precio" @input="handleInput" required/>
        </form>
        <img src="@/assets/images/temp/plato-lujo.jpeg" alt="Imagen plato" />
    </div>
</template>

<style scoped> 
@import '@/assets/styles/fonts.css';

.form-center {
  display: flex;
  justify-content: center;
  align-items: center;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 2%;
}

.form-center div {
    display: flex;
    flex-direction: row;
}

.form-center img {
    width: 40%;
    height: auto;
    padding-left: 5%;
}

input[type="text"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
}
</style>
