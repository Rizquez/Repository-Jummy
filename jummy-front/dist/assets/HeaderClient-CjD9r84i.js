import{_ as x,i as C,e as i,u,r as S,o as c,c as O,a as s,s as T,w as k,d as N,m as B,f as V,v as j,b as E,F as J}from"./index-D73NRxAB.js";import{A as M,f as m}from"./utils-CQI9Zwo-.js";const L="/assets/img-gastronomy-Ct5MVBOZ.png",P={class:"contenedor-fijo"},A={class:"contenedor-general"},R={class:"salir-volver"},D={class:"contenedor-general"},H={__name:"HeaderClient",props:{showReturn:{type:Boolean,default:!1}},setup(p){const d=C(),l=i(""),o=i(""),a=i(!1),{isAuthenticated:I,user:v,isLoading:q}=u(),f=v.value.name,{logout:g}=u(),h=()=>{sessionStorage.clear(),g({returnTo:window.location.origin})},y=()=>{a.value=!1,window.location.reload()};async function _(){const t=l.value.trim();if(t)try{const e=await m("https://api-jummy.onrender.com/find-restaurants",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({nombre_comercial:t})},1e4);if(e.status===200){const n=(await e.json()).data,b=n[0].gastronomia;sessionStorage.setItem("restaurantes",JSON.stringify(n)),d.push({name:"client-restaurant",params:{type:b},query:{reload:Date.now()}})}else e.status===404?(o.value="El restaurante solicitado no se encuentra registrado en Jummy",a.value=!0):(o.value=`Error inesperado en el servidor
${e.statusText} 🛠️`,a.value=!0)}catch(e){o.value=e.message.includes("tiempo de espera")?"La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo más tarde":"Error inesperado durante la solicitud",a.value=!0}}async function w(){try{const t=await m("https://api-jummy.onrender.com/get-orders",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({email_comensal:f})},1e4);if(t.status===200){const r=(await t.json()).data;sessionStorage.setItem("allOrders",JSON.stringify(r)),d.push({name:"client-orders",query:{reload:Date.now()}})}else t.status===500?(o.value="No se han podido obtener el resumen de los pedidos",a.value=!0):(o.value=`Error inesperado en el servidor
${t.statusText} 🛠️`,a.value=!0)}catch(t){o.value=t.message.includes("tiempo de espera")?"La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo más tarde":"Error inesperado durante la solicitud",a.value=!0}}return(t,e)=>{const r=S("router-link");return c(),O(J,null,[s("header",null,[s("div",P,[e[2]||(e[2]=s("img",{src:L,alt:"Logo Gastronomias"},null,-1)),s("div",A,[s("div",R,[s("p",{class:"boton-salir txt-1-5vw boton-volver",onClick:w},"Pedidos"),s("p",{class:"boton-salir txt-1-5vw",onClick:h},"Salir"),p.showReturn?(c(),T(r,{key:0,to:{name:"client-gastronomy"},class:"boton-salir txt-1-5vw boton-volver"},{default:k(()=>e[1]||(e[1]=[N("Volver")])),_:1})):B("",!0)]),s("div",D,[V(s("input",{"onUpdate:modelValue":e[0]||(e[0]=n=>l.value=n),class:"barra txt-1-5vw",type:"text",placeholder:"Busca en Jummy"},null,512),[[j,l.value]]),s("button",{onClick:_,class:"boton-buscador txt-1-5vw"},"Buscar")])])])]),E(M,{message:o.value,visible:a.value,onClose:y},null,8,["message","visible"])],64)}}},G=x(H,[["__scopeId","data-v-b267c793"]]);export{G as H};
