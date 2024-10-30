# -------------------------------------------------------------------------------------------------------------------------------------------------
# IMPORTACION DE LIBRERIAS
# -------------------------------------------------------------------------------------------------------------------------------------------------
import os
import time
from sqlalchemy.engine.url import URL
from sqlalchemy import create_engine, text
from sqlalchemy.exc import OperationalError
from .._design.singleton import SingletonMeta
from dotenv import load_dotenv
load_dotenv(override=False)
# -------------------------------------------------------------------------------------------------------------------------------------------------

class MySQLDataManager(metaclass=SingletonMeta):

    def __init__(self):
        self._config = {
            'db': os.getenv('MYSQL_DB'),
            'host': os.getenv('MYSQL_HOST'),
            'user': os.getenv('MYSQL_USER'),
            'password': os.getenv('MYSQL_PASSWORD')
        }
        self._engine = {}

    def __create_connection(self):

        url_connection = URL.create(
            drivername='mysql+pymysql',
            username=self._config['user'],
            password=self._config['password'],
            host=self._config['host'],
            database=self._config['db']
        )
        engine = create_engine(url_connection)
        return engine


    def engine_mysql(self, max_retries=10, delay=60):

        if self._config['db'] in self._engine:
            return self._engine[self._config['db']]

        engine = self.__create_connection()

        for attempt in range(max_retries):
            try:
                with engine.connect() as conn:
                    conn.execute(text("SELECT 1"))
                self._engine[self._config['db']] = engine
                return engine
            except OperationalError:
                if attempt < max_retries - 1:
                    time.sleep(delay)
                else:
                    raise RuntimeError(f"Database: Failed to connect to {self._config['db']} after {max_retries} attempts")

    def simple_query(self, engine, query, type_data='simple', params=None):

        if type_data not in ['simple', 'multi']:
            raise ValueError("El parametro 'type_data' debe ser 'simple' o 'multi'")

        with engine.connect() as conn:
            result = conn.execute(text(query), params)
            data = result.fetchone() if type_data == 'simple' else result.fetchall()

            if data is None:
                return None

            if type_data == 'simple':
                return {column: value for column, value in zip(result.keys(), data)}
            return [dict(zip(result.keys(), row)) for row in data]
        
    def execute_dml_query(self, engine, query, params=None):
        with engine.begin() as conn:
            result = conn.execute(text(query), params)
            return result.rowcount

    def close_engines(self):
        for engine in self._engine.values():
            engine.dispose()
        self._engine.clear()
        