import{_ as b}from"./plato-lujo-C4X_G4ez.js";import{_ as f,j as p,e as j,k as y,l as O,c as s,b as r,a as e,n as S,t as l,m as x,F as w,p as z,o,w as k,d as C,q as T,r as M}from"./index-C7sFuX6X.js";import{H as P}from"./HeaderClient-CzzOfAvK.js";import{F as V}from"./Footer-BgenQNGK.js";import"./utils-BWzuYXJq.js";const h="/assets/espanola-CcoLI5Q9.jpg",R=Object.freeze(Object.defineProperty({__proto__:null,default:h},Symbol.toStringTag,{value:"Module"})),I="/assets/italiana-YmPihHKZ.jpg",N=Object.freeze(Object.defineProperty({__proto__:null,default:I},Symbol.toStringTag,{value:"Module"})),B="/assets/japonesa-DBcEw1l2.jpg",D=Object.freeze(Object.defineProperty({__proto__:null,default:B},Symbol.toStringTag,{value:"Module"})),F="/assets/mexicana-TOaxGue_.jpg",L=Object.freeze(Object.defineProperty({__proto__:null,default:F},Symbol.toStringTag,{value:"Module"})),H="/assets/tailandesa-DR3gg1Rn.jpg",q=Object.freeze(Object.defineProperty({__proto__:null,default:H},Symbol.toStringTag,{value:"Module"})),E="/assets/venezolana-1Op0Yn8v.jpg",U=Object.freeze(Object.defineProperty({__proto__:null,default:E},Symbol.toStringTag,{value:"Module"})),Y={class:"contenedor-scroll"},$={class:"lista-restaurantes"},G={class:"container-info"},J={class:"txt-1vw"},K={class:"txt-1vw"},Q={__name:"ClientListRestaurantView",setup(Z){const i=T(),n=p(()=>i.params.type),c=j([]),m=Object.assign({"/src/assets/images/gastronomy/espanola.jpg":R,"/src/assets/images/gastronomy/italiana.jpg":N,"/src/assets/images/gastronomy/japonesa.jpg":D,"/src/assets/images/gastronomy/mexicana.jpg":L,"/src/assets/images/gastronomy/tailandesa.jpg":q,"/src/assets/images/gastronomy/venezolana.jpg":U}),_=p(()=>{var t;return(t=m[`/src/assets/images/gastronomy/${n.value}.jpg`])==null?void 0:t.default}),u=()=>{const t=sessionStorage.getItem("restaurantes");t&&(c.value=JSON.parse(t))};return y(()=>{u()}),O([n,()=>i.query.reload],()=>{u()}),(t,a)=>{const d=M("router-link");return o(),s("main",null,[r(P,{"show-return":!0}),e("div",Y,[_.value?(o(),s("button",{key:0,class:"boton-gastronomia txt-1-5vw",style:S({backgroundImage:`url(${_.value})`})},l(n.value.toUpperCase()),5)):x("",!0)]),e("div",$,[(o(!0),s(w,null,z(c.value,(g,v)=>(o(),s("div",{key:v,id:"restaurante",class:"info-restaurante"},[e("div",G,[e("div",null,[e("p",J,l(g.nombre_comercial),1),e("p",K,l(g.descripcion),1)]),a[0]||(a[0]=e("img",{src:b,alt:"Imagen plato"},null,-1))]),r(d,{to:{name:"client-gastronomy"},class:"btn-carta txt-1vw"},{default:k(()=>a[1]||(a[1]=[C("Ver carta")])),_:1})]))),128))]),r(V)])}}},ae=f(Q,[["__scopeId","data-v-48226bc3"]]);export{ae as default};