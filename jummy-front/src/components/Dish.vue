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
    getDishImage(tipoPlato) {
      const images = import.meta.glob('@/assets/images/dishes/*.png', { eager: true });
      const normalizedTipoPlato = tipoPlato.toLowerCase();
      const imagePath = `/src/assets/images/dishes/${normalizedTipoPlato}.png`;
      return images[imagePath]?.default || '@/assets/images/dishes/default.png';
    },
  },
};
</script>

<template>
  <div id="plato" class="info-plato">
    <div class="container-info">
      <div>
        <p class="txt-1vw">{{ plato.nombre || 'N/A' }}</p>
        <p class="txt-1vw">{{ plato.descripcion || 'N/A' }}</p>
        <p class="txt-1vw">{{ plato.ingredientes || 'N/A' }}</p>
        <p class="txt-1vw">{{ plato.precio ? `${plato.precio}€` : 'N/A' }}</p>
      </div>
      <img :src="getDishImage(plato.tipo_plato)" :alt="`Imagen de ${plato.nombre || 'plato'}`" />
    </div>
    <button class="btn-anadir txt-1vw" @click="addDish">Añadir</button>
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
  width: 25%;
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