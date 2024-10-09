import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/',
        name: 'client-home',
        component: () => import('@/views/ClientHomeView.vue')
    },
    {
        path: '/', 
        name: 'company-home',
        component: () => import('@/views/CompanyHomeView.vue')
    },
    {
        path: '/registro',
        name: 'client-register',
        component: () => import('@/views/ClientRegisterView.vue')
    },
    {
        path: '/registro',
        name: 'company-register',
        component: () => import('@/views/CompanyRegisterView.vue')
    },
    {
        path: '/recuperar-cuenta',
        name: 'password-recovery',
        component: () => import('@/views/PasswordRecoveryView.vue')
    },
    {
        path: '/gastronomia',
        name: 'client-gastronomy',
        component: () => import('@/views/ClientGastronomyView.vue')
    },
    {
        path: '/restaurante/:type',
        name: 'client-restaurant',
        component: () => import('@/views/ClientListRestaurantView.vue')
    },
    {
        path: '/empresa',
        name: 'company-menu',
        component: () => import('@/views/CompanyMenuView.vue')
    },
    {
        path: '/configuracion',
        name: 'company-configuration',
        component: () => import('@/views/CompanyConfigurationView.vue')
    },
    {
        path: '/editar-menu',
        name: 'company-edit-menu',
        component: () => import('@/views/CompanyEditMenuView.vue')
    }
]

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
});

export default router
