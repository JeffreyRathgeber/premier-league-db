from flask import Blueprint, request, jsonify
from db import get_connection
import mysql.connector

managers_bp = Blueprint('managers', __name__)


@managers_bp.route('/managers', methods=['GET'])
def get_managers():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Managers')
    managers = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(managers)


@managers_bp.route('/managers/<int:id>', methods=['GET'])
def get_manager(id):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Managers WHERE manager_id = %s', (id,))
    manager = cursor.fetchone()
    cursor.close()
    conn.close()
    if manager is None:
        return jsonify({'error': 'Manager not found'}), 404
    return jsonify(manager)


@managers_bp.route('/managers', methods=['POST'])
def create_manager():
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'INSERT INTO Managers (first_name, last_name, nationality) VALUES (%s, %s, %s)',
        (data['first_name'], data['last_name'], data.get('nationality'))
    )
    conn.commit()
    lastrowid = cursor.lastrowid
    cursor.close()
    conn.close()
    return jsonify({'message': 'Manager created', 'id': lastrowid}), 201


@managers_bp.route('/managers/<int:id>', methods=['PUT'])
def update_manager(id):
    data = request.get_json()
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        'UPDATE Managers SET first_name=%s, last_name=%s, nationality=%s WHERE manager_id=%s',
        (data['first_name'], data['last_name'], data.get('nationality'), id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Manager updated'})


@managers_bp.route('/managers/<int:id>', methods=['DELETE'])
def delete_manager(id):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute('DELETE FROM Managers WHERE manager_id = %s', (id,))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Manager deleted'})
    except mysql.connector.IntegrityError:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Cannot delete this manager because they are still assigned to a team. Reassign or remove that team first, then delete the manager.'}), 400
