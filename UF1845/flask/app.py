from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)
BD = './database/productos.sqlite'

def get_conection():
    cnx = sqlite3.connect(BD)
    cnx.row_factory = sqlite3.Row
    return cnx

def init_bd():
    conn = get_conection()
    conn.execute("""
        create table if not exists product(
            id integer primary key autoincrement,
            codigo text unique not null,
            nombre text not null,
            precio real not null,
            cantidad integer not null,
            fecha_caducidad text not null
        )
    """
    )
    conn.commit()
    conn.close()

init_bd()

@app.route('/')
def index():
    conn = get_conection()
    products = conn.execute("SELECT * FROM product").fetchall()
    conn.close()
    return render_template('index.html', prods=products)

@app.route('/editar/<int:id>', methods=['GET', 'POST'])
def editar():
    conn = get_conection()
    prod = conn.execute('SELECT * FROM product WHERE id = ?', (id,)).fetchone()
    
    if request.method == 'POST':
        codigo = request.form['codigo']
        nombre = request.form['nombre']
        precio = request.form['precio']
        cantidad = request.form['cantidad']
        fecha_caducidad = request.form['fecha_caducidad']
        conn.execute('UPDATE product SET codigo=?, nombre=?, precio=?, cantidad=?, fecha_caducidad=? WHERE id=?', 
                     (codigo, nombre, precio, cantidad, fecha_caducidad, id))
        conn.commit()
        conn.close()
        return redirect(url_for('index'))
    
    conn.close()
    return render_template('editar.html', prod=prod)