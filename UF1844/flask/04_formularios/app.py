from flask import Flask, redirect, url_for,render_template,request
from datetime import datetime
import json
import os

app = Flask(__name__)

DATOS = "datos.json"

PAISES = ['Argentina', 'México', 'España']
GENEROS = ['Hombre', 'Mujer', 'No definido']
HOBBIES = ['leer', 'Deporte', 'Música', 'Video juegos', 'Viajar']

@app.route("/", methods=['GET', 'POST'])
def index():
    if request.method == "POST":
        pass
    
    return render_template('home.html', paises=PAISES)

