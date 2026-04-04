DROP DATABASE IF EXISTS premier_league;
CREATE DATABASE IF NOT EXISTS premier_league;
USE premier_league;

CREATE TABLE IF NOT EXISTS Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(255) NOT NULL
    -- more rows to come
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