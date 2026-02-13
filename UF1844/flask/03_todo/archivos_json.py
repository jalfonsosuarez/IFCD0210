import json

with open('tareas.json', 'r', encoding='utf-8') as f:
    tareas = json.load(f)

nueva = {
        "id": 2,
        "descripcion": "Segunda tarea",
        "fecha_alta": "2026-02-08 17:00:00",
        "fecha_completada": None
    }

tareas.append(nueva)
with open('tareas.json','w',encoding='utf-8') as f:
    json.dump(tareas,f,indent=4,ensure_ascii=False)
