USE premier_league;

-- just 1 team for now
INSERT INTO Teams (team_id, team_name) VALUES (1, 'Manchester United');

-- just 5 players for now
INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, shirt_number, team_id) VALUES
('Bruno', 'Fernandes', '1994-09-08', 'Portugal', 'CAM', 8, 1),
('Amad', 'Diallo', '2002-07-11', 'Ivory Coast', 'RM', 16, 1),
('Matheus', 'Cunha', '1999-05-27', 'Brazil', 'CAM', 10, 1),
('Benjamin', 'Sesko', '2003-05-31', 'Slovenia', 'ST', 30, 1),
('Bryan', 'Mbeumo', '1999-08-07', 'Cameroon', 'ST', 19, 1);