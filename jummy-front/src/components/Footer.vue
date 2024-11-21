<script setup>
import { defineProps } from 'vue';

const props = defineProps({
    showReturn: {
        type: Boolean,
        default: false
    }
})
</script>

<template>    
    <footer>
        <p v-if="showReturn" class="txt-1vw" xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/">Diseñado y creado por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.linkedin.com/in/pedro-rizquez/" target="_blank">Pedro Rizquez</a>, <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.linkedin.com/in/marc-barranco-cordero-535174269/" target="_blank">Marc Barranco</a> y <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://www.linkedin.com/in/mario-vergara-carballo-75a421221/" target="_blank">Mario Vergara</a></p>
        <p class="txt-1vw">© 2024 All rights reserved - Jummy</p>
    </footer>
</template>

<style scoped>
@import '@/assets/styles/fonts.css';

footer {
    padding-top: 40px;
}

footer p {
    text-align: center;
}

footer a {
    text-decoration: none;
    color: var(--text-100);
}

</style>
