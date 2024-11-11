/**
 * Valida y modifica el valor de entrada permitiendo solo numeros.
 *
 * Reemplaza cualquier caracter que no sea un digito (0-9) en el valor del campo 
 * de entrada, asegurando que el usuario solo pueda ingresar numeros.
 *
 * @param {Event} event - El evento de entrada que contiene el valor a validar.
 */
export const validateNumber = (event) => {
    event.target.value = event.target.value.replace(/[^0-9]/g, '');
};


/**
 * Maneja el timepo de solicitudes fetch y evita que se rompa debido a un timeout.
 */
export const fetchWithTimeout = (url, options = {}, timeout) => {
  const controller = new AbortController();
  const { signal } = controller;
  const config = { ...options, signal };

  return new Promise((resolve, reject) => {
    const timer = setTimeout(() => {
      controller.abort();
      reject(new Error('La solicitud ha excedido el tiempo de espera'));
    }, timeout);

    fetch(url, config)
      .then((response) => {
        clearTimeout(timer);
        resolve(response);
      })
      .catch((error) => {
        clearTimeout(timer);
        reject(error);
      });
  });
};
  