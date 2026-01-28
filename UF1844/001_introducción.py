"""
Comenzamos la sección dedicada a la programación con Python.
Vamos a usarlo para contruir el backend o aplicaciones de lado del servidor.
"""
print("Hello word!")

# Tipos de datos en Python

cadena = "Esto es una cadena" #tipo str
print(cadena, type(cadena))

entero = 1312341234123435654098000907 #tipo int
print(entero, type(entero))

decimal = 123.4352436735475436345645 #tipo float
print(decimal, type(decimal))

logico = True #tipo bool
print(logico, type(logico))

#lista
lista = [1,2,'Pepe',True, 1.345] #tipo list
print(lista, type(lista))

#tupla
tupla = (1,2,'Pepe', False, 1.456) #tipo tuple
print(tupla, type(tupla))

#diccionario
dicc = {
    1: 'Lunes',
    2: 'Martes'
} #type dict
print(dicc, type(dicc))

#separador del miles
num = 123_434_243.456
print(num)

print(id(lista[0]))
lista[0] = True
print(lista)
print(id(lista[0]))

# Ejercicios
print()
print("*" * 60)
print("Calcular precio con IVA (21%) de un producto que vale 32.18€")
print("*" * 60)
precio_producto = 32.18
porcentaje_iva = 0.21
precio_total = precio_producto * (1 + porcentaje_iva)
print("Precio con IVA: ", precio_total)
print("*" * 60)
print()
print("*" * 60)
print("Convertir ºC a ºF")
print("*" * 60)
grados_centigrados = 30
grados_fahrenheit = grados_centigrados * 1.8 + 32
print(grados_centigrados, 'ºC son', grados_fahrenheit, 'ºF')
print("*" * 60)
mensaje = str(grados_centigrados) + "ºC son " + str(grados_fahrenheit) + "ºF"
print(mensaje)
print("*" * 60)
print()
print("*" * 60)
print("Calculo del índice de masa corporal.")
print("*" * 60)
peso = 100
altura = 1.74
imc = peso / altura ** 2
mensaje = "El IMC para un peso de " + str(peso) + "Kg y una altura de " + str(altura) + " m es de " + str(imc)
print(mensaje)
if imc < 18:
    print("El IMC es bajo")
elif imc < 25:
    print("El IMC es normal")
else:
    print("El IMC es alto: sobrepeso")
print("*" * 60)
print()


