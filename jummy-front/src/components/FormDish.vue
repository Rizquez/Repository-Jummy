<template>
    <div class="form-center">
        <form>
            <input type="text" required/>
            <input type="text" required/>
            <input type="text" required/>
            <input type="text" required/>
        </form>
        <img src="@/assets/images/temp/plato-lujo.jpeg" alt="Imagen plato" />
    </div>
</template>

<style scoped> 
@import '@/assets/styles/fonts.css';

.form-center {
  display: flex;
  justify-content: center;
  align-items: center;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
  padding: 2%;
}

.form-center div {
    display: flex;
    flex-direction: row;
}

.form-center img {
    width: 40%;
    height: auto;
    padding-left: 5%;
}

input[type="text"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 3px solid var(--primary-300);
  border-radius: 20px;
  box-sizing: border-box;
}
</style>
