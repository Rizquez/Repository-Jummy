from flask import Flask, request, jsonify
from flask_cors import CORS
from ..services import MySQL
from datetime import datetime


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
        return jsonify({'message': 'nombre_restaurante or email not indicated'}), 400


# Endpoint que nos permite crear un plato a través del nombre comercial del restaurante
@app.route('/create-dish', methods=['POST'])
def create_plato():
    
    email = request.json.get('email')
    nombre = request.json.get('nombre')
    descripcion = request.json.get('descripcion')
    ingredientes = request.json.get('ingredientes')
    precio = request.json.get('precio')
    tipo_plato = request.json.get('tipo_plato')

    try:
        id_restaurante = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM restaurantes WHERE email = :email",
            params={'email': email}
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
    nombre = request.json.get('nombre')
    tipo_plato = request.json.get('tipo_plato')
    descripcion = request.json.get('descripcion')
    ingredientes = request.json.get('ingredientes')
    precio = request.json.get('precio')
    try:
        id_restaurante = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM restaurantes WHERE email = :email",
            params={'email': email}
        )['id']

        id_plato = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM platos WHERE nombre = :nombre AND id_restaurante = :id_restaurante",
            params={'nombre': nombre, 'id_restaurante': id_restaurante}
        )['id']

        updates = []
        params = {'id_plato': id_plato, 'id_restaurante': id_restaurante}

        if tipo_plato:
            tipo_plato = instance_db.simple_query(
                engine_mysql,
                "SELECT id FROM tipo_platos WHERE tipo_plato = :tipo_plato",
                params={'tipo_plato': tipo_plato}
            )['id']
            updates.append("id_tipo_plato = :id_tipo_plato")
            params['id_tipo_plato'] = tipo_plato

        if descripcion:
            updates.append("descripcion = :descripcion")
            params['descripcion'] = descripcion

        if ingredientes:
            updates.append("ingredientes = :ingredientes")
            params['ingredientes'] = ingredientes

        if precio is not None:
            updates.append("precio = :precio")
            params['precio'] = precio

        if not updates:
            return jsonify({'message': 'No fields to update'}), 400
        
        rowcount = instance_db.execute_dml_query(
            engine_mysql, 
            f"""
            UPDATE platos
            SET {', '.join(updates)}
            WHERE id = :id_plato AND id_restaurante = :id_restaurante
            """, 
            params
        )
        if rowcount > 0:
            return jsonify({'mensaje': 'Dish updated successfully'}), 200
        else:
            return jsonify({'message': 'Failed to update the dish'}), 500
    except Exception as e:
        return jsonify({'message': str(e)}), 500


#Endpoint que nos permite crear un pedido    
@app.route('/create-order', methods=['POST'])
def create_order():
    
    email_comensal = request.json.get('email')
    nombres_platos = request.json.get('nombres_platos')  
    nombre_comercial = request.json.get('nombre_comercial')

    try:
        id_comensal = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM comensales WHERE email = :email",
            params={'email': email_comensal}
        )['id']

        id_restaurante = instance_db.simple_query(
            engine_mysql,
            "SELECT id FROM restaurantes WHERE nombre_comercial = :nombre_comercial",
            params={'nombre_comercial': nombre_comercial}
        )['id']
       
        fecha_actual = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        instance_db.execute_dml_query(
            engine_mysql,
            """
            INSERT INTO pedidos (fecha, estado, id_comensales)
            VALUES (:fecha, :estado, :id_comensales)
            """,
            {
                'fecha': fecha_actual,
                'estado': 'Pendiente',
                'id_comensales': id_comensal
            }
        )

        id_pedido = instance_db.simple_query(
            engine_mysql,
            "SELECT LAST_INSERT_ID() AS id_pedido"
        )['id_pedido']

        for nombre_plato in nombres_platos:
            id_plato = instance_db.simple_query(
                engine_mysql,
                "SELECT id FROM platos WHERE nombre = :nombre",
                params={'nombre': nombre_plato}
            )['id']

            instance_db.execute_dml_query(
                engine_mysql,
                """
                INSERT INTO detalles_pedido (id_platos, id_pedidos, id_restaurantes)
                VALUES (:id_platos, :id_pedidos, :id_restaurantes)
                """,
                {
                    'id_platos': id_plato,
                    'id_pedidos': id_pedido,
                    'id_restaurantes': id_restaurante
                }
            )

        return jsonify({'mensaje': 'Pedido creado exitosamente', 'id_pedido': id_pedido}), 201
    except Exception as e:
        return jsonify({'message': str(e)}), 500


# Endpoint que nos permite recibir todos los pedidos de un restaurante o de un comensal
@app.route('/get-orders', methods=['GET'])
def get_orders():
    nombre_comercial = request.json.get('nombre_comercial')
    email_comensal = request.json.get('email_comensal')  

    try:
        query = """
        SELECT id_pedidos, nombre_plato, email_comensal, estado, fecha
        FROM v_detalles_pedidos
        WHERE 1=1
        """
        params = {}

        if nombre_comercial:
            query += " AND nombre_comercial = :nombre_comercial"
            params['nombre_comercial'] = nombre_comercial
        
        if email_comensal:
            query += " AND email_comensal = :email_comensal"
            params['email_comensal'] = email_comensal

        pedidos = instance_db.simple_query(
            engine_mysql,
            query,
            type_data='multi',
            params=params
        )

        resultado = {}
        for pedido in pedidos:
            id_pedido = pedido['id_pedidos']
            if id_pedido not in resultado:
                resultado[id_pedido] = {
                    'email_comensal': pedido['email_comensal'],
                    'estado': pedido['estado'],
                    'fecha': pedido['fecha'],
                    'nombres_platos': []
                }
            resultado[id_pedido]['nombres_platos'].append(pedido['nombre_plato'])

        pedidos_list = [
            {'id_pedido': id_pedido, **datos}
            for id_pedido, datos in resultado.items()
        ]

        return jsonify(pedidos_list), 200
    except Exception as e:
        return jsonify({'message': str(e)}), 500


# Endpoint para actualizar el estado de un pedido a 'Finalizado'
@app.route('/finalizar-pedido', methods=['POST'])
def finalizar_pedido():
    id_pedido = request.json.get('id_pedido')  # Recibimos el id_pedido

    try:
        pedido = instance_db.simple_query(
            engine_mysql,
            """
            SELECT estado FROM pedidos WHERE id = :id_pedido
            """,
            params={'id_pedido': id_pedido}
        )

        if not pedido:
            return jsonify({'message': 'Pedido no encontrado'}), 404

        if pedido['estado'] != 'Pendiente':
            return jsonify({'message': 'El pedido no está en estado pendiente'}), 400

        instance_db.execute_dml_query(
            engine_mysql,
            """
            UPDATE pedidos SET estado = 'Finalizado' WHERE id = :id_pedido
            """,
            params={'id_pedido': id_pedido}
        )

        return jsonify({'message': 'Pedido finalizado exitosamente'}), 200
    except Exception as e:
        return jsonify({'message': str(e)}), 500


# Endpoint para controlar la peticion sobre endpoints inexistentes
@app.errorhandler(404)
def error_handler(error):
    return jsonify({'message': 'endpoint not found'}), 404
