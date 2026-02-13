from flask import Flask, render_template,request,redirect,url_for
import utilidades as util

app = Flask(__name__)

PRODUCTOS = 'productos.json'


@app.route('/')
def index():
    id_producto = None
    producto_sel = None
    datos = util.cargar_datos(PRODUCTOS)
    categ = datos["categorias"]
    prods = datos["productos"]

    
    id_producto = request.args.get("producto")
    if id_producto:
        id_producto = int(id_producto)
        for p in prods:
            if p['id'] == id_producto:
                producto_sel = p
                break


    return render_template('index.html', 
                            productos = prods, 
                            categorias = categ,
                            producto = producto_sel)

@app.post('/actualizar/<int:prod_id>')
def actualizar_producto(prod_id):
    producto_sel = None
    datos = util.cargar_datos(PRODUCTOS)
    prods = datos['productos']

    for p in prods:
        if p['id'] == prod_id:
            producto_sel = p
            break
    
    producto_sel['nombre'] = request.form['nombre']
    producto_sel['precio'] = float(request.form['precio'])
    producto_sel['id_categoria'] = int(request.form['categoria'])

    util.guardar_datos(PRODUCTOS,datos)

    return redirect(url_for('index',producto=producto_sel['id']))


@app.post('/crear')
def crear_producto():
    producto_nuevo = None
    datos = util.cargar_datos(PRODUCTOS)
    prods = datos['productos']
    
    producto_nuevo ={
        'id': util.nuevo_id(PRODUCTOS),
        'nombre': request.form['nombre'],
        'precio': float(request.form['precio']),
        'id_categoria': int(request.form['categoria'])
    }

    prods.append(producto_nuevo)

    util.guardar_datos(PRODUCTOS,datos)

    return redirect(url_for('index',producto=producto_nuevo['id']))

@app.post('/borrar/<int:prod_id>')
def borrar_producto(prod_id):
    aux = []
    datos = util.cargar_datos(PRODUCTOS)
    prods = datos['productos']
    for p in prods:
        if p['id'] != prod_id:
            aux.append(p)
    
    datos['productos'] = aux
    util.guardar_datos(PRODUCTOS,datos)

    return redirect(url_for('index'))


