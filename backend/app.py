from flask import Flask
from flask_cors import CORS
from routes.players import players_bp


def create_app():
    app = Flask(__name__)
    CORS(app)

    app.register_blueprint(players_bp)

    return app


if __name__ == '__main__':
    create_app().run(debug=True)
