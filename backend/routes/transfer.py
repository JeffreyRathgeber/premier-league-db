from flask import Blueprint, request, jsonify
from db import get_connection
import mysql.connector

transfer_bp = Blueprint('transfer', __name__)


@transfer_bp.route('/transfer/players', methods=['GET'])
def get_players_with_teams():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('''
        SELECT p.player_id, p.first_name, p.last_name, p.position, p.shirt_number,
               p.team_id, t.name AS team_name
        FROM Players p
        LEFT JOIN Teams t ON p.team_id = t.team_id
        ORDER BY t.name, p.last_name
    ''')
    players = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(players)


@transfer_bp.route('/transfer', methods=['POST'])
def transfer_player():
    data = request.get_json()
    player_id = data.get('player_id')
    new_team_id = data.get('new_team_id')
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('CALL transfer_player(%s, %s)', (player_id, new_team_id))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Player transferred'})
    except mysql.connector.Error as e:
        cursor.close()
        conn.close()
        return jsonify({'error': str(e)}), 400
