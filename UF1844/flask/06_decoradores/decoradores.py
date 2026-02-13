# Decoradores en Python

def saludar_decorador(func):
    def nueva_funcicion():
        print('Antes de la función')
        func()
        print('Después de la función')
    return nueva_funcicion
    
@saludar_decorador
def saludar():
    print("hola mundo")
    
# saludo = saludar_decorador(saludar)
# saludo()

#saludar()

import time

def medir_tiempo(func):
    def envoltura(*args, **kwargs):
        inicio = time.time()
        resultado = func(*args, **kwargs)
        fin = time.time()
        print(f"Tiempo transcurrido {fin-inicio:.4f} milisegundos.")
        return resultado
    return envoltura

@medir_tiempo
def sumatorio(limite):
    total = 0
    for i in range(limite):
        total += i
    time.sleep(.5)
    return total

x = sumatorio(1000)
print(f"suma total: {x}")


