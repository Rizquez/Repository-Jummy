import{_ as p}from"./logo-jummy-CBtbNno0.js";import{_,e as v,k as f,c as a,a as o,b as n,w as g,F as w,p as y,r as k,o as s,d as C,s as O,u as x}from"./index-D73NRxAB.js";import{F as V}from"./Footer-ByYSq2Vq.js";import{O as b}from"./Order-BFsGILgm.js";import"./utils-CQI9Zwo-.js";const B={class:"container-general"},F={class:"btn-volver-container"},N={class:"order"},S={__name:"CompanyOrdersView",setup(h){const t=v([]),l=()=>{const e=JSON.parse(sessionStorage.getItem("allOrdersCompany"));e&&Array.isArray(e)&&(t.value=e)};f(()=>{l()});const{logout:i}=x(),c=()=>{sessionStorage.clear(),i({returnTo:window.location.origin})};return(e,r)=>{const d=k("router-link");return s(),a("main",null,[o("div",B,[r[1]||(r[1]=o("img",{src:p,alt:"Logo Jummy"},null,-1)),o("div",null,[o("div",{class:"btn-volver-container"},[o("p",{class:"boton-salir txt-1-5vw",onClick:c},"Salir")]),o("div",F,[n(d,{to:{name:"company-menu"},class:"btn-volver txt-1-5vw"},{default:g(()=>r[0]||(r[0]=[C("Volver")])),_:1})])])]),o("div",N,[(s(!0),a(w,null,y(t.value,(m,u)=>(s(),O(b,{showComensal:!0,key:u,order:m},null,8,["order"]))),128))]),n(V)])}}},E=_(S,[["__scopeId","data-v-c7fad140"]]);export{E as default};
