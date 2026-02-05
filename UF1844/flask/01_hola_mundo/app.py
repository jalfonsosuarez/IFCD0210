from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/index')
@app.route('/')
def home():
    return "Hola mundo"


@app.route('/hola')
def hola():
    cadena = '<h1>Hola carabola</h1>'
    return cadena    

@app.route('/prueba')
def prueba():
    return render_template('prueba.html')

@app.route('/prueba1')
@app.route('/prueba1/<string:nombre>')
@app.route('/prueba1/<string:nombre>/<int:numero>')
def prueba_nombre(nombre=None, numero=None):
    cadena = ""
    if nombre and numero:
        cadena = f"Hola {nombre} tienes {numero} años."
    elif nombre:
        cadena = f"Hola {nombre}."
    else:
        cadena = "Hola carabola"
    
    return cadena

@app.route("/suma", methods=['GET', 'POST'])
def sumar():
    if request.method == 'POST':
        num1 = request.form['num1']
        num2 = request.form['num2']
        return str(float(num1)+float(num2))
    else:
        cadena = '''
        <form action="/suma" method="POST">
            <label for="num1">Numero 1</label>
            <input type="number" name="num1" required>
            <label for="num2">Numero 2</label>
            <input type="number" name="num2" required>
            <input type="submit" value="Sumar">
        </form>
        '''
        return cadena





if __name__ == '__main__':
    app.run(debug=True)