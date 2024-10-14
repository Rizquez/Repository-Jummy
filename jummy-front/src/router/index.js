import { createRouter, createWebHistory } from 'vue-router'
import { authGuard } from '@auth0/auth0-vue';

const routes = [
  {
    path: '/',
    name: 'home',
    component: () => import('@/views/HomeView.vue'),
  },
  {
    path: '/registro/cliente',
    name: 'client-register',
    component: () => import('@/views/ClientRegisterView.vue'),
  },
  {
    path: '/registro/empresa',
    name: 'company-register',
    component: () => import('@/views/CompanyRegisterView.vue'),
  },
  {
    path: '/gastronomia',
    name: 'client-gastronomy',
    component: () => import('@/views/ClientGastronomyView.vue'),
    beforeEnter: authGuard,
  },
  {
    path: '/restaurante/:type',
    name: 'client-restaurant',
    component: () => import('@/views/ClientListRestaurantView.vue'),
    beforeEnter: authGuard,
  },
  {
    path: '/empresa',
    name: 'company-menu',
    component: () => import('@/views/CompanyMenuView.vue'),
    beforeEnter: authGuard,
  },
  {
    path: '/configuracion',
    name: 'company-configuration',
    component: () => import('@/views/CompanyConfigurationView.vue'),
    beforeEnter: authGuard,
  },
  {
    path: '/editar-menu',
    name: 'company-edit-menu',
    component: () => import('@/views/CompanyEditMenuView.vue'),
    beforeEnter: authGuard,
  },
  {
    path: '/callback',
    name: 'callback',
    component: () => import('@/views/CallbackView.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
});

export default router
