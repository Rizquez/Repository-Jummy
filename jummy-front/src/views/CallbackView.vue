<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import router from '@/router';

const { isAuthenticated, user, isLoading } = useAuth0();

router.beforeEach((to, from, next) => {

    // Esperamos hasta que la autenticacion este cargada
    if (isLoading.value) {
        return next();
    }

    // Verificamos si el usuario esta autenticado y existen datos sobre el
    if (isAuthenticated.value && user.value) {

        // Sobre el nickname vamos a realizar la redirecion en funcion del tipo de usuario
        const nickname = user.value.nickname;
        if (nickname === 'comensal' && to.path !== '/gastronomia') {
            return next('/gastronomia');
        } else if (nickname === 'restaurante' && to.path !== '/empresa') {
            return next('/empresa');
        } else {
            return next();
        }
    }
    return next();
});

// Recargamos la vista para evitar errores de redireccionado sobre el router-link
router.afterEach((to, from) => {
    if (isAuthenticated.value) {
        window.location.reload();
    }
});
</script>

<template>
    <p>Cargando Jummy...</p>
</template>

<style scoped>
</style>
