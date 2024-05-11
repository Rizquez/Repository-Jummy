# JUMMY - La nueva era de la hostelería digital
Bienvenido a Jummy, la aplicación revolucionaria que transformará la manera en que los restaurantes interactúan con sus clientes. Diseñada para modernizar y optimizar el servicio de hostelería, Jummy permite a los restaurantes gestionar digitalmente sus menús, pedidos y pagos, mejorando la eficiencia operativa y enriqueciendo la experiencia del cliente y permitiendo a los clientes visualizar los diferentes restaurantes separados por gastronomias y autogestionarse las comandas enviandolas directamente a cocina.

## Caracteristicas
- Gestión de Menús Digitales: Facilita a los restaurantes la creación, modificación y visualización de menús digitales atractivos e intuitivos, accesibles directamente desde cualquier dispositivo móvil.
Sistema de Pedidos Integrado: Permite a los clientes realizar pedidos directamente a través de la aplicación, reduciendo tiempos de espera y mejorando la precisión de los pedidos.
- Proceso de Pago Seguro: Ofrece un método de pago integrado y seguro, permitiendo a los clientes pagar sus comandas desde su propio dispositivo, lo que aumenta la seguridad y reduce los riesgos de impago.
- Análisis y Reportes: Proporciona a los restaurantes herramientas de análisis para evaluar el rendimiento de ventas, preferencias de los clientes y más, ayudando a tomar decisiones informadas para mejorar el servicio.
- Soporte Multilingüe: Asegura que tanto operadores como clientes puedan utilizar la aplicación en varios idiomas, ampliando el alcance del servicio.

## Tecnologia
Jummy está construida con tecnologías de punta que aseguran rapidez, seguridad y una excelente experiencia de usuario. Algunas de las tecnologías utilizadas incluyen:
- Backend: Python
- Frontend: VueJs
- Base de datos: MySQL
- Seguridad: Implementación de SSL/TLS (Netlify), autenticación JWT (Auth0)
- Infraestructura: Despliegue en Netlify y almancenamiento de la Base de Datos en Clever Cloud

## Descripcion de las ramas de trabajo en Git
- main: esta es la rama principal, la cual es llevada a `Netlify` para el despliegue y visualizacion de la web.
- develop: esta rama es la que recibie todo el desarrollo nuevo y cambios que se realicen sobre el proyecto, basicamente sera un filtro para evitar que algo que llegue a la rama main sin testear y que pueda dañar algo que se encuentre operativo.
- __dev_pedro__: en esta rama trabaja `Pedro`.
- __dev_mario__: en esta rama trabaja `Mario`.
- __dev_marc__: en esta rama trabaja `Marc`.
- __dev_inigo__: en esta rama trabaja `Iñigo`.

> [!IMPORTANT]
Todas las ramas donde el equipo de desarrollo trabaje tendran que crearse a partir de la rama `develop` de manera excluyente.

> [!NOTE]
La rama `main` es la unica rama que debe tener un directorio `dist`, de manera excluyente, ya que este directorio es el encargado de llevar el despliegue del proyecto a `Netlify`, este direcotirio se debera actualizar en local por cada despliegue que se haga sobre la rama `main`.

## Licencia
Este proyecto está bajo la Licencia GPL-3.0, lo que permite el uso, distribución y modificación del software bajo ciertas condiciones. Consulta el archivo LICENSE para más detalles.