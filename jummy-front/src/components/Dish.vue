<script>
export default {
  props: {
    plato: {
      type: Object,
      required: true,
    },
  },
  methods: {
    addDish() {
      this.$emit('add', this.plato);
    },
  },
};
</script>

<template>
  <div id="plato" class="info-plato" v-if="plato">
    <div class="container-info">
      <div>
        <p class="txt-1vw">{{ plato.nombre || 'N/A' }}</p>
        <p class="txt-1vw">{{ plato.descripcion || 'N/A' }}</p>
        <p class="txt-1vw">{{ plato.ingredientes || 'N/A' }}</p>
        <p class="txt-1vw">{{ plato.precio ? `${plato.precio}€` : 'N/A' }}</p>
      </div>
      <img src="@/assets/images/temp/plato-lujo.jpeg" alt="Imagen plato" />
    </div>
    <button class="btn-anadir txt-1vw" @click="addDish">Añadir</button>
  </div>
  <div v-else>
    no hay plato
  </div>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
.info-plato {
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 10px 20px 30px 20px;
  position: relative;
  z-index: 1;
}

.info-plato img {
  width: 40%;
  height: auto;
}

.container-info {
  display: flex;
  justify-content: space-between;
}

.btn-anadir {
  color: var(--text-100);
  background-color: var(--primary-100);
  padding: 10px 35px;
  border: none;
  cursor: pointer;
  border-radius: 30px;
  text-decoration: none;
}
</style>