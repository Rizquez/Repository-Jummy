import{_,i as h,e as l,u as w,r as y,o as u,c as b,a as t,s as x,w as C,d as k,m as B,f as V,v as T,b as M,F as N}from"./index-C7sFuX6X.js";import{A as S,f as j}from"./utils-BWzuYXJq.js";const E="/assets/img-gastronomy-Ct5MVBOZ.png",J={class:"contenedor-fijo"},O={class:"contenedor-general"},R={class:"salir-volver"},H={class:"contenedor-general"},L={__name:"HeaderClient",props:{showReturn:{type:Boolean,default:!1}},setup(c){const d=h(),n=l(""),o=l(""),s=l(!1),{logout:m}=w(),v=()=>{m({returnTo:window.location.origin})},p=()=>{s.value=!1,window.location.reload()};async function f(){const r=n.value.trim();if(r)try{const e=await j("https://api-jummy.onrender.com/find-restaurants",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({nombre_comercial:r})},1e4);if(e.status===200){const a=(await e.json()).data,g=a[0].gastronomia;sessionStorage.setItem("restaurantes",JSON.stringify(a)),d.push({name:"client-restaurant",params:{type:g},query:{reload:Date.now()}})}else e.status===404?(o.value="El restaurante solicitado no se encuentra registrado en Jummy",s.value=!0):(o.value=`Error inesperado en el servidor
${e.statusText} 🛠️`,s.value=!0)}catch(e){o.value=e.message.includes("tiempo de espera")?"La solicitud ha excedido el tiempo de espera. Por favor, intentelo de nuevo más tarde":"Error inesperado durante la solicitud",s.value=!0}}return(r,e)=>{const i=y("router-link");return u(),b(N,null,[t("header",null,[t("div",J,[e[2]||(e[2]=t("img",{src:E,alt:"Logo Gastronomias"},null,-1)),t("div",O,[t("div",R,[t("p",{class:"boton-salir txt-1-5vw",onClick:v},"Salir"),c.showReturn?(u(),x(i,{key:0,to:{name:"client-gastronomy"},class:"boton-salir txt-1-5vw boton-volver"},{default:C(()=>e[1]||(e[1]=[k("Volver")])),_:1})):B("",!0)]),t("div",H,[V(t("input",{"onUpdate:modelValue":e[0]||(e[0]=a=>n.value=a),class:"barra txt-1-5vw",type:"text",placeholder:"Busca en Jummy"},null,512),[[T,n.value]]),t("button",{onClick:f,class:"boton-buscador txt-1-5vw"},"Buscar")])])])]),M(S,{message:o.value,visible:s.value,onClose:p},null,8,["message","visible"])],64)}}},F=_(L,[["__scopeId","data-v-7e37bc51"]]);export{F as H};