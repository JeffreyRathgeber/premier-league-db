from flask import Flask, request, jsonify
from db import get_connection


app = Flask(__name__)


# GET all players
@app.route('/players', methods=['GET'])
def get_players():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Players')
    players = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(players)


# GET a singular player
@app.route('/players/<int:id>', methods=['GET'])
def get_player(id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Players WHERE player_id = %s', (id,))
    player = cursor.fetchone()
    cursor.close()
    conn.close()
    if player is None:
        return jsonify({'error': 'Player not found'}), 404
    return jsonify(player)


# POST add a player
@app.route('/players', methods=['POST'])
def create_player():
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, shirt_number, team_id) VALUES (%s, %s, %s, %s, %s, %s, %s)',
        (data['first_name'], data['last_name'], data.get('date_of_birth'), data.get('nationality'), data.get('position'), data.get('shirt_number'), data.get('team_id'))
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Player created', 'id': cursor.lastrowid}), 201


# PUT update a player
@app.route('/players/<int:id>', methods=['PUT'])
def update_player(id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE Players SET first_name=%s, last_name=%s, date_of_birth=%s, nationality=%s, position=%s, shirt_number=%s, team_id=%s WHERE player_id=%s",
        (data['first_name'], data['last_name'], data.get('date_of_birth'), data.get('nationality'), data.get('position'), data.get('shirt_number'), data.get('team_id'), id)
    )
    conn.commit()
    cursor.close()
    return jsonify({'message': 'Player updated'})


# DELETE delete a player
@app.route('/players/<int:id>', methods=['DELETE'])
def delete_player(id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Players WHERE player_id = %s', (id,))
    conn.commit()
    cursor.close()
    return jsonify({'message': 'Player deleted'})


if __name__ == '__main__':
    app.run(debug=True)