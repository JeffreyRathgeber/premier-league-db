USE premier_league;

-- managers (6th: Chelsea's manager)
INSERT INTO Managers (first_name, last_name, nationality) VALUES
('Ruben',  'Amorim',         'Portugal'),
('Arne',   'Slot',           'Netherlands'),
('Pep',    'Guardiola',      'Spain'),
('Mikel',  'Arteta',         'Spain'),
('Nuno',   'Espirito Santo', 'Portugal'),
('Enzo',   'Maresca',        'Italy');

-- referees
INSERT INTO Referees (first_name, last_name, nationality) VALUES
('Michael', 'Oliver',  'English'),
('Anthony', 'Taylor',  'English'),
('Stuart',  'Attwell', 'English'),
('Simon',   'Hooper',  'English'),
('Paul',    'Tierney', 'English');

-- teams (6th: Chelsea)
INSERT INTO Teams (name, abbreviation, stadium, city, founded_year, manager_id) VALUES
('Manchester United',  'MUN', 'Old Trafford',              'Manchester', 1878, 1),
('Liverpool',          'LIV', 'Anfield',                   'Liverpool',  1892, 2),
('Manchester City',    'MCI', 'Etihad Stadium',            'Manchester', 1880, 3),
('Arsenal',            'ARS', 'Emirates Stadium',          'London',     1886, 4),
('Tottenham Hotspur',  'TOT', 'Tottenham Hotspur Stadium', 'London',     1882, 5),
('Chelsea',            'CHE', 'Stamford Bridge',           'London',     1905, 6);

-- team stats
INSERT INTO Team_Stats (team_id, stat_name, stat_value) VALUES
(1,'Total Shots',487), (1,'Shots on Target',168), (1,'Possession Avg %',52.3), (1,'Fouls Committed',312), (1,'Offsides',67), (1,'Corners Won',198),
(2,'Total Shots',521), (2,'Shots on Target',195), (2,'Possession Avg %',58.1), (2,'Fouls Committed',287), (2,'Offsides',54), (2,'Corners Won',221),
(3,'Total Shots',563), (3,'Shots on Target',214), (3,'Possession Avg %',63.4), (3,'Fouls Committed',271), (3,'Offsides',48), (3,'Corners Won',243),
(4,'Total Shots',534), (4,'Shots on Target',201), (4,'Possession Avg %',60.7), (4,'Fouls Committed',294), (4,'Offsides',59), (4,'Corners Won',231),
(5,'Total Shots',412), (5,'Shots on Target',149), (5,'Possession Avg %',48.9), (5,'Fouls Committed',334), (5,'Offsides',72), (5,'Corners Won',176),
(6,'Total Shots',498), (6,'Shots on Target',182), (6,'Possession Avg %',55.6), (6,'Fouls Committed',301), (6,'Offsides',61), (6,'Corners Won',209);

-- standings: 6 teams x 5 matchdays, derived from match results below
-- MUN=1, LIV=2, MCI=3, ARS=4, TOT=5, CHE=6
INSERT INTO Standings (team_id, matchday, played, won, drawn, lost, goals_for, goals_against, goal_difference, points, position) VALUES
(1,1, 1,0,0,1, 0, 3,-3, 0,6), (1,2, 2,0,0,2, 1, 6,-5, 0,6), (1,3, 3,0,1,2, 2, 7,-5, 1,5), (1,4, 4,1,1,2, 4, 8,-4, 4,5), (1,5, 5,1,2,2, 5, 9,-4, 5,5),
(2,1, 1,1,0,0, 3, 0, 3, 3,1), (2,2, 2,2,0,0, 5, 1, 4, 6,1), (2,3, 3,3,0,0, 7, 2, 5, 9,1), (2,4, 4,4,0,0, 9, 2, 7,12,1), (2,5, 5,5,0,0,13, 3,10,15,1),
(3,1, 1,1,0,0, 2, 1, 1, 3,2), (3,2, 2,1,0,1, 3, 3, 0, 3,4), (3,3, 3,2,0,1, 6, 3, 3, 6,2), (3,4, 4,3,0,1, 8, 4, 4, 9,2), (3,5, 5,3,1,1, 9, 5, 4,10,2),
(4,1, 1,0,0,1, 1, 2,-1, 0,4), (4,2, 2,1,0,1, 3, 2, 1, 3,3), (4,3, 3,1,1,1, 4, 3, 1, 4,4), (4,4, 4,1,1,2, 4, 5,-1, 4,4), (4,5, 5,1,2,2, 5, 6,-1, 5,4),
(5,1, 1,0,0,1, 1, 2,-1, 0,5), (5,2, 2,0,0,2, 1, 4,-3, 0,6), (5,3, 3,0,0,3, 2, 6,-4, 0,6), (5,4, 4,0,0,4, 3, 8,-5, 0,6), (5,5, 5,0,1,4, 4, 9,-5, 1,6),
(6,1, 1,1,0,0, 2, 1, 1, 3,3), (6,2, 2,2,0,0, 5, 2, 3, 6,2), (6,3, 3,2,0,1, 5, 5, 0, 6,3), (6,4, 4,2,0,2, 6, 7,-1, 6,3), (6,5, 5,2,0,3, 7,11,-4, 6,3);

-- players (all Man United for now)
INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, shirt_number, team_id) VALUES
('Bruno',    'Fernandes', '1994-09-08', 'Portugal',    'CAM', 8,  1),
('Amad',     'Diallo',    '2002-07-11', 'Ivory Coast', 'RM',  16, 1),
('Matheus',  'Cunha',     '1999-05-27', 'Brazil',      'CAM', 10, 1),
('Benjamin', 'Sesko',     '2003-05-31', 'Slovenia',    'ST',  30, 1),
('Bryan',    'Mbeumo',    '1999-08-07', 'Cameroon',    'ST',  19, 1);

