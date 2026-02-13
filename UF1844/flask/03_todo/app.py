from flask import Flask, redirect, url_for,render_template,request
from datetime import datetime
import json
import os

app = Flask(__name__)

MIS_TAREAS = "tareas.json"

def carga_tareas():
    if not os.path.exists(MIS_TAREAS):
        return []
    with open(MIS_TAREAS,'r',encoding='utf-8') as f:
        return json.load(f)
    
def guardar_tareas(tareas):
    with open(MIS_TAREAS, 'w',encoding='utf-8') as f:
        json.dump(tareas,f, indent=4,ensure_ascii=False)
        
def nuevo_id():
    lista_id = []
    tasks = carga_tareas()
    for t in tasks:
        lista_id.append(t['id'])
    return max(lista_id, default=0) + 1

@app.route('/', methods=["POST","GET"])
def index():
    tasks = carga_tareas()
    if request.method == "POST":
        desc = request.form["descripcion"]
        nueva = {
            "id" : nuevo_id(),
            "descripcion": desc,
            "fecha_alta": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "fecha_completada": None
        }
        tasks.append(nueva)
        guardar_tareas(tasks)
        return redirect(url_for("index"))

    return  render_template("index.html", tareas=tasks)

@app.route('/delete/<int:id>', methods=['POST', 'GET'])
def delete_task(id: int):
    tasks = carga_tareas()
    resto_tareas = []
    for t in tasks:
        if t['id'] != id:
            resto_tareas.append(t)
    
    guardar_tareas(resto_tareas)
    return redirect(url_for("index"))
    
@app.route('/complete/<int:id>', methods=['POST', 'GET'])
def complete_task(id: int):
    tasks = carga_tareas()
    for t in tasks:
        if t['id'] == id:
            t['fecha_completada'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            break
    
    guardar_tareas(tasks)
    return redirect(url_for("index"))
    
@app.route('/edit/<int:id>', methods=['POST', 'GET'])
def edit_task(id: int):
    tasks = carga_tareas()
    if request.method == "POST":
        for t in tasks:
            if t['id'] == id:
                t['descripcion'] = request.form["descripcion"]
                t['fecha_completada'] = None
                break
    
        guardar_tareas(tasks)
        return redirect(url_for("index"))

    task = {}
    for t in tasks:
        if t['id'] == id:
            task = t
            break
    
    return  render_template("edit.html", tarea=task)
        
    
    

    