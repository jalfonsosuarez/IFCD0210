def escribe(numero):
    try:
        n = int(numero)
        print(f"El numero es {n}")
        x = 8 / n
    except ValueError:
        print("Número no válido.")
    except ZeroDivisionError:
        print("División por cero.")
    except Exception as e:
        print("Error no controlado: ", e)
        

escribe('3')
        
def lista_err():
    try:
        lista = [1,2,3]
        print(lista[6])
    except (IndexError, TypeError) as e:
        print("Ha ocurrido un error: ", e)
    finally:
        print("Tírate por el barranco")
        
lista_err()


def archivo():
    try:
        arch = open("basura.txt","r")
    except FileNotFoundError as e:
        arch = open("basura.txt","w")
    finally:
        print("Archivo creado si no existe.")

archivo()

def persona(edad):
    if edad < 18:
        raise ValueError("No se permiten menores de edad.")
    
persona(11)

