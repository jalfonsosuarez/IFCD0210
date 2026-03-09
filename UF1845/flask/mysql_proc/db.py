import mysql.connector
import config

def get_conection():
    conexion = mysql.connector.connect(
       host=config.HOST,
       port=config.PORT,
       user=config.USER,
       password=config.PASSWORD,
       database=config.DATABASE
    )
     
    return conexion

def run_sql(sqlCommand, *args):
    conn = get_conection()
    cursor = conn.cursor()
    cursor.execute(sqlCommand, *args)
    
    result = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return result