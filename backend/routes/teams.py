from flask import Blueprint, request, jsonify
from db import get_connection
import mysql.connector

teams_bp = Blueprint('teams', __name__)


@teams_bp.route('/teams', methods=['GET'])
def get_teams():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Teams')
    teams = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(teams)


@teams_bp.route('/teams/<int:id>', methods=['GET'])
def get_team(id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Teams WHERE team_id = %s', (id,))
    team = cursor.fetchone()
    cursor.close()
    conn.close()
    if team is None:
        return jsonify({'error': 'Team not found'}), 404
    return jsonify(team)


@teams_bp.route('/teams', methods=['POST'])
def create_team():
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            'INSERT INTO Teams (name, abbreviation, stadium, city, founded_year, manager_id) VALUES (%s, %s, %s, %s, %s, %s)',
            (data['name'], data.get('abbreviation'), data.get('stadium'), data.get('city'), data.get('founded_year'), data.get('manager_id'))
        )
        conn.commit()
        lastrowid = cursor.lastrowid
        cursor.close()
        conn.close()
        return jsonify({'message': 'Team created', 'id': lastrowid}), 201
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': f"Manager ID {data.get('manager_id')} does not exist"}), 400


@teams_bp.route('/teams/<int:id>', methods=['PUT'])
def update_team(id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            'UPDATE Teams SET name=%s, abbreviation=%s, stadium=%s, city=%s, founded_year=%s, manager_id=%s WHERE team_id=%s',
            (data['name'], data.get('abbreviation'), data.get('stadium'), data.get('city'), data.get('founded_year'), data.get('manager_id'), id)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Team updated'})
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': f"Manager ID {data.get('manager_id')} does not exist"}), 400


@teams_bp.route('/teams/<int:id>', methods=['DELETE'])
def delete_team(id):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('DELETE FROM Teams WHERE team_id = %s', (id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Team deleted'})
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Cannot delete this team because it is still referenced by players, matches, or standings. Remove those records first, then delete the team.'}), 400
