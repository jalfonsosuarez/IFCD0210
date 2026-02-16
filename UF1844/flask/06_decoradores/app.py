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

USERFILE = './users.json'

def login_required(func):
    def envelope(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        return func(*args, **kwargs)
    return envelope


@app.route('/')
def index():
    # return redirect(url_for('register'))
    if "user_id" in session:
        return redirect(url_for('home'))
    return redirect(url_for('login'))
    

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if util.buscar_usuario(USERFILE, username):
            flash( f'Usuario {username} ya existe.')
            return redirect(url_for('register'))
        
        hashed_pwd = generate_password_hash(password)
        users = util.cargar_datos(USERFILE)
        user_id = len(users) + 1
        users.append({
            'id': user_id,
            'username': username,
            'password': hashed_pwd
        }) 
        util.guardar_datos(USERFILE, users)
        flash('Usuario creado correctamente.')
        return redirect(url_for('login'))

    return render_template('register.html')

@login_required
@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = util.buscar_usuario(USERFILE, username)
        if not user:
            flash( f'Usuario {username} no existe.')
            return redirect(url_for('login'))
        
        
        if check_password_hash(user['password'], password):
            session['username'] = username
            return redirect(url_for('home'))
        
        flash( f'Usuario {username} no existe.')
        return redirect(url_for('login'))

    return render_template('login.html')

@login_required
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

