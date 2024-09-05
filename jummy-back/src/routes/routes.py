from flask import Flask, render_template, redirect, request, send_file, jsonify
from ..tools import MySQL


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def home():

    a = MySQL.create_engine_mysql()
    b = MySQL.simple_query(a, 'select cif from restaurantes where id=:id', params= {'id': 41})
    print(b)
    # Prueba de pedro
    return '<h1>hola</h1>'