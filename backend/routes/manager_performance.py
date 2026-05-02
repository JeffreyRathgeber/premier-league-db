from flask import Blueprint, jsonify
from db import get_connection

manager_performance_bp = Blueprint('manager_performance', __name__)


@manager_performance_bp.route('/manager-performance', methods=['GET'])
def get_manager_performance():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Manager_Performance')
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(rows)
