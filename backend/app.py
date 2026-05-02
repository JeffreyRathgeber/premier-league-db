from flask import Flask
from flask_cors import CORS
from routes.players import players_bp
from routes.managers import managers_bp
from routes.referees import referees_bp
from routes.teams import teams_bp
from routes.team_stats import team_stats_bp
from routes.player_stats import player_stats_bp
from routes.standings import standings_bp
from routes.matches import matches_bp
from routes.top_scorers import top_scorers_bp
from routes.transfer import transfer_bp
from routes.referee_workload import referee_workload_bp
from routes.team_goal_summary import team_goal_summary_bp
from routes.manager_performance import manager_performance_bp


def create_app():
    app = Flask(__name__)
    CORS(app)

    app.register_blueprint(players_bp)
    app.register_blueprint(managers_bp)
    app.register_blueprint(referees_bp)
    app.register_blueprint(teams_bp)
    app.register_blueprint(team_stats_bp)
    app.register_blueprint(player_stats_bp)
    app.register_blueprint(standings_bp)
    app.register_blueprint(matches_bp)
    app.register_blueprint(top_scorers_bp)
    app.register_blueprint(transfer_bp)
    app.register_blueprint(referee_workload_bp)
    app.register_blueprint(team_goal_summary_bp)
    app.register_blueprint(manager_performance_bp)

    return app


if __name__ == '__main__':
    create_app().run(debug=True)
