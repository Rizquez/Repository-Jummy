# -------------------------------------------------------------------------------------------------------------------------------------------------
# IMPORTACION DE LIBRERIAS
# -------------------------------------------------------------------------------------------------------------------------------------------------
import os
import time
import pandas as pd
from sqlalchemy.engine.url import URL
from sqlalchemy import create_engine, text
from sqlalchemy.exc import OperationalError
from dotenv import load_dotenv
load_dotenv(override=False)
# -------------------------------------------------------------------------------------------------------------------------------------------------

class MySQLDataManager():
    """
    Apply
    -----
    CLASE PARA GESTIONAR LAS FUNCINES QUE REALIZAR CONSULTAS EN LA BBDD DE MYSQL. 

    Public Methods
    --------------
    - `create_engine_mysql`
    - `table_query`
    """

    @classmethod
    def create_engine_mysql(self, max_retries=30, delay=30):
        """
        Apply
        -----
        Método para realizar la conexión a la base de datos MySQL utilizando SQLAlchemy.

        Parameters
        ----------
        max_retries: `int` - Default:`10`
            Cantidad máxima de veces que se desea realizar los intentos de conexión.

        delay: `int` - Default `30`
            Tiempo (en segundos) que esperará el método para reintentar cada conexión en 
            caso de que no se haya logrado.

        Returns
        -------
        - Objeto SQLAlchemy.Engine de la librería SQLAlchemy.
        """
        # Extraemos los datos de conexión de las variables de entorno
        db = os.getenv('MYSQL_DB')
        host = os.getenv('MYSQL_HOST')
        user = os.getenv('MYSQL_USER')
        password = os.getenv('MYSQL_PASSWORD')

        # Creamos la URL de conexion
        url_connection = URL.create(
            drivername='mysql+pymysql',
            username=user,
            password=password,
            host=host,
            database=db
        )

        # Vamos a realizar un bucle for sobre 
        # la cantidad de intentos maximos requeridos
        for attempt in range(max_retries):
            try:
                # Probamos crear el engine con la URL 
                # de conexion y retornarlo
                return create_engine(url_connection)

            # En caso contrario reintentamos la conexion 
            # hasta el maximo de intentos y luego retornamos 
            # un error
            except OperationalError:
                if attempt < max_retries - 1:
                    time.sleep(delay)
                else:
                    raise

    @classmethod
    def table_query(self, engine, consulta, params=None):
        """
        Apply
        -----
        Método para realizar una consulta sobre una BBDD MySQL y devolver un DataFrame de pandas.

        Parameters
        ----------
        engine: `SQLAlchemy.Engine`
            Objeto engine de la librería SQLAlchemy generado mediante el método `create_engine_mysql`.

        consulta: `str`
            Consulta en SQL para realizar sobre la base de datos en la cual se generó el objeto engine.

        params: `dict`
            Default: None
            Diccionario que sirve para indicar el valor de los parámetros que son necesarios para la 
            ejecución de la consulta de SQL.

        Returns
        -------
        - DataFrame con la tabla o el conjunto de datos de la tabla que se quiso extraer de la base de datos.
        """
        with engine.begin() as connection:
            df = pd.read_sql_query(text(consulta), connection, params=params)
            return df

    # @classmethod
    # def simple_query(self, engine, consulta, type_data='simple', params=None):
    #     """
    #     Apply
    #     -----
    #     Metodo para realizar una consulta sencilla sobre cualquier BBDD, este 
    #     metodo funciona tanto para las consultas de SQL Server.

    #     Parameters
    #     ----------
    #     engine: `SQLAlchemy.Engine`
    #         Objeto engine de la libreria SQLAlchemy generado mediante el metodo 
    #         de conexion a la BBDD.

    #     consulta: `str`
    #         Consulta en SQL para realizar sobre la bbdd en la cual se genero el 
    #         objeto engine.

    #     type_data: `str` - Default `simple`
    #         Indica con `simple` si se retorna un valor unico o con `multi` si se 
    #         retornan varios valores.

    #     params: `dict` - Default `None`
    #         Diccionario que sirve para indicar el valor de los parametros que son 
    #         necesarios para la ejecucion de la consulta de SQL.

    #     Returns
    #     -------
    #     - Tupla con la lista de los datos retornado de las diferentes columnas que se 
    #     solicitaron en la consulta, es importante que cuando se retornen los datos se 
    #     indice mediante el uso del indice `0` que se desea el primer valor de la tupla 
    #     que sera la lista antes mencionada.
    #     """
    #     # Verificamos si el tipo de dato es multi o simple
    #     if type_data not in ['simple', 'multi']:
    #         raise ValueError("El parametro 'type_data' debe ser 'simple' o 'multi'")
        
    #     # Abrimos la conexion y capturamos los resultados devolviendo un tipo de dato en funcion de la cantidad de datos solicitados
    #     with engine.connect() as conn:
    #         result = conn.execute(text(consulta), params)
    #         data = result.fetchone() if type_data == 'simple' else result.fetchall()
    #         return data[0] if data else None
        
    @classmethod
    def simple_query(self, engine, consulta, type_data='simple', params=None):
        """
        Apply
        -----
        Metodo para realizar una consulta sencilla sobre cualquier BBDD.

        Parameters
        ----------
        engine: `SQLAlchemy.Engine`
            Objeto engine de la libreria SQLAlchemy generado mediante el metodo 
            de conexion a la BBDD.

        consulta: `str`
            Consulta en SQL para realizar sobre la bbdd en la cual se genero el 
            objeto engine.

        type_data: `str` - Default `simple`
            Indica con `simple` si se retorna un valor unico o con `multi` si se 
            retornan varios valores.

        params: `dict` - Default `None`
            Diccionario que sirve para indicar el valor de los parametros que son 
            necesarios para la ejecucion de la consulta de SQL.

        Returns
        -------
        - Un diccionario con los datos retornados o None si no hay resultados.
        """
        if type_data not in ['simple', 'multi']:
            raise ValueError("El parametro 'type_data' debe ser 'simple' o 'multi'")

        with engine.connect() as conn:
            result = conn.execute(text(consulta), params)

        if "INSERT" in consulta or "UPDATE" in consulta or "DELETE" in consulta:
            conn.commit()  # Asegúrate de confirmar la transacción
            return None  # Retorna None para operaciones de modificación

        data = result.fetchone() if type_data == 'simple' else result.fetchall()
        return data[0] if data else None