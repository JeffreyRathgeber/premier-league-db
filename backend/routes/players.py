import datetime
import mysql.connector
from flask import Blueprint, request, jsonify
from db import get_connection

players_bp = Blueprint('players', __name__)


@players_bp.route('/players', methods=['GET'])
def get_players():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Players')
    players = cursor.fetchall()
    cursor.close()
    conn.close()
    for p in players:
        if isinstance(p.get('date_of_birth'), datetime.date):
            p['date_of_birth'] = p['date_of_birth'].isoformat()
    return jsonify(players)


@players_bp.route('/players/<int:id>', methods=['GET'])
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


@players_bp.route('/players', methods=['POST'])
def create_player():
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            'INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, shirt_number, team_id) VALUES (%s, %s, %s, %s, %s, %s, %s)',
            (data['first_name'], data['last_name'], data.get('date_of_birth'), data.get('nationality'), data.get('position'), data.get('shirt_number'), data.get('team_id'))
        )
        conn.commit()
        lastrowid = cursor.lastrowid
        cursor.close()
        conn.close()
        return jsonify({'message': 'Player created', 'id': lastrowid}), 201
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': f"Team ID {data.get('team_id')} does not exist"}), 400


@players_bp.route('/players/<int:id>', methods=['PUT'])
def update_player(id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            'UPDATE Players SET first_name=%s, last_name=%s, date_of_birth=%s, nationality=%s, position=%s, shirt_number=%s, team_id=%s WHERE player_id=%s',
            (data['first_name'], data['last_name'], data.get('date_of_birth'), data.get('nationality'), data.get('position'), data.get('shirt_number'), data.get('team_id'), id)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Player updated'})
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': f"Team ID {data.get('team_id')} does not exist"}), 400


@players_bp.route('/players/<int:id>', methods=['DELETE'])
def delete_player(id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Players WHERE player_id = %s', (id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Player deleted'})
