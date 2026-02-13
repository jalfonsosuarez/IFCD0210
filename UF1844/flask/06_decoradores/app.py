from flask import (
    Flask, 
    url_for, 
    redirect, 
    session, 
    request, 
    flash, 
    render_template
)
from werkzeug.security import generate_password_hash, check_password_hash
import utilidades as util

app = Flask(__name__)

app.secret_key = "my_secret_key"

USUARIOS = './users.json'

def login_required(func):
    def envelope(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        return func(*args, **kwargs)
    return envelope


@app.route('/')
def index():
    return redirect(url_for('register'))
    if "user_id" in session:
        return redirect(url_for('home'))
    return redirect(url_for('login'))
    

@app.route('/home')
@login_required
def home():
    return render_template('home.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if util.buscar_usuario(USUARIOS, username):
            flash( f'Usuario {username} ya existe.')
            return redirect(url_for('register'))
        
        hashed_pwd = generate_password_hash(password)
        users = util.cargar_datos(USUARIOS)
        user_id = len(users) + 1
        users.append({
            'id': user_id,
            'username': username,
            'password': hashed_pwd
        }) 
        util.guardar_datos(USUARIOS, users)
        flash('Usuario creado correctamente.')
        return redirect(url_for('login'))

        
    return render_template('register.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/logout')
def logout():
    return render_template('login.html')

