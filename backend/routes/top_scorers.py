from flask import Blueprint, jsonify
from db import get_connection

top_scorers_bp = Blueprint('top_scorers', __name__)


@top_scorers_bp.route('/top-scorers', methods=['GET'])
def get_top_scorers():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Top_Scorers LIMIT 5')
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(rows)
