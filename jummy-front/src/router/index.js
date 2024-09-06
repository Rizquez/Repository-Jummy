import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/',
        name: 'home',
        component: () => import('../views/HomeView.vue')
    },
    {
        path: '/company', 
        name: 'company',
        component: () => import('../views/CompanyView.vue')
    },
    {
        path: '/register-client',
        name: 'register-client',
        component: () => import('../views/RegisterClientView.vue')
    },
    {
        path: '/register-company',
        name: 'register-company',
        component: () => import('../views/RegisterCompanyView.vue')
    },
    {
        path: '/password-recovery',
        name: 'password-recovery',
        component: () => import('../views/PasswordRecoveryView.vue')
    },
    {
        path: '/gastronomy',
        name: 'gastronomy',
        component: () => import('../views/GastronomyView.vue')
    },
    {
        path: '/restaurant/:type',
        name: 'restaurant',
        component: () => import('../views/RestaurantView.vue')
    },
    {
        path: '/company-menu',
        name: 'company-menu',
        component: () => import('../views/CompanyMenuView.vue')
    },
    {
        path: '/configuration',
        name: 'configuration',
        component: () => import('../views/ConfigurationView.vue')
    },

    {
        path: '/look-menu',
        name: 'look-menu',
        component: () => import('../views/LookMenuView.vue')
    },
    {
        path: '/edit-menu',
        name: 'edit-menu',
        component: () => import('../views/EditMenuView.vue')
    }


    



]

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes
});

export default router
