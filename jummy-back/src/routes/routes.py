from flask import Flask, render_template, redirect, request, send_file, jsonify, url_for
from ..tools import MySQL
from sqlalchemy import text
from sqlalchemy.exc import OperationalError
import bcrypt
import base64


app = Flask(__name__)


@app.route('/', methods=['GET'])
def home():

    if 'gastronomia' in request.args:
        url = url_for('api', **request.args)
        return redirect(url)
    return '<h1>API JUMMY</h1>'

#Ruta que nos permite crear una nueva gastronomia

@app.route('/gastronomia', methods=['POST'])
def create_gastronomia():
    data = request.json
    nombre = data.get('gastronomia')  

    if not nombre:
        return jsonify({'error': 'El campo "gastronomia" es requerido'}), 400

    engine = MySQL.create_engine_mysql()

    
    existing_gastronomia = MySQL.simple_query(
        engine,
        "SELECT id FROM gastronomias WHERE gastronomia=:gastronomia",
        params={'gastronomia': nombre}
    )

    if existing_gastronomia is not None:
        return jsonify({'error': 'Ya existe una gastronomía con ese nombre'}), 409

    
    try:
        with engine.begin() as conn: 
            conn.execute(
                text("INSERT INTO gastronomias (gastronomia) VALUES (:gastronomia)"),
                {'gastronomia': nombre}
            )
        return jsonify({'mensaje': 'Gastronomía creada exitosamente'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#Ruta que nos da acceso a todas las gastronomias
    
@app.route('/gastronomias', methods=['GET'])
def get_gastronomias():
    engine = MySQL.create_engine_mysql()
    
    try:
        data = MySQL.table_query(
            engine,
            "SELECT * FROM gastronomias"
        ).to_dict(orient='records')
        return jsonify(data), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    

    
#Update Gastronomia existente

@app.route('/gastronomia/<int:id_gastronomia>', methods=['PUT'])
def update_gastronomia(id_gastronomia):
    data = request.json

    if data is None:
        return jsonify({'error': 'No se han proporcionado datos'}), 400

    nuevo_nombre = data.get('gastronomia')

    if not nuevo_nombre:
        return jsonify({'error': 'Se requiere un nuevo nombre'}), 400

    engine = MySQL.create_engine_mysql()

    try:
        
        existing_gastronomia = MySQL.simple_query(
            engine,
            "SELECT * FROM gastronomias WHERE id=:id",
            params={'id': id_gastronomia}
        )

        if not existing_gastronomia:
            return jsonify({'error': 'Gastronomía no encontrada'}), 404

        
        nombre_repetido = MySQL.simple_query(
            engine,
            "SELECT id FROM gastronomias WHERE gastronomia=:nuevo_nombre AND id != :id",
            params={'nuevo_nombre': nuevo_nombre, 'id': id_gastronomia}
        )

        if nombre_repetido:
            return jsonify({'error': 'Ya existe una gastronomía con ese nombre'}), 409

        
        with engine.begin() as conn:
            conn.execute(
                text("UPDATE gastronomias SET gastronomia=:nuevo_nombre WHERE id=:id"),
                {'nuevo_nombre': nuevo_nombre, 'id': id_gastronomia}
            )

        return jsonify({'mensaje': 'Gastronomía actualizada exitosamente'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#Método para encontrar UNA gastronomia concreta
    
@app.route('/gastronomia/<int:id_gastronomia>', methods=['GET'])
def get_gastronomia(id_gastronomia):
    engine = MySQL.create_engine_mysql()

    try:
        
        gastronomia = MySQL.simple_query(
            engine,
            "SELECT gastronomia FROM gastronomias WHERE id=:id",
            params={'id': id_gastronomia}
        )

        
        if gastronomia is None:
            return jsonify({'error': 'Gastronomía no encontrada'}), 404

        return jsonify({'gastronomia': gastronomia}), 200
    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#DELETE Gatronomia
    
@app.route('/gastronomia/<int:id_gastronomia>', methods=['DELETE'])
def delete_gastronomia(id_gastronomia):
    engine = MySQL.create_engine_mysql()

   
    existing_gastronomia = MySQL.simple_query(
        engine,
        "SELECT * FROM gastronomias WHERE id=:id",
        params={'id': id_gastronomia}
    )

    if not existing_gastronomia:
        return jsonify({'error': 'Gastronomía no encontrada'}), 404

    try:
        
        with engine.begin() as conn:
            conn.execute(
                text("DELETE FROM gastronomias WHERE id=:id"),
                {'id': id_gastronomia}
            )

        return jsonify({'mensaje': 'Gastronomía eliminada exitosamente'}), 200
    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    

#Ruta para crear un restaurante

@app.route('/restaurante', methods=['POST'])
def create_restaurante():
    data = request.json
    cif = data.get('cif')
    nombre_fiscal = data.get('nombre_fiscal')
    direccion_fiscal = data.get('direccion_fiscal')
    localidad = data.get('localidad')
    cp = data.get('cp')
    telefono = data.get('telefono')
    email = data.get('email')
    nombre_comercial = data.get('nombre_comercial')
    descripcion = data.get('descripcion')
    logo = data.get('logo')  # Opcional
    password = data.get('password')
    id_gastronomia = data.get('id_gastronomia')

    
    required_fields = [
        ('cif', 'El CIF es requerido'),
        ('nombre_fiscal', 'El nombre fiscal es requerido'),
        ('direccion_fiscal', 'La dirección fiscal es requerida'),
        ('localidad', 'La localidad es requerida'),
        ('cp', 'El código postal es requerido'),
        ('telefono', 'El teléfono es requerido'),
        ('email', 'El email es requerido'),
        ('nombre_comercial', 'El nombre comercial es requerido'),
        ('descripcion', 'La descripción es requerida'),
        ('password', 'La contraseña es requerida'),
        ('id_gastronomia', 'El ID de gastronomía es requerido'),
    ]

    for field, message in required_fields:
        if not data.get(field):
            return jsonify({'error': message}), 400

    engine = MySQL.create_engine_mysql()

    
    existing_restaurante = MySQL.simple_query(
        engine,
        "SELECT id FROM restaurantes WHERE cif=:cif OR nombre_fiscal=:nombre_fiscal OR direccion_fiscal=:direccion_fiscal OR telefono=:telefono OR email=:email",
        params={
            'cif': cif,
            'nombre_fiscal': nombre_fiscal,
            'direccion_fiscal': direccion_fiscal,
            'telefono': telefono,
            'email': email
        }
    )

    if existing_restaurante:
        return jsonify({'error': 'Ya existe un restaurante con esos campos'}), 409

    try:
        with engine.begin() as conn:  
            conn.execute(
                text("INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) VALUES (:cif, :nombre_fiscal, :direccion_fiscal, :localidad, :cp, :telefono, :email, :nombre_comercial, :descripcion, :logo, :password, :id_gastronomia)"),
                {
                    'cif': cif,
                    'nombre_fiscal': nombre_fiscal,
                    'direccion_fiscal': direccion_fiscal,
                    'localidad': localidad,
                    'cp': cp,
                    'telefono': telefono,
                    'email': email,
                    'nombre_comercial': nombre_comercial,
                    'descripcion': descripcion,
                    'logo': logo,  # Puede ser None si no se proporciona
                    'password': password,  
                    'id_gastronomia': id_gastronomia
                }
            )
        return jsonify({'mensaje': 'Restaurante creado exitosamente'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500



    
#Ruta para obtener todos los restaurantes por un tipo de gastronomia en concreto
    
@app.route('/restaurantes/<int:id_gastronomia>', methods=['GET'])
def get_restaurantes_by_gastronomia(id_gastronomia):
    engine = MySQL.create_engine_mysql()

    try:
        
        restaurantes = MySQL.table_query(
            engine,
            "SELECT id, nombre_comercial, descripcion, direccion_fiscal, localidad, cp, email, telefono, logo FROM restaurantes WHERE id_gastronomia=:id_gastronomia",
            params={'id_gastronomia': id_gastronomia}
        ).to_dict(orient='records')

        if not restaurantes:
            return jsonify({'mensaje': 'No se encontraron restaurantes para esta gastronomía'}), 404

        # Convertir el campo logo a Base64
        for restaurante in restaurantes:
            if restaurante['logo']:
                restaurante['logo'] = base64.b64encode(restaurante['logo']).decode('utf-8')

        return jsonify({'restaurantes': restaurantes}), 200  
    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#Ruta para obtener un restaurante por su nombre comercial

@app.route('/restaurante/<string:nombre_comercial>', methods=['GET'])
def get_restaurante_by_nombre(nombre_comercial):
    engine = MySQL.create_engine_mysql()

    try:
        
        restaurante = MySQL.simple_query(
            engine,
            "SELECT id, nombre_comercial, descripcion, direccion_fiscal, localidad, cp, email, telefono, logo FROM restaurantes WHERE nombre_comercial=:nombre_comercial",
            params={'nombre_comercial': nombre_comercial}
        )

        
        if restaurante is None:
            return jsonify({'error': 'Restaurante no encontrado'}), 404

       
        if 'logo' in restaurante:
            logo_data = restaurante['logo']
            if logo_data is not None and isinstance(logo_data, (bytes, bytearray)):
                restaurante['logo'] = base64.b64encode(logo_data).decode('utf-8')
            else:
                restaurante['logo'] = None  


        return jsonify({'restaurante': restaurante}), 200  

    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

#Ruta para eliminar un restaurante a través de su id.
    
@app.route('/restaurante/<int:id_restaurante>', methods=['DELETE'])
def delete_restaurante(id_restaurante):
    engine = MySQL.create_engine_mysql()

    
    existing_restaurante = MySQL.simple_query(
        engine,
        "SELECT * FROM restaurantes WHERE id=:id",
        params={'id': id_restaurante}
    )

    if not existing_restaurante:
        return jsonify({'error': 'Restaurante no encontrado'}), 404

    try:
       
        with engine.begin() as conn:
            conn.execute(
                text("DELETE FROM restaurantes WHERE id=:id"),
                {'id': id_restaurante}
            )

        return jsonify({'mensaje': 'Restaurante eliminado exitosamente'}), 200

    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#Endpoint que nos crea un plato nuevo a traves de el id_restaurante

@app.route('/carta/<int:id_restaurante>', methods=['POST'])
def create_plato(id_restaurante):
    data = request.json

    
    nombre = data.get('nombre')
    descripcion = data.get('descripcion')
    ingredientes = data.get('ingredientes')
    precio = data.get('precio')
    foto = data.get('foto')  # Puede ser None si no se proporciona
    id_tipo_plato = data.get('id_tipo_plato')

    
    if not nombre or not descripcion or not ingredientes or precio is None:
        return jsonify({'error': 'Todos los campos excepto foto son obligatorios'}), 400

    engine = MySQL.create_engine_mysql()

   
    existing_restaurante = MySQL.simple_query(
        engine,
        "SELECT id FROM restaurantes WHERE id=:id_restaurante",
        params={'id_restaurante': id_restaurante}
    )

    if not existing_restaurante:
        return jsonify({'error': 'Restaurante no encontrado'}), 404

    try:
        with engine.begin() as conn:  
            
            conn.execute(
                text("INSERT INTO platos (nombre, descripcion, ingredientes, precio, foto, id_tipo_plato, id_restaurante) "
                     "VALUES (:nombre, :descripcion, :ingredientes, :precio, :foto, :id_tipo_plato, :id_restaurante)"),
                {
                    'nombre': nombre,
                    'descripcion': descripcion,
                    'ingredientes': ingredientes,
                    'precio': precio,
                    'foto': foto if foto else None,  # Usa None para pasar NULL a la base de datos
                    'id_tipo_plato': id_tipo_plato,  
                    'id_restaurante': id_restaurante
                }
            )
        return jsonify({'mensaje': 'Plato creado exitosamente'}), 201

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#Endpoint que nos devuelve todos los platos de un restaurante a través de id_restaurante
    
@app.route('/carta/<int:id_restaurante>', methods=['GET'])
def get_platos(id_restaurante):
    engine = MySQL.create_engine_mysql()

    try:
        
        platos_df = MySQL.table_query(
            engine,
            "SELECT id, nombre, descripcion, ingredientes, precio, "
            "CASE WHEN foto IS NOT NULL THEN TO_BASE64(foto) ELSE NULL END AS foto "
            "FROM platos WHERE id_restaurante=:id_restaurante",
            params={'id_restaurante': id_restaurante}
        )

        
        platos = platos_df.to_dict(orient='records')

        
        if not platos:
            return jsonify({'mensaje': 'No se encontraron platos para este restaurante.'}), 404

        return jsonify(platos), 200

    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500


#Endpoint que nos permite updatear un plato

@app.route('/carta/<int:id_restaurante>/<int:id_plato>', methods=['PUT'])
def update_plato(id_restaurante, id_plato):
    data = request.json

    if data is None:
        return jsonify({'error': 'No se han proporcionado datos'}), 400

    nuevo_nombre = data.get('nombre')
    nueva_descripcion = data.get('descripcion')
    nuevos_ingredientes = data.get('ingredientes')
    nuevo_precio = data.get('precio')
    nueva_foto = data.get('foto')
    nuevo_id_tipo_plato = data.get('id_tipo_plato')

    engine = MySQL.create_engine_mysql()

    try:
        existing_plato = MySQL.simple_query(
            engine,
            "SELECT * FROM platos WHERE id=:id AND id_restaurante=:id_restaurante",
            params={'id': id_plato, 'id_restaurante': id_restaurante}
        )

        if not existing_plato:
            return jsonify({'error': 'Plato no encontrado en el restaurante especificado'}), 404

        
        if nuevo_nombre:
            nombre_repetido = MySQL.simple_query(
                engine,
                "SELECT id FROM platos WHERE nombre=:nuevo_nombre AND id != :id AND id_restaurante=:id_restaurante",
                params={'nuevo_nombre': nuevo_nombre, 'id': id_plato, 'id_restaurante': id_restaurante}
            )

            if nombre_repetido:
                return jsonify({'error': 'Ya existe un plato con ese nombre en este restaurante'}), 409

        
        query = "UPDATE platos SET "
        params = {}
        fields_to_update = []

        if nuevo_nombre is not None:
            fields_to_update.append("nombre=:nombre")
            params['nombre'] = nuevo_nombre
        if nueva_descripcion is not None:
            fields_to_update.append("descripcion=:descripcion")
            params['descripcion'] = nueva_descripcion
        if nuevos_ingredientes is not None:
            fields_to_update.append("ingredientes=:ingredientes")
            params['ingredientes'] = nuevos_ingredientes
        if nuevo_precio is not None:
            fields_to_update.append("precio=:precio")
            params['precio'] = nuevo_precio
        if nueva_foto is not None:  # Permitir que la foto sea None
            fields_to_update.append("foto=:foto")
            params['foto'] = nueva_foto
        if nuevo_id_tipo_plato is not None:
            fields_to_update.append("id_tipo_plato=:id_tipo_plato")
            params['id_tipo_plato'] = nuevo_id_tipo_plato

        
        if fields_to_update:
            query += ', '.join(fields_to_update)
            query += " WHERE id=:id AND id_restaurante=:id_restaurante"
            params['id'] = id_plato
            params['id_restaurante'] = id_restaurante

            
            with engine.begin() as conn:
                conn.execute(text(query), params)

            return jsonify({'mensaje': 'Plato actualizado exitosamente'}), 200

        return jsonify({'error': 'No se han proporcionado datos para actualizar'}), 400

    except Exception as e:
        return jsonify({'error': str(e)}), 500


    
#Endpoint para eliminar un plato a través de su id
    
@app.route('/carta/<int:id_restaurante>/<int:id_plato>', methods=['DELETE'])
def delete_plato(id_restaurante, id_plato):
    engine = MySQL.create_engine_mysql()

    
    existing_plato = MySQL.simple_query(
        engine,
        "SELECT * FROM platos WHERE id=:id AND id_restaurante=:id_restaurante",
        params={'id': id_plato, 'id_restaurante': id_restaurante}
    )

    if not existing_plato:
        return jsonify({'error': 'Plato no encontrado'}), 404

    try:
        
        with engine.begin() as conn:
            conn.execute(
                text("DELETE FROM platos WHERE id=:id"),
                {'id': id_plato}
            )

        return jsonify({'mensaje': 'Plato eliminado exitosamente'}), 200

    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    
#Endpoint que nos permite crear un comensal
    
from flask import Flask, request, jsonify
from sqlalchemy import text
from sqlalchemy.exc import OperationalError

app = Flask(__name__)

@app.route('/users', methods=['POST'])
def create_comensal():
    data = request.json

    # Verifica si los datos están presentes
    if data is None:
        return jsonify({'error': 'No se han proporcionado datos'}), 400

    # Definir campos obligatorios
    required_fields = ['nombre', 'apellidos', 'email', 'direccion', 'localidad', 'cp', 'telefono', 'user', 'password']
    missing_fields = [field for field in required_fields if field not in data]

    # Validar campos obligatorios
    if missing_fields:
        return jsonify({'error': f'Faltan los siguientes campos: {", ".join(missing_fields)}'}), 400

    # Obtener los datos del comensal
    nombre = data['nombre']
    apellidos = data['apellidos']
    email = data['email']
    direccion = data['direccion']
    localidad = data['localidad']
    cp = data['cp']
    telefono = data['telefono']
    user = data['user']
    password = data['password']

    engine = MySQL.create_engine_mysql()

    # Comprobar si el email, teléfono o usuario ya existen
    try:
        existing_email = MySQL.simple_query(
            engine, "SELECT * FROM comensales WHERE email=:email", params={'email': email}
        )
        existing_phone = MySQL.simple_query(
            engine, "SELECT * FROM comensales WHERE telefono=:telefono", params={'telefono': telefono}
        )
        existing_user = MySQL.simple_query(
            engine, "SELECT * FROM comensales WHERE user=:user", params={'user': user}
        )

        if existing_email:
            return jsonify({'error': 'El email ya está registrado'}), 400
        if existing_phone:
            return jsonify({'error': 'El teléfono ya está registrado'}), 400
        if existing_user:
            return jsonify({'error': 'El nombre de usuario ya está registrado'}), 400

        # Insertar el nuevo comensal en la base de datos
        with engine.begin() as conn:
            conn.execute(
                text("""
                    INSERT INTO comensales (nombre, apellidos, email, direccion, localidad, cp, telefono, user, password)
                    VALUES (:nombre, :apellidos, :email, :direccion, :localidad, :cp, :telefono, :user, :password)
                """),
                {
                    'nombre': nombre,
                    'apellidos': apellidos,
                    'email': email,
                    'direccion': direccion,
                    'localidad': localidad,
                    'cp': cp,
                    'telefono': telefono,
                    'user': user,
                    'password': password  # Considera cifrar la contraseña antes de almacenar
                }
            )

        return jsonify({'mensaje': 'Comensal creado exitosamente'}), 201

    except OperationalError:
        return jsonify({'error': 'Error de conexión a la base de datos'}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)

    
    
#Metodo para actualizar la informacion de un comensal

@app.route('/users/<int:id_comensal>', methods=['PUT'])
def update_comensal(id_comensal):
    data = request.json

    if data is None:
        return jsonify({'error': 'No se han proporcionado datos'}), 400

    engine = MySQL.create_engine_mysql()

    try:
        with engine.connect() as connection:
           
            result = connection.execute(text("SELECT * FROM comensales WHERE id = :id"), {'id': id_comensal})
            comensal = result.fetchone()

            if comensal is None:
                return jsonify({'error': 'Comensal no encontrado'}), 404

            
            updates = []
            params = {'id': id_comensal}

            for key in data:
                if key != 'id':  
                    updates.append(f"{key} = :{key}")
                    params[key] = data[key]

            if not updates:  
                return jsonify({'mensaje': 'No se han proporcionado campos para actualizar'}), 400

            update_query = f"UPDATE comensales SET {', '.join(updates)} WHERE id = :id"
            connection.execute(text(update_query), params)

            return jsonify({'mensaje': 'Comensal actualizado exitosamente'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
#Endpoint para eliminar un comensal a partir de su id
    
@app.route('/users/<int:id_comensal>', methods=['DELETE'])
def delete_comensal(id_comensal):
    engine = MySQL.create_engine_mysql()

    try:
        with engine.connect() as connection:
            
            result = connection.execute(text("SELECT * FROM comensales WHERE id = :id"), {'id': id_comensal})
            comensal = result.fetchone()

            if comensal is None:
                return jsonify({'error': 'Comensal no encontrado'}), 404

            
            connection.execute(text("DELETE FROM comensales WHERE id = :id"), {'id': id_comensal})

            return jsonify({'mensaje': 'Comensal eliminado exitosamente'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
#Endpoint que crea un nuevo pedido a través del id del comensal
    
@app.route('/users/<int:id_comensal>/pedido', methods=['POST'])
def create_pedido(id_comensal):
    data = request.json
    fecha = data.get('fecha')
    estado = data.get('estado')

    if not fecha or not estado:
        return jsonify({'error': 'Se requieren fecha y estado'}), 400

    engine = MySQL.create_engine_mysql()

    try:
        
        with engine.connect() as connection:
            result = connection.execute(text("SELECT * FROM comensales WHERE id=:id"), {'id': id_comensal})
            if result.rowcount == 0:
                return jsonify({'error': 'Comensal no encontrado'}), 404

        
        with engine.connect() as connection:
            connection.execute(text("""
                INSERT INTO pedidos (fecha, estado, id_comensal)
                VALUES (:fecha, :estado, :id_comensal)
            """), {'fecha': fecha, 'estado': estado, 'id_comensal': id_comensal})

        return jsonify({'mensaje': 'Pedido creado exitosamente'}), 201

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
@app.errorhandler(404)
@app.errorhandler(500)
def error_handler(error):
    return '<h1>ERROR - URL SOLICITADA NO EXISTE</h1>'
