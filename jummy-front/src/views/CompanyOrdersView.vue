<script setup>
import { ref, onMounted, computed } from 'vue'
import { useAuth0 } from '@auth0/auth0-vue';
import Footer from '@/components/Footer.vue';
import Order from '@/components/Order.vue';

const allOrdersCompany = ref([]);

const loadOrders = () => {
  const orders = JSON.parse(sessionStorage.getItem('allOrdersCompany'));
  if (orders && Array.isArray(orders)) {
    allOrdersCompany.value = orders;
  }
};

onMounted(() => {
  loadOrders();
});

const { logout } = useAuth0();
const handleLogout = () => {
  sessionStorage.clear();
  logout({ returnTo: window.location.origin });
};
</script>

<template>
    <main>
        <div class="container-general">
            <img src="@/assets/images/general/logo-jummy.png" alt="Logo Jummy"/>
            <div>
                <div class="btn-volver-container">
                    <p class="boton-salir txt-1-5vw" @click="handleLogout">Salir</p>
                </div>
                <div class="btn-volver-container">
                    <router-link :to="{ name: 'company-menu' }" class="btn-volver txt-1-5vw">Volver</router-link>
                </div>
            </div>
        </div>
        <div class="order">
          <Order :showComensal="true" v-for="(order, index) in allOrdersCompany" :key="index" :order="order" />
        </div>
        <Footer/>
    </main>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';
@import '@/assets/styles/common.css';

img {
    max-width: 10%;
    height: auto;
    padding-top: 30px;
}

.btn-volver-container {
  display: flex;
  justify-content: flex-end;
  max-width: 83%;
  padding-top: 30px;
}

.button-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 50px;
}

.btn-volver {
  color: var(--primary-300);
  text-decoration: none;
  cursor: pointer;
  text-align: right;
}

.order {
  display: flex;
  flex-direction: column;
  max-width: 50%;
  padding-top: 60px;
  gap: 20px;
  margin: 0 auto;
}

</style>
