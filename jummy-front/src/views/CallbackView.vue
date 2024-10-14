<script setup>
import { useAuth0 } from '@auth0/auth0-vue';
import router from '@/router';

router.beforeEach((to, from, next) => {
    const { isAuthenticated, user, isLoading } = useAuth0();

    // Esperamos hasta que la autenticacion este cargada
    if (isLoading.value) {
        return next();
    }

    // Varificamos si el usuario esta autenticado y existen datos sobre el
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
</script>

<template>
    <div>
        <p>Cargando Jummy...</p>
        <p>Espere un momento mientras verificamos los datos de autenticacion 😉</p>
    </div>
</template>

<style scoped>
p {
    font-size: 1vw;
    font-weight: lighter;
}

div {
    display: grid;
    place-items: center;
    padding-top: 20%;
}
</style>
