from flask import Flask, jsonify

app = Flask(__name__)

users = {
    1: {
        "name": "Paco",
        "age": 44 
    },
    2: {
        "name": "Ana",
        "age": 22
    }
}

@app.route("/users/<int:user_id>")
def get_user_by_id(user_id):
    user = users.get(user_id)
    return jsonify(user)



if __name__ == '__main__':
    app.run(port=3000)
    