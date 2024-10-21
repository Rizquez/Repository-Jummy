// Función para realizar la petición a la API con manejo de timeout y control de respuestas HTTP
async function fetchData(url) {
    const timeoutDuration = 5000; // 5 segundos de timeout
  
    try {
      // Timeout para la petición
      const response = await Promise.race([
        fetch(url),
        new Promise((_, reject) => setTimeout(() => reject(new Error('Request timed out')), timeoutDuration))
      ]);
  
      // Manejo de diferentes códigos de estado HTTP
      if (response.ok) {
        const data = await response.json();
        return data;  // Retorna los datos en caso de éxito
      } else {
        switch (response.status) {
          case 404:
            throw new Error('Recurso no encontrado (404)');
          case 401:
            throw new Error('No autorizado (401)');
          case 500:
            throw new Error('Error en el servidor (500)');
          default:
            throw new Error(`Error desconocido (${response.status})`);
        }
      }
    } catch (error) {
      // Devuelve el error para ser gestionado por el componente
      throw new Error(error.message);
    }
  }
  
  // Función para cargar los restaurants desde la API
  async function loadRestaurants() {
    const url = 'https://api-jummy.onrender.com/gastronomia';
    try {
      const restaurants = await fetchData(url);
      return restaurants; // Retorna los restaurants obtenidos
    } catch (error) {
      console.error(`Error al cargar los restaurantes: ${error.message}`);
      throw error;  // Propaga el error para que sea manejado
    }
  }
  
  // Función para cargar los platos desde la API
  async function loadDishes() {
    const url = 'https://api-jummy.onrender.com/platos';
    try {
      const dishes = await fetchData(url);
      return dishes; // Retorna los platos obtenidos
    } catch (error) {
      console.error(`Error al cargar los platos: ${error.message}`);
      throw error;  // Propaga el error para que sea manejado
    }
  }
  
  // Exportar las funciones para su uso en los componentes Vue
  export { loadRestaurants, loadDishes };
  