
from flask import Flask,render_template
import requests

app = Flask(__name__)

API = "http://127.0.0.1:5002/api"

def get_posts():
    return requests.get(f"{API}/posts").json()
    
def get_posts_all():
    return requests.get(f"{API}/posts_all").json()

def get_post(post_id):
    return requests.get(f"{API}/post/{post_id}").json()

# ------------------------------------------

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.route('/')
def home():
    entradas = get_posts()
    return render_template('home.html',posts=entradas)

@app.route('/<int:post_id>')
def post(post_id):
    post = get_post(post_id)
    return render_template('post.html',post=post)


# --------------------------------------------
if __name__ == '__main__':
    app.run(port=5000,debug=True)
