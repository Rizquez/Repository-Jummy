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
@app.route('/users', methods=['POST'])
def create_comensal():

    data = request.json
    nombre = data.get('nombre')
    apellidos = data.get('apellidos')
    email = data.get('email')
    direccion = data.get('direccion')
    localidad = data.get('localidad')
    cp = data.get('cp')
    telefono = data.get('telefono')
    password = data.get('password')  

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
    # logo = data.get('logo')
    password = data.get('password')
    id_gastronomia = data.get('id_gastronomia')

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
        instance_db.execute_dml_query(
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
                'logo': None,
                'password': password,  
                'id_gastronomia': id_gastronomia
            }
        )
        return jsonify({'message': 'user successfully created'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500


# Funcion para controlar la peticion sobre endpoints inexistentes
@app.errorhandler(404)
@app.errorhandler(500)
def error_handler(error):
    return jsonify({'message': 'endpoint not found'}), 404