-- player stats
INSERT INTO Player_Stats (player_id, stat_name, stat_value) VALUES
(1,'Appearances',35),(1,'Starts',33),(1,'Minutes Played',2891),(1,'Goals',8), (1,'Assists',14),(1,'Yellow Cards',6),(1,'Red Cards',0),(1,'Clean Sheets',0),
(2,'Appearances',31),(2,'Starts',24),(2,'Minutes Played',2103),(2,'Goals',14),(2,'Assists',7), (2,'Yellow Cards',3),(2,'Red Cards',0),(2,'Clean Sheets',0),
(3,'Appearances',33),(3,'Starts',30),(3,'Minutes Played',2634),(3,'Goals',12),(3,'Assists',9), (3,'Yellow Cards',5),(3,'Red Cards',1),(3,'Clean Sheets',0),
(4,'Appearances',28),(4,'Starts',22),(4,'Minutes Played',1876),(4,'Goals',11),(4,'Assists',3), (4,'Yellow Cards',2),(4,'Red Cards',0),(4,'Clean Sheets',0),
(5,'Appearances',34),(5,'Starts',32),(5,'Minutes Played',2788),(5,'Goals',20),(5,'Assists',8), (5,'Yellow Cards',4),(5,'Red Cards',0),(5,'Clean Sheets',0);

-- 15 matches: 5 matchdays x 3 matches each
-- referee IDs: Oliver=1, Taylor=2, Attwell=3, Hooper=4, Tierney=5
INSERT INTO Matches (matchday, match_date, kickoff_time, home_team_id, away_team_id, home_score, away_score, referee_id, attendance) VALUES
(1, '2024-08-17', '12:30:00', 1, 2, 0, 3, 1, 73211),
(1, '2024-08-17', '15:00:00', 3, 4, 2, 1, 2, 53104),
(1, '2024-08-17', '17:30:00', 5, 6, 1, 2, 3, 62850),
(2, '2024-08-25', '14:00:00', 2, 3, 2, 1, 4, 52990),
(2, '2024-08-25', '16:30:00', 4, 5, 2, 0, 5, 60287),
(2, '2024-08-25', '19:00:00', 6, 1, 3, 1, 1, 40342),
(3, '2024-09-01', '14:00:00', 1, 4, 1, 1, 2, 73219),
(3, '2024-09-01', '16:30:00', 2, 5, 2, 1, 3, 52904),
(3, '2024-09-01', '19:00:00', 3, 6, 3, 0, 4, 53048),
(4, '2024-09-15', '14:00:00', 4, 2, 0, 2, 5, 60167),
(4, '2024-09-15', '16:30:00', 5, 1, 1, 2, 1, 62731),
(4, '2024-09-15', '19:00:00', 6, 3, 1, 2, 2, 40289),
(5, '2024-09-22', '14:00:00', 1, 3, 1, 1, 3, 73108),
(5, '2024-09-22', '16:30:00', 2, 6, 4, 1, 4, 52877),
(5, '2024-09-22', '19:00:00', 4, 5, 1, 1, 5, 60418);
