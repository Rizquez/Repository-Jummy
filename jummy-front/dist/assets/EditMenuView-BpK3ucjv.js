import{_ as C,o as v,c as _,f as B,i as m,r as I,b as t,a as e,w,m as P,q as r,v as c,j as g,F as q,d as k,p as S,e as A}from"./index-o6OgyhZr.js";import{_ as E}from"./plato-lujo-C4X_G4ez.js";import{F as U}from"./Footer-CbhFtwWd.js";const M={},$={id:"plato",class:"info-plato"},D=B('<div class="container-info" data-v-920621db><div data-v-920621db><p class="txt-1vw" data-v-920621db>Nombre</p><p class="txt-1vw" data-v-920621db>Descripción</p><p class="txt-1vw" data-v-920621db>Ingredientes</p><p class="txt-1vw" data-v-920621db>Precio</p></div><img src="'+E+'" alt="Imagen plato" data-v-920621db></div>',1),F=[D];function G(d,u){return v(),_("div",$,F)}const a=C(M,[["render",G],["__scopeId","data-v-920621db"]]),o=d=>(S("data-v-7462f345"),d=d(),A(),d),T=o(()=>t("h1",{class:"txt-3vw"},"Carta",-1)),j={class:"container-btn-nav"},z={class:"container-volver-salir"},H={class:"contaniner-dish"},J=o(()=>t("p",{class:"txt-1-5vw"},"Entrantes",-1)),K={class:"lista-platos"},L={class:"contaniner-dish"},O=o(()=>t("p",{class:"txt-1-5vw"},"Principales",-1)),Q={class:"lista-platos"},R={class:"contaniner-dish"},W=o(()=>t("p",{class:"txt-1-5vw"},"Bebidas",-1)),X={class:"lista-platos"},Y={class:"contaniner-dish"},Z=o(()=>t("p",{class:"txt-1-5vw"},"Postres",-1)),tt={class:"lista-platos"},et={class:"boton-anadir-container"},ot={key:0,class:"modal"},st=o(()=>t("h2",null,"Añadir Nuevo Plato",-1)),at=o(()=>t("label",{for:"nombre-plato"},"Nombre:",-1)),nt=o(()=>t("label",{for:"descripcion"},"Descripción:",-1)),it=o(()=>t("label",{for:"ingredientes"},"Ingredientes:",-1)),lt=o(()=>t("label",{for:"precio"},"Precio:",-1)),dt=o(()=>t("button",{type:"submit"},"Guardar",-1)),rt={key:0,class:"modal"},ct=o(()=>t("h2",null,"Añadir Nueva Bebida",-1)),ut=o(()=>t("label",{for:"nombre-bebida"},"Nombre:",-1)),pt=o(()=>t("label",{for:"precio-bebida"},"Precio:",-1)),vt=o(()=>t("button",{type:"submit"},"Guardar",-1)),_t={__name:"EditMenu",setup(d){const u=m(!1),b=m(!1),i=m({nombre:"",descripcion:"",ingredientes:"",precio:0}),p=m({nombre:"",precio:0}),l=()=>{u.value=!0},h=()=>{u.value=!1},V=()=>{console.log("Nuevo plato:",i.value),h()},y=()=>{b.value=!0},f=()=>{b.value=!1},N=()=>{console.log("Nueva bebida:",p.value),f()};return(mt,s)=>{const x=I("router-link");return v(),_(q,null,[T,t("div",j,[t("div",null,[t("ul",null,[t("li",null,[t("button",{class:"txt-1-5vw",onClick:l},"Entrantes")]),t("li",null,[t("button",{class:"txt-1-5vw",onClick:l},"Principales")]),t("li",null,[t("button",{class:"txt-1-5vw",onClick:l},"Postres")]),t("li",null,[t("button",{class:"txt-1-5vw",onClick:y},"Bebidas")])])]),t("div",z,[e(x,{to:"/company",class:"btn-volver-salir txt-1-5vw"},{default:w(()=>[k("Salir")]),_:1}),e(x,{to:"/company-menu",class:"btn-volver-salir txt-1-5vw"},{default:w(()=>[k("Volver")]),_:1})])]),t("div",H,[J,t("div",{class:"contaniner-anadir"},[t("button",{class:"anadir",onClick:l},"Añadir plato")]),t("div",K,[e(a),e(a),e(a)])]),t("div",L,[O,t("div",{class:"contaniner-anadir"},[t("button",{class:"anadir",onClick:l},"Añadir plato")]),t("div",Q,[e(a),e(a),e(a)])]),t("div",R,[W,t("div",{class:"contaniner-anadir"},[t("button",{class:"anadir",onClick:l},"Añadir plato")]),t("div",X,[e(a),e(a),e(a)])]),t("div",Y,[Z,t("div",{class:"contaniner-anadir"},[t("button",{class:"anadir",onClick:l},"Añadir plato")]),t("div",tt,[e(a),e(a),e(a)])]),t("div",et,[u.value?(v(),_("div",ot,[st,t("form",{onSubmit:P(V,["prevent"])},[t("div",null,[at,r(t("input",{type:"text",id:"nombre-plato","onUpdate:modelValue":s[0]||(s[0]=n=>i.value.nombre=n),required:""},null,512),[[c,i.value.nombre]])]),t("div",null,[nt,r(t("textarea",{id:"descripcion","onUpdate:modelValue":s[1]||(s[1]=n=>i.value.descripcion=n),required:""},null,512),[[c,i.value.descripcion]])]),t("div",null,[it,r(t("textarea",{id:"ingredientes","onUpdate:modelValue":s[2]||(s[2]=n=>i.value.ingredientes=n),required:""},null,512),[[c,i.value.ingredientes]])]),t("div",null,[lt,r(t("input",{type:"number",id:"precio","onUpdate:modelValue":s[3]||(s[3]=n=>i.value.precio=n),required:""},null,512),[[c,i.value.precio]])]),t("div",{class:"modal-buttons"},[dt,t("button",{type:"button",onClick:h},"Cancelar")])],32)])):g("",!0)]),b.value?(v(),_("div",rt,[ct,t("form",{onSubmit:P(N,["prevent"])},[t("div",null,[ut,r(t("input",{type:"text",id:"nombre-bebida","onUpdate:modelValue":s[4]||(s[4]=n=>p.value.nombre=n),required:""},null,512),[[c,p.value.nombre]])]),t("div",null,[pt,r(t("input",{type:"number",id:"precio-bebida","onUpdate:modelValue":s[5]||(s[5]=n=>p.value.precio=n),required:""},null,512),[[c,p.value.precio]])]),t("div",{class:"modal-buttons"},[vt,t("button",{type:"button",onClick:f},"Cancelar")])],32)])):g("",!0),e(U)],64)}}},bt=C(_t,[["__scopeId","data-v-7462f345"]]),wt={__name:"EditMenuView",setup(d){return(u,b)=>(v(),_("main",null,[e(bt)]))}};export{wt as default};
