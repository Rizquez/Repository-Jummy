import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/',
        name: 'home',
        component: () => import('@/views/ClientHomeView.vue')
    },
    {
        path: '/company', 
        name: 'company',
        component: () => import('@/views/CompanyHomeView.vue')
    },
    {
        path: '/register-client',
        name: 'client-register',
        component: () => import('@/views/ClientRegisterView.vue')
    },
    {
        path: '/register-company',
        name: 'company-register',
        component: () => import('@/views/CompanyRegisterView.vue')
    },
    {
        path: '/password-recovery',
        name: 'password-recovery',
        component: () => import('@/views/PasswordRecoveryView.vue')
    },
    {
        path: '/gastronomy',
        name: 'clien-gastronomy',
        component: () => import('@/views/ClientGastronomyView.vue')
    },
    {
        path: '/restaurant/:type',
        name: 'client-restaurant',
        component: () => import('@/views/ClientListRestaurantView.vue')
    },
    {
        path: '/company-menu',
        name: 'company-menu',
        component: () => import('@/views/CompanyMenuView.vue')
    },
    {
        path: '/configuration',
        name: 'company-configuration',
        component: () => import('@/views/CompanyConfigurationView.vue')
    },
    {
        path: '/edit-menu',
        name: 'company-edit-menu',
        component: () => import('@/views/CompanyEditMenuView.vue')
    }
]

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
});

export default router
