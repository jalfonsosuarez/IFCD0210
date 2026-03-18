import requests
from flask import Flask, request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)

DATA_PATH = "http://127.0.0.1:5001/data"

def get_user_by_email(email):
    resp = requests.get(f"{DATA_PATH}/user/by-email", params={'email': email})
    return resp.json()

def create_user_db(user_data):
    resp = requests.post(f"{DATA_PATH}/user", json=user_data)
    return resp.json()

def get_posts_db():
    resp = requests.get(f"{DATA_PATH}/posts")
    return resp.json()
    
def get_post_db(post_id):
    resp = requests.get(f"{DATA_PATH}/post/{post_id}")
    return resp.json()

def create_post_db(post_data):
    resp = requests.post(f"{DATA_PATH}/post", json=post_data)
    return resp.json()

def update_post_db(post_data, post_id):
    resp = requests.put(f"{DATA_PATH}/post/{post_id}", json=post_data)
    return resp.json()

def delete_post_db(post_id):
    resp = requests.delete(f"{DATA_PATH}/post/{post_id}")
    return resp.json()


@app.route("/api/login", methods=['POST'])
def login():
    data = request.json
    user = get_user_by_email(data['email'])
    if not user:
        return jsonify({'error': "Usuario no encontrado."}), 401
    
    if not check_password_hash(user['pw_hash'], data['password']):
        return jsonify({'error': "Usuario no encontrado."}), 401
    
    return jsonify({
        'message': 'Login correcto',
        'user_id': user['id'],
        'role': user['rol']
    })
    
@app.route('/api/posts')
def get_posts():
    posts = get_posts_db()
    published = []
    
    for p in posts:
        if p['estado'] == 'publicado':
            published.append(p)
            
    return jsonify(published)