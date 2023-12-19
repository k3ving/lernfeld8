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


if __name__ == '__main__':
    app.run(debug=True, port=6969)
