import db


result = db.run_sql('call productos_por_gama(%s)', ('Frutales',))

for row in result:
    print(row)

result = db.run_sql('select * from producto where codigo_producto=%s', ('11679',))

for row in result:
    print(row)

# cursor.callproc('productos_por_gama', ("Frutales",))

# cursor.close()
# conexion.close()

# for resultado in cursor.stored_results():
#   print(resultado.fetchall())
    
