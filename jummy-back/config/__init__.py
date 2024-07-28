import os
from .config import ProductionConfig, DevelopmentConfig
from dotenv import load_dotenv
load_dotenv(override=False)

env = os.getenv('FLASK_ENV')

# Asignamos el tipo de configuracion segun el entorno de ejecucion
current_config = ProductionConfig if env == 'production' else DevelopmentConfig