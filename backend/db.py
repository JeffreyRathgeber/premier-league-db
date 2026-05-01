import mysql.connector
import os
from dotenv import load_dotenv
from pathlib import Path


load_dotenv(Path(__file__).parent.parent / '.env')

def get_connection():
    return mysql.connector.connect(
        host=os.getenv('DB_HOST', 'localhost'),
        user=os.getenv('DB_USER', 'root'),
        password=os.getenv('DB_PASSWORD', 'password'),
        database=os.getenv('DB_NAME', 'premier_league')
    )
