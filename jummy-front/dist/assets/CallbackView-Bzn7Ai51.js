import{_ as l,q as n,c,a as u,u as m,o as p}from"./index-DAxF9yY8.js";const f={__name:"CallbackView",setup(d){const{isAuthenticated:o,user:t,isLoading:i}=m();return n.beforeEach((a,r,e)=>{if(i.value)return e();if(o.value&&t.value){const s=t.value.nickname;return s==="comensal"&&a.path!=="/gastronomia"?e("/gastronomia"):s==="restaurante"&&a.path!=="/empresa"?e("/empresa"):e()}return e()}),n.afterEach((a,r)=>{o.value&&window.location.reload()}),(a,r)=>(p(),c("div",null,r[0]||(r[0]=[u("p",null,"Cargando Jummy...",-1),u("p",null,"Espere un momento mientras verificamos los datos de autenticacion 😉",-1)])))}},v=l(f,[["__scopeId","data-v-97b2103b"]]);export{v as default};
