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
  