from flask import Blueprint, request, jsonify
from db import get_connection
import mysql.connector

referees_bp = Blueprint('referees', __name__)


@referees_bp.route('/referees', methods=['GET'])
def get_referees():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Referees')
    referees = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(referees)


@referees_bp.route('/referees/<int:id>', methods=['GET'])
def get_referee(id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Referees WHERE referee_id = %s', (id,))
    referee = cursor.fetchone()
    cursor.close()
    conn.close()
    if referee is None:
        return jsonify({'error': 'Referee not found'}), 404
    return jsonify(referee)


@referees_bp.route('/referees', methods=['POST'])
def create_referee():
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Referees (first_name, last_name, nationality) VALUES (%s, %s, %s)',
        (data['first_name'], data['last_name'], data.get('nationality'))
    )
    conn.commit()
    lastrowid = cursor.lastrowid
    cursor.close()
    conn.close()
    return jsonify({'message': 'Referee created', 'id': lastrowid}), 201


@referees_bp.route('/referees/<int:id>', methods=['PUT'])
def update_referee(id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Referees SET first_name=%s, last_name=%s, nationality=%s WHERE referee_id=%s',
        (data['first_name'], data['last_name'], data.get('nationality'), id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Referee updated'})


@referees_bp.route('/referees/<int:id>', methods=['DELETE'])
def delete_referee(id):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('DELETE FROM Referees WHERE referee_id = %s', (id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Referee deleted'})
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Cannot delete this referee because they are still assigned to one or more matches. Remove those matches first, then delete the referee.'}), 400
