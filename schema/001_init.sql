DROP DATABASE IF EXISTS premier_league;
CREATE DATABASE IF NOT EXISTS premier_league;
USE premier_league;

CREATE TABLE IF NOT EXISTS Managers (
    manager_id  INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(255) NOT NULL,
    last_name   VARCHAR(255) NOT NULL,
    nationality VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Referees (
    referee_id  INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(255) NOT NULL,
    last_name   VARCHAR(255) NOT NULL,
    nationality VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Teams (
    team_id      INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255) NOT NULL,
    abbreviation VARCHAR(10),
    stadium      VARCHAR(255),
    city         VARCHAR(255),
    founded_year INT,
    manager_id   INT,
    FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
);

CREATE TABLE IF NOT EXISTS Team_Stats (
    stat_id    INT PRIMARY KEY AUTO_INCREMENT,
    team_id    INT NOT NULL,
    stat_name  VARCHAR(255) NOT NULL,
    stat_value FLOAT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE IF NOT EXISTS Players (
    player_id     INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(255) NOT NULL,
    last_name     VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    nationality   VARCHAR(255),
    position      VARCHAR(255),
    shirt_number  INT,
    team_id       INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE IF NOT EXISTS Standings (
    standing_id     INT PRIMARY KEY AUTO_INCREMENT,
    team_id         INT NOT NULL,
    matchday        INT NOT NULL,
    played          INT DEFAULT 0,
    won             INT DEFAULT 0,
    drawn           INT DEFAULT 0,
    lost            INT DEFAULT 0,
    goals_for       INT DEFAULT 0,
    goals_against   INT DEFAULT 0,
    goal_difference INT DEFAULT 0,
    points          INT DEFAULT 0,
    position        INT DEFAULT 0,
    UNIQUE (team_id, matchday),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE IF NOT EXISTS Player_Stats (
    stat_id    INT PRIMARY KEY AUTO_INCREMENT,
    player_id  INT NOT NULL,
    stat_name  VARCHAR(255) NOT NULL,
    stat_value FLOAT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE IF NOT EXISTS Matches (
    match_id      INT PRIMARY KEY AUTO_INCREMENT,
    matchday      INT NOT NULL,
    match_date    DATE,
    kickoff_time  TIME,
    home_team_id  INT NOT NULL,
    away_team_id  INT NOT NULL,
    home_score    INT DEFAULT 0,
    away_score    INT DEFAULT 0,
    referee_id    INT,
    attendance    INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (referee_id)   REFERENCES Referees(referee_id)
);
