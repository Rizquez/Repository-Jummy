from src.routes import app
from config import current_config


app.config.from_object(current_config)

if __name__ == '__main__':
    app.run(host=current_config.HOST, port=current_config.PORT)

