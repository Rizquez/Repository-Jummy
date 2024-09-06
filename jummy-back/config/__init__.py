import os
from .config import ProductionConfig, DevelopmentConfig
from dotenv import load_dotenv
load_dotenv(override=False)

env = os.getenv('FLASK_ENV')
current_config = ProductionConfig if env == 'production' else DevelopmentConfig