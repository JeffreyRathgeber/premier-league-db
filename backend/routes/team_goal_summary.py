from flask import Blueprint, jsonify
from db import get_connection

team_goal_summary_bp = Blueprint('team_goal_summary', __name__)


@team_goal_summary_bp.route('/team-goal-summary', methods=['GET'])
def get_team_goal_summary():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM Team_Goal_Summary')
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(rows)
