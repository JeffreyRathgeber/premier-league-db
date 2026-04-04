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


if __name__ == "__main__":
    try:
        conn = get_connection()
        print("Connection successful!")
        conn.close()
    except Exception as e:
        print(f"Connection failed: {e}")