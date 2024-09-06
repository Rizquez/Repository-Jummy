from flask import Flask, render_template, redirect, request, send_file, jsonify, url_for
from ..tools import MySQL


app = Flask(__name__)


@app.route('/', methods=['GET'])
def home():

    if 'gastronomia' in request.args:
        url = url_for('api', **request.args)
        return redirect(url)
    return '<h1>API JUMMY</h1>'


@app.route('/result/', methods=['GET'])
def api():
    gastronomia = request.args.get('gastronomia')
    engine = MySQL.create_engine_mysql()
    id_gastronomia = MySQL.simple_query(
        engine, 
        "SELECT id FROM gastronomias WHERE gastronomia=:gastronomia", 
        params={'gastronomia': gastronomia}
    )

    if id_gastronomia is None:
        return redirect('/error')
    else:
        data = MySQL.table_query(
            engine, 
            "SELECT * FROM restaurantes WHERE id_gastronomia=:id_gastronomia",
            params={'id_gastronomia': id_gastronomia}
        ).to_dict(orient='records')
        return jsonify([data]), 200


@app.errorhandler(404)
@app.errorhandler(500)
def error_handler(error):
    return '<h1>ERROR - URL SOLICITADA NO EXISTE</h1>'
