from flask import Blueprint, jsonify
from db import get_connection

referee_workload_bp = Blueprint('referee_workload', __name__)


@referee_workload_bp.route('/referee-workload', methods=['GET'])
def get_referee_workload():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Referee_Workload')
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(rows)
