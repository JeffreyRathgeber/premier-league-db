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

    return app


if __name__ == '__main__':
    create_app().run(debug=True)
