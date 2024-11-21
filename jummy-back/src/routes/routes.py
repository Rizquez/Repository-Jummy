from flask import Flask, request, jsonify
from flask_cors import CORS
from ..services import MySQL


# Instanciacion de la app de Flask
app = Flask(__name__)
CORS(app)


# Instanciacion sobre el servicion de conexion a MySQL
instance_db = MySQL()
engine_mysql = instance_db.engine_mysql()


# Enpoint principal de acceso a la api
@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "api online"}), 200


# Endpoint que nos permite crear un comensal
@app.route('/build-diner', methods=['POST'])
def create_comensal():

    nombre = request.json.get('nombre')
    apellidos = request.json.get('apellidos')
    email = request.json.get('email')
    direccion = request.json.get('direccion')
    localidad = request.json.get('localidad')
    cp = request.json.get('cp')
    telefono = request.json.get('telefono')
    password = request.json.get('password')  

    id_existing = instance_db.simple_query(
        engine_mysql,
        "SELECT id FROM comensales WHERE email=:email OR telefono=:telefono",
        params={
            'email': email,
            'telefono': telefono
        }
    )

    if id_existing:
        return jsonify({'message': 'user already exists'}), 409

    try:
        instance_db.execute_dml_query(
            engine_mysql,
            """
            INSERT INTO comensales (nombre, apellidos, email, direccion, localidad, cp, telefono, password) 
            VALUES (:nombre, :apellidos, :email, :direccion, :localidad, :cp, :telefono, :password)
            """,
            {
                'nombre': nombre,
                'apellidos': apellidos,
                'email': email,
                'direccion': direccion,
                'localidad': localidad,
                'cp': cp,
                'telefono': telefono,
                'password': password
            }
        )
        return jsonify({'message': 'user successfully created'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    

# Endpoint que nos permite crear un restaurante
@app.route('/build-restaurant', methods=['POST'])
def create_restaurante():

    cif = request.json.get('cif')
    nombre_fiscal = request.json.get('nombre_fiscal')
    direccion_fiscal = request.json.get('direccion_fiscal')
    localidad = request.json.get('localidad')
    cp = request.json.get('cp')
    telefono = request.json.get('telefono')
    email = request.json.get('email')
    nombre_comercial = request.json.get('nombre_comercial')
    descripcion = request.json.get('descripcion')
    logo = request.json.get('logo')
    password = request.json.get('password')
    gastronomia = request.json.get('gastronomia')

    id_existing = instance_db.simple_query(
        engine_mysql,
        "SELECT id FROM restaurantes WHERE cif=:cif OR nombre_fiscal=:nombre_fiscal OR telefono=:telefono OR email=:email",
        params={
            'cif': cif,
            'nombre_fiscal': nombre_fiscal,
            'telefono': telefono,
            'email': email
        }
    )

    if id_existing:
        return jsonify({'message': 'user already exists'}), 409

    try:
        id_gastronomia = instance_db.simple_query(
            engine_mysql, 
            "SELECT id FROM gastronomias WHERE gastronomia=:gastronomia", 
            params={'gastronomia': gastronomia.lower()}
        )['id']

        instance_db.execute_dml_query(
            engine_mysql,
            """
            INSERT INTO restaurantes (cif, nombre_fiscal, direccion_fiscal, localidad, cp, telefono, email, nombre_comercial, descripcion, logo, password, id_gastronomia) 
            VALUES (:cif, :nombre_fiscal, :direccion_fiscal, :localidad, :cp, :telefono, :email, :nombre_comercial, :descripcion, :logo, :password, :id_gastronomia)
            """,
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
                'logo': logo,
                'password': password,  
                'id_gastronomia': id_gastronomia
            }
        )
        return jsonify({'message': 'user successfully created'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Endpoint que nos permite obtener los restaurantes disponibles
@app.route('/find-restaurants', methods=['POST'])
def obtain_restaurants():

    nombre_comercial = request.json.get('nombre_comercial')
    gastronomia = request.json.get('gastronomia')

    if nombre_comercial:
        try:
            data = instance_db.simple_query(
                engine_mysql,
                "SELECT * FROM v_restaurantes_gastronomias WHERE nombre_comercial = :nombre_comercial",
                type_data='multi',
                params={'nombre_comercial': nombre_comercial}
            )
            if data:
                return jsonify({'data': data}), 200
            else:
                return jsonify({'message': 'restaurant not found'}), 404
        except Exception as e:
            return jsonify({'error': str(e)}), 500
        
    elif gastronomia:
        try:
            data = instance_db.simple_query(
                engine_mysql,
                "SELECT * FROM v_restaurantes_gastronomias WHERE gastronomia = :gastronomia",
                type_data='multi',
                params={'gastronomia': gastronomia}
            )
            return jsonify({'data': data}), 200
        except Exception as e:
            return jsonify({'error': str(e)}), 500
        
    else:
        return jsonify({'error': 'gastronomia or nombre_comercial not indicated'}), 400
    
    
# Endpoint que nos devuelve todos los platos de un restaurante a través del nombre del restaurante
@app.route('/find-dishes', methods=['POST'])
def obtain_dishes():
    
    nombre_comercial = request.json.get('nombre_comercial')
    email = request.json.get('email')

    if nombre_comercial:
        try:
            data = instance_db.simple_query(
                engine_mysql,
                "SELECT * FROM  v_menus WHERE nombre_comercial = :nombre_comercial",
                type_data='multi',
                params={'nombre_comercial': nombre_comercial}
            )
            if data:
                return jsonify({'data': data}), 200
            else:
                return jsonify({'message': 'dishes not found for this restaurant'}), 404
        except Exception as e:
            return jsonify({'message': str(e)}), 500
    elif email:
        try:
            nombre_comercial = instance_db.simple_query(
                engine_mysql,
                "SELECT nombre_comercial FROM restaurantes WHERE email = :email",
                params={'email': email}
            )['nombre_comercial']

            
            data = instance_db.simple_query(
                engine_mysql,
                "SELECT * FROM  v_menus WHERE nombre_comercial = :nombre_comercial",
                type_data='multi',
                params={'nombre_comercial': nombre_comercial}
            )
            if data:
                return jsonify({'data': data}), 200
            else:
                return jsonify({'message': 'dishes not found for this restaurant'}), 404
        except Exception as e:
            return jsonify({'message': str(e)}), 500

    else:
        return jsonify({'message': 'nombre_restaurante not indicated'}), 400


# Endpoint que nos permite crear un plato a través del nombre comercial del restaurante
@app.route('/create-dish', methods=['POST'])
def create_plato():
    
    nombre_comercial = request.json.get('nombre_comercial')
    nombre = request.json.get('nombre')
    descripcion = request.json.get('descripcion')
    ingredientes = request.json.get('ingredientes')
    precio = request.json.get('precio')
    tipo_plato = request.json.get('tipo_plato')

    if not nombre or not descripcion or not ingredientes or precio is None:
        return jsonify({'message': 'all fields except photo are required'}), 400

    try:
        id_restaurante = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM restaurantes WHERE nombre_comercial = :nombre_comercial",
            params={'nombre_comercial': nombre_comercial}
        )['id']

        id_tipo_plato = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM tipo_platos WHERE tipo_plato = :tipo_plato",
            params={'tipo_plato': tipo_plato}
        )['id']

       
        rowcount = instance_db.execute_dml_query(
            engine_mysql,
            """
            INSERT INTO platos (nombre, descripcion, ingredientes, precio, id_tipo_plato, id_restaurante)
            VALUES (:nombre, :descripcion, :ingredientes, :precio, :id_tipo_plato, :id_restaurante)
            """, 
            {
            'nombre': nombre,
            'descripcion': descripcion,
            'ingredientes': ingredientes,
            'precio': precio,
            'id_tipo_plato': id_tipo_plato,
            'id_restaurante': id_restaurante
            }
        )

        
        if rowcount > 0:
            return jsonify({'mensaje': 'successfully created dish'}), 201
        else:
            return jsonify({'message': 'the dish cannot be created'}), 500
    except Exception as e:
        return jsonify({'message': str(e)}), 500
    

# Endpoint para actualizar un plato mediante el nombre comercial del restaurante y el nombre del plato
@app.route('/update-dish', methods=['PUT'])
def update_plato():
    email = request.json.get('email')
    nombre_plato = request.json.get('nombre')
    nuevo_tipo_plato = request.json.get('tipo_plato')
    nueva_descripcion = request.json.get('descripcion')
    nuevos_ingredientes = request.json.get('ingredientes')
    nuevo_precio = request.json.get('precio')
    
    try:
        
        restaurante = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM restaurantes WHERE email = :email",
            params={'email': email}
        )['id']

        plato = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM platos WHERE nombre = :nombre_plato AND id_restaurante = :id_restaurante",
            params={'nombre_plato': nombre_plato, 'id_restaurante': restaurante}
        )['id']

        updates = []
        params = {'id_plato': plato, 'id_restaurante': restaurante}

        if nuevo_tipo_plato:
            tipo_plato = instance_db.simple_query(
                engine_mysql,
                "SELECT id FROM tipo_platos WHERE tipo_plato = :tipo_plato",
                params={'tipo_plato': nuevo_tipo_plato}
            )['id']
            updates.append("id_tipo_plato = :id_tipo_plato")
            params['id_tipo_plato'] = tipo_plato

        if nueva_descripcion:
            updates.append("descripcion = :nueva_descripcion")
            params['nueva_descripcion'] = nueva_descripcion
        if nuevos_ingredientes:
            updates.append("ingredientes = :nuevos_ingredientes")
            params['nuevos_ingredientes'] = nuevos_ingredientes
        if nuevo_precio is not None:
            updates.append("precio = :nuevo_precio")
            params['nuevo_precio'] = nuevo_precio

        if not updates:
            return jsonify({'message': 'No fields to update'}), 400

        update_query = f"""
        UPDATE platos
        SET {', '.join(updates)}
        WHERE id = :id_plato AND id_restaurante = :id_restaurante
        """
        rowcount = instance_db.execute_dml_query(engine_mysql, update_query, params)

        if rowcount > 0:
            return jsonify({'mensaje': 'Dish updated successfully'}), 200
        else:
            return jsonify({'message': 'Failed to update the dish'}), 500

    except Exception as e:
        return jsonify({'message': str(e)}), 500




# Endpoint para controlar la peticion sobre endpoints inexistentes
@app.errorhandler(404)
def error_handler(error):
    return jsonify({'message': 'endpoint not found'}), 404
