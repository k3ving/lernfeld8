import base64
from flask import Flask, jsonify, request
from dbconnector import DbConnector

app = Flask(__name__)


@app.route("/pongservice/sendscore", methods=['GET'])
def send_score():
    user = request.args.get('user')
    score = request.args.get('score')

    if not score or not user:
        return jsonify(error='Missing required parameter "Score"'), 400

    db_connection = DbConnector()
    db_connection.send_score(user, score)

    return jsonify("Ok"), 200


@app.route("/pongservice/gethighscores", methods=['GET'])
def get_highscores():
    db_connection = DbConnector()
    rows = db_connection.get_highscores()

    data = []
    for row in rows:
        data.append(list(row))
    return data


@app.route("/pongservice/login", methods=['GET'])
def login():
    user = request.args.get('user')
    password = request.args.get('password')

    db_connection = DbConnector()
    result = db_connection.login(user, encode_base64(password))
    return jsonify(result[0]), 200


@app.route("/pongservice/register", methods=['GET'])
def register():
    user = request.args.get('user')
    password = request.args.get('password')

    db_connection = DbConnector()
    result = db_connection.register(user, encode_base64(password))
    return jsonify(result[0]), 200


def encode_base64(string_to_encode):
    encoded_bytes = string_to_encode.encode("utf8")
    base64_bytes = base64.b64encode(encoded_bytes)
    encoded_string = base64_bytes.decode("utf8")
    return encoded_string


if __name__ == '__main__':
    app.run(debug=True, port=6969)
