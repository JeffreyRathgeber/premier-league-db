from flask import Blueprint, request, jsonify
from db import get_connection

team_stats_bp = Blueprint('team_stats', __name__)


@team_stats_bp.route('/teams/<int:team_id>/stats', methods=['GET'])
def get_team_stats(team_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Team_Stats WHERE team_id = %s ORDER BY stat_id', (team_id,))
    stats = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(stats)


@team_stats_bp.route('/teams/<int:team_id>/stats', methods=['POST'])
def add_stat(team_id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Team_Stats (team_id, stat_name, stat_value) VALUES (%s, %s, %s)',
        (team_id, data['stat_name'], data['stat_value'])
    )
    conn.commit()
    lastrowid = cursor.lastrowid
    cursor.close()
    conn.close()
    return jsonify({'message': 'Stat added', 'id': lastrowid}), 201


@team_stats_bp.route('/teams/<int:team_id>/stats/<int:stat_id>', methods=['PUT'])
def update_stat(team_id, stat_id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Team_Stats SET stat_name=%s, stat_value=%s WHERE stat_id=%s AND team_id=%s',
        (data['stat_name'], data['stat_value'], stat_id, team_id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Stat updated'})


@team_stats_bp.route('/teams/<int:team_id>/stats/<int:stat_id>', methods=['DELETE'])
def delete_stat(team_id, stat_id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Team_Stats WHERE stat_id=%s AND team_id=%s', (stat_id, team_id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Stat deleted'})
