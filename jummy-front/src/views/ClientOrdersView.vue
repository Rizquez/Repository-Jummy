<script setup>
import { ref, onMounted, computed } from 'vue'
import HeaderClient from '@/components/HeaderClient.vue'
import Footer from '@/components/Footer.vue';
import Order from '@/components/Order.vue';

const allOrders = ref([]);

const loadOrders = () => {
  const orders = JSON.parse(sessionStorage.getItem('allOrders'));
  if (orders && Array.isArray(orders)) {
    allOrders.value = orders;
  }
};

onMounted(() => {
  loadOrders();
});
</script>

<template>
    <main>
        <HeaderClient :show-return="true"/>
        <div class="order">
          <Order :showComercial="true" v-for="(order, index) in allOrders" :key="index" :order="order" />
        </div>
        <Footer/>
    </main>
</template>

<style scoped>

.order {
  display: flex;
  flex-direction: column;
  max-width: 50%;
  padding-top: 60px;
  gap: 20px;
  margin: 0 auto;
}

</style>
