from flask import Blueprint, request, jsonify
from db import get_connection
import mysql.connector

standings_bp = Blueprint('standings', __name__)


@standings_bp.route('/teams/<int:team_id>/standings', methods=['GET'])
def get_standings(team_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Standings WHERE team_id = %s ORDER BY matchday', (team_id,))
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(rows)


@standings_bp.route('/teams/<int:team_id>/standings/<int:matchday>', methods=['GET'])
def get_matchday(team_id, matchday):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Standings WHERE team_id = %s AND matchday = %s', (team_id, matchday))
    row = cursor.fetchone()
    cursor.close()
    conn.close()
    if row is None:
        return jsonify({'error': 'No standings found'}), 404
    return jsonify(row)


@standings_bp.route('/teams/<int:team_id>/standings', methods=['POST'])
def create_standing(team_id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            'INSERT INTO Standings (team_id, matchday, played, won, drawn, lost, goals_for, goals_against, goal_difference, points, position) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
            (team_id, data['matchday'], data.get('played',0), data.get('won',0), data.get('drawn',0), data.get('lost',0), data.get('goals_for',0), data.get('goals_against',0), data.get('goal_difference',0), data.get('points',0), data.get('position',0))
        )
        conn.commit()
        lastrowid = cursor.lastrowid
        cursor.close()
        conn.close()
        return jsonify({'message': 'Standing created', 'id': lastrowid}), 201
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': f'Matchday {data["matchday"]} already exists for this team'}), 400


@standings_bp.route('/teams/<int:team_id>/standings/<int:matchday>', methods=['PUT'])
def update_standing(team_id, matchday):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Standings SET played=%s, won=%s, drawn=%s, lost=%s, goals_for=%s, goals_against=%s, goal_difference=%s, points=%s, position=%s WHERE team_id=%s AND matchday=%s',
        (data.get('played'), data.get('won'), data.get('drawn'), data.get('lost'), data.get('goals_for'), data.get('goals_against'), data.get('goal_difference'), data.get('points'), data.get('position'), team_id, matchday)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Standing updated'})


@standings_bp.route('/teams/<int:team_id>/standings/<int:matchday>', methods=['DELETE'])
def delete_standing(team_id, matchday):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Standings WHERE team_id=%s AND matchday=%s', (team_id, matchday))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Standing deleted'})
