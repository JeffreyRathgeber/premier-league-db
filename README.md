# premier-league-db

3-tier web app with MySQL EPL database, Python/Flask backend, and vanilla JS frontend.

## Prerequisites

- Python 3.10+
- MySQL 8.0+ (running locally)
- `git`

## Setup

### 1. Clone the repo

```bash
git clone <repo-url>
cd premier-league-db
```

### 2. Create the database

```bash
mysql -u root -p -e "CREATE DATABASE premier_league;"
```

### 3. Configure DB credentials

Create a `.env` file in the repo root:

```dotenv
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=premier_league
```

(Defaults in `backend/db.py` are `localhost` / `root` / `password` / `premier_league` if `.env` is omitted.)

### 4. Load schema + seed data

From the repo root:

```bash
cat schema/*.sql | mysql -u root -p premier_league
```

This runs all numbered SQL files in order: tables, seed data, triggers, views, functions, procedures, and aggregate views.

### 5. Set up the Python environment

```bash
python3 -m venv venv
source venv/bin/activate          # Windows: venv\Scripts\activate
pip install -r backend/requirements.txt
```

## Running the app

You'll need three terminals (venv activated where applicable).

**Reload schema** (run any time SQL files change):

```bash
cat schema/*.sql | mysql -u root -p premier_league
```

**Frontend** (static files on port 8080):

```bash
cd frontend
python3 -m http.server 8080
```

**Backend** (Flask API):

```bash
cd backend
python app.py
```

Then open <http://localhost:8080> in a browser.
