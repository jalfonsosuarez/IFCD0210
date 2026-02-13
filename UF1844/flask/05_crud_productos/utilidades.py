import json

def cargar_datos(archivo):
    with open(archivo,'r',encoding='utf-8' ) as f:
        return json.load(f)
    
def guardar_datos(archivo, datos):
    with open(archivo, 'w', encoding='utf-8') as f:
        json.dump(datos,f, indent=4,ensure_ascii=False)


def nuevo_id(archivo_prods):
    lista_ids = []
    datos = cargar_datos(archivo_prods)
    prods = datos['productos']
    for p in prods:
        lista_ids.append(p['id'])
        
    return max(lista_ids,default=0) + 1

