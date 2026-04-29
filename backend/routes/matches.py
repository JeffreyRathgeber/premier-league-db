import datetime
from flask import Blueprint, request, jsonify
from db import get_connection
import mysql.connector

matches_bp = Blueprint('matches', __name__)

MATCH_QUERY = '''
    SELECT m.*,
        ht.name AS home_team_name,
        at.name AS away_team_name,
        CONCAT(r.first_name, ' ', r.last_name) AS referee_name
    FROM Matches m
    JOIN Teams ht ON m.home_team_id = ht.team_id
    JOIN Teams at ON m.away_team_id = at.team_id
    JOIN Referees r ON m.referee_id = r.referee_id
'''

def serialize(m):
    if isinstance(m.get('match_date'), datetime.date):
        m['match_date'] = m['match_date'].isoformat()
    if isinstance(m.get('kickoff_time'), datetime.timedelta):
        t = int(m['kickoff_time'].total_seconds())
        m['kickoff_time'] = f'{t//3600:02d}:{(t%3600)//60:02d}:{t%60:02d}'
    return m


@matches_bp.route('/matches/matchdays', methods=['GET'])
def get_matchdays():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT DISTINCT matchday FROM Matches ORDER BY matchday')
    matchdays = [row[0] for row in cursor.fetchall()]
    cursor.close()
    conn.close()
    return jsonify(matchdays)


@matches_bp.route('/matches', methods=['GET'])
def get_matches():
    matchday = request.args.get('matchday')
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    if matchday:
        cursor.execute(MATCH_QUERY + ' WHERE m.matchday = %s ORDER BY m.kickoff_time', (matchday,))
    else:
        cursor.execute(MATCH_QUERY + ' ORDER BY m.matchday, m.kickoff_time')
    matches = [serialize(m) for m in cursor.fetchall()]
    cursor.close()
    conn.close()
    return jsonify(matches)


@matches_bp.route('/matches/<int:match_id>', methods=['GET'])
def get_match(match_id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(MATCH_QUERY + ' WHERE m.match_id = %s', (match_id,))
    match = cursor.fetchone()
    cursor.close()
    conn.close()
    if match is None:
        return jsonify({'error': 'Match not found'}), 404
    return jsonify(serialize(match))


@matches_bp.route('/matches', methods=['POST'])
def create_match():
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            'INSERT INTO Matches (matchday, match_date, kickoff_time, home_team_id, away_team_id, home_score, away_score, referee_id, attendance) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)',
            (data['matchday'], data['match_date'], data['kickoff_time'], data['home_team_id'], data['away_team_id'], data.get('home_score', 0), data.get('away_score', 0), data['referee_id'], data.get('attendance', 0))
        )
        conn.commit()
        lastrowid = cursor.lastrowid
        cursor.close()
        conn.close()
        return jsonify({'message': 'Match created', 'id': lastrowid}), 201
    except mysql.connector.IntegrityError as e:
        cursor.close()
        conn.close()
        return jsonify({'error': str(e)}), 400


@matches_bp.route('/matches/<int:match_id>', methods=['PUT'])
def update_match(match_id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Matches SET matchday=%s, match_date=%s, kickoff_time=%s, home_team_id=%s, away_team_id=%s, home_score=%s, away_score=%s, referee_id=%s, attendance=%s WHERE match_id=%s',
        (data['matchday'], data['match_date'], data['kickoff_time'], data['home_team_id'], data['away_team_id'], data.get('home_score', 0), data.get('away_score', 0), data['referee_id'], data.get('attendance', 0), match_id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Match updated'})


@matches_bp.route('/matches/<int:match_id>', methods=['DELETE'])
def delete_match(match_id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM Matches WHERE match_id = %s', (match_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Match deleted'})
