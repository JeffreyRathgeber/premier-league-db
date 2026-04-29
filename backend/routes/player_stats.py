from flask import Blueprint, request, jsonify
from db import get_connection

player_stats_bp = Blueprint('player_stats', __name__)


@player_stats_bp.route('/players/<int:player_id>/stats', methods=['GET'])
def get_player_stats(player_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Player_Stats WHERE player_id = %s ORDER BY stat_id', (player_id,))
    stats = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(stats)


@player_stats_bp.route('/players/<int:player_id>/stats', methods=['POST'])
def add_stat(player_id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Player_Stats (player_id, stat_name, stat_value) VALUES (%s, %s, %s)',
        (player_id, data['stat_name'], data['stat_value'])
    )
    conn.commit()
    lastrowid = cursor.lastrowid
    cursor.close()
    conn.close()
    return jsonify({'message': 'Stat added', 'id': lastrowid}), 201


@player_stats_bp.route('/players/<int:player_id>/stats/<int:stat_id>', methods=['PUT'])
def update_stat(player_id, stat_id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Player_Stats SET stat_name=%s, stat_value=%s WHERE stat_id=%s AND player_id=%s',
        (data['stat_name'], data['stat_value'], stat_id, player_id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Stat updated'})


@player_stats_bp.route('/players/<int:player_id>/stats/<int:stat_id>', methods=['DELETE'])
def delete_stat(player_id, stat_id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Player_Stats WHERE stat_id=%s AND player_id=%s', (stat_id, player_id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Stat deleted'})
