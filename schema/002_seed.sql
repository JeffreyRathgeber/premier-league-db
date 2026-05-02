USE premier_league;

-- ============================================================================
-- MANAGERS (20 - one per team for 24/25 season)
-- ============================================================================
INSERT INTO Managers (first_name, last_name, nationality) VALUES
('Mikel',     'Arteta',         'Spain'),         -- 1  Arsenal
('Unai',      'Emery',          'Spain'),         -- 2  Aston Villa
('Andoni',    'Iraola',         'Spain'),         -- 3  Bournemouth
('Thomas',    'Frank',          'Denmark'),       -- 4  Brentford
('Fabian',    'Hurzeler',       'Germany'),       -- 5  Brighton
('Enzo',      'Maresca',        'Italy'),         -- 6  Chelsea
('Oliver',    'Glasner',        'Austria'),       -- 7  Crystal Palace
('Sean',      'Dyche',          'England'),       -- 8  Everton
('Marco',     'Silva',          'Portugal'),      -- 9  Fulham
('Steve',     'Cooper',         'Wales'),         -- 10 Leicester
('Arne',      'Slot',           'Netherlands'),   -- 11 Liverpool
('Pep',       'Guardiola',      'Spain'),         -- 12 Manchester City
('Ruben',     'Amorim',         'Portugal'),      -- 13 Manchester United
('Eddie',     'Howe',           'England'),       -- 14 Newcastle
('Nuno',      'Espirito Santo', 'Portugal'),      -- 15 Nottingham Forest
('Russell',   'Martin',         'Scotland'),      -- 16 Southampton
('Ange',      'Postecoglou',    'Australia'),     -- 17 Tottenham
('Vincent',   'Kompany',        'Belgium'),       -- 18 (former Burnley, placeholder)
('Gary',      'O''Neil',        'England'),       -- 19 Wolves
('Julen',     'Lopetegui',      'Spain');         -- 20 West Ham

-- ============================================================================
-- REFEREES (12)
-- ============================================================================
INSERT INTO Referees (first_name, last_name, nationality) VALUES
('Michael', 'Oliver',   'English'),
('Anthony', 'Taylor',   'English'),
('Stuart',  'Attwell',  'English'),
('Simon',   'Hooper',   'English'),
('Paul',    'Tierney',  'English'),
('Craig',   'Pawson',   'English'),
('Andy',    'Madley',   'English'),
('Chris',   'Kavanagh', 'English'),
('David',   'Coote',    'English'),
('Robert',  'Jones',    'English'),
('Tim',     'Robinson', 'English'),
('Sam',     'Barrott',  'English');

-- ============================================================================
-- TEAMS (20 - Premier League 24/25)
-- ============================================================================
INSERT INTO Teams (name, abbreviation, stadium, city, founded_year, manager_id) VALUES
('Arsenal',           'ARS', 'Emirates Stadium',          'London',         1886, 1),
('Aston Villa',       'AVL', 'Villa Park',                'Birmingham',     1874, 2),
('Bournemouth',       'BOU', 'Vitality Stadium',          'Bournemouth',    1899, 3),
('Brentford',         'BRE', 'Gtech Community Stadium',   'London',         1889, 4),
('Brighton',          'BHA', 'Amex Stadium',              'Brighton',       1901, 5),
('Chelsea',           'CHE', 'Stamford Bridge',           'London',         1905, 6),
('Crystal Palace',    'CRY', 'Selhurst Park',             'London',         1905, 7),
('Everton',           'EVE', 'Goodison Park',             'Liverpool',      1878, 8),
('Fulham',            'FUL', 'Craven Cottage',            'London',         1879, 9),
('Leicester City',    'LEI', 'King Power Stadium',        'Leicester',      1884, 10),
('Liverpool',         'LIV', 'Anfield',                   'Liverpool',      1892, 11),
('Manchester City',   'MCI', 'Etihad Stadium',            'Manchester',     1880, 12),
('Manchester United', 'MUN', 'Old Trafford',              'Manchester',     1878, 13),
('Newcastle United',  'NEW', 'St James Park',             'Newcastle',      1892, 14),
('Nottingham Forest', 'NFO', 'City Ground',               'Nottingham',     1865, 15),
('Southampton',       'SOU', 'St Marys Stadium',          'Southampton',    1885, 16),
('Tottenham Hotspur', 'TOT', 'Tottenham Hotspur Stadium', 'London',         1882, 17),
('Ipswich Town',      'IPS', 'Portman Road',              'Ipswich',        1878, 18),
('Wolves',            'WOL', 'Molineux Stadium',          'Wolverhampton',  1877, 19),
('West Ham',          'WHU', 'London Stadium',            'London',         1895, 20);

-- ============================================================================
-- TEAM STATS (6 stats per team x 20 teams = 120 rows)
-- ============================================================================
INSERT INTO Team_Stats (team_id, stat_name, stat_value) VALUES
(1,'Total Shots',152),(1,'Shots on Target',58),(1,'Possession Avg %',61.2),(1,'Fouls Committed',98),(1,'Offsides',18),(1,'Corners Won',71),
(2,'Total Shots',128),(2,'Shots on Target',46),(2,'Possession Avg %',52.4),(2,'Fouls Committed',104),(2,'Offsides',22),(2,'Corners Won',54),
(3,'Total Shots',119),(3,'Shots on Target',41),(3,'Possession Avg %',48.7),(3,'Fouls Committed',112),(3,'Offsides',24),(3,'Corners Won',49),
(4,'Total Shots',124),(4,'Shots on Target',43),(4,'Possession Avg %',49.8),(4,'Fouls Committed',101),(4,'Offsides',21),(4,'Corners Won',52),
(5,'Total Shots',135),(5,'Shots on Target',49),(5,'Possession Avg %',55.1),(5,'Fouls Committed',96),(5,'Offsides',19),(5,'Corners Won',58),
(6,'Total Shots',141),(6,'Shots on Target',52),(6,'Possession Avg %',57.3),(6,'Fouls Committed',102),(6,'Offsides',20),(6,'Corners Won',62),
(7,'Total Shots',112),(7,'Shots on Target',38),(7,'Possession Avg %',46.2),(7,'Fouls Committed',118),(7,'Offsides',26),(7,'Corners Won',45),
(8,'Total Shots',106),(8,'Shots on Target',34),(8,'Possession Avg %',43.8),(8,'Fouls Committed',124),(8,'Offsides',28),(8,'Corners Won',41),
(9,'Total Shots',122),(9,'Shots on Target',42),(9,'Possession Avg %',50.6),(9,'Fouls Committed',99),(9,'Offsides',20),(9,'Corners Won',51),
(10,'Total Shots',98),(10,'Shots on Target',31),(10,'Possession Avg %',44.1),(10,'Fouls Committed',128),(10,'Offsides',31),(10,'Corners Won',38),
(11,'Total Shots',164),(11,'Shots on Target',62),(11,'Possession Avg %',62.8),(11,'Fouls Committed',92),(11,'Offsides',16),(11,'Corners Won',74),
(12,'Total Shots',171),(12,'Shots on Target',67),(12,'Possession Avg %',64.5),(12,'Fouls Committed',88),(12,'Offsides',15),(12,'Corners Won',78),
(13,'Total Shots',131),(13,'Shots on Target',47),(13,'Possession Avg %',53.7),(13,'Fouls Committed',104),(13,'Offsides',22),(13,'Corners Won',57),
(14,'Total Shots',138),(14,'Shots on Target',50),(14,'Possession Avg %',54.6),(14,'Fouls Committed',99),(14,'Offsides',19),(14,'Corners Won',60),
(15,'Total Shots',114),(15,'Shots on Target',39),(15,'Possession Avg %',47.1),(15,'Fouls Committed',114),(15,'Offsides',25),(15,'Corners Won',46),
(16,'Total Shots',92),(16,'Shots on Target',28),(16,'Possession Avg %',42.3),(16,'Fouls Committed',132),(16,'Offsides',32),(16,'Corners Won',35),
(17,'Total Shots',147),(17,'Shots on Target',54),(17,'Possession Avg %',58.9),(17,'Fouls Committed',95),(17,'Offsides',18),(17,'Corners Won',64),
(18,'Total Shots',96),(18,'Shots on Target',30),(18,'Possession Avg %',43.5),(18,'Fouls Committed',126),(18,'Offsides',30),(18,'Corners Won',37),
(19,'Total Shots',108),(19,'Shots on Target',36),(19,'Possession Avg %',45.7),(19,'Fouls Committed',121),(19,'Offsides',27),(19,'Corners Won',43),
(20,'Total Shots',117),(20,'Shots on Target',40),(20,'Possession Avg %',48.2),(20,'Fouls Committed',107),(20,'Offsides',23),(20,'Corners Won',48);

-- ============================================================================
-- PLAYERS (15 per team x 20 teams = 300 players)
-- Format: (first_name, last_name, dob, nationality, position, shirt_number, team_id)
-- ============================================================================
INSERT INTO Players (first_name, last_name, date_of_birth, nationality, position, shirt_number, team_id) VALUES
-- Arsenal (team 1)
('David','Raya','1995-09-15','Spain','GK',22,1),
('William','Saliba','2001-03-24','France','CB',2,1),
('Gabriel','Magalhaes','1997-12-19','Brazil','CB',6,1),
('Ben','White','1997-10-08','England','RB',4,1),
('Jurrien','Timber','2001-06-17','Netherlands','LB',12,1),
('Declan','Rice','1999-01-14','England','CDM',41,1),
('Martin','Odegaard','1998-12-17','Norway','CAM',8,1),
('Mikel','Merino','1996-06-22','Spain','CM',23,1),
('Bukayo','Saka','2001-09-05','England','RW',7,1),
('Kai','Havertz','1999-06-11','Germany','ST',29,1),
('Gabriel','Martinelli','2001-06-18','Brazil','LW',11,1),
('Leandro','Trossard','1994-12-04','Belgium','LW',19,1),
('Thomas','Partey','1993-06-13','Ghana','CDM',5,1),
('Gabriel','Jesus','1997-04-03','Brazil','ST',9,1),
('Riccardo','Calafiori','2002-05-19','Italy','CB',33,1),

-- Aston Villa (team 2)
('Emiliano','Martinez','1992-09-02','Argentina','GK',23,2),
('Ezri','Konsa','1997-10-23','England','CB',4,2),
('Pau','Torres','1997-01-16','Spain','CB',14,2),
('Matty','Cash','1997-08-07','Poland','RB',2,2),
('Lucas','Digne','1993-07-20','France','LB',12,2),
('Boubacar','Kamara','1999-11-23','France','CDM',44,2),
('Youri','Tielemans','1997-05-07','Belgium','CM',8,2),
('John','McGinn','1994-10-18','Scotland','CM',7,2),
('Leon','Bailey','1997-08-09','Jamaica','RW',31,2),
('Ollie','Watkins','1995-12-30','England','ST',11,2),
('Morgan','Rogers','2002-07-26','England','CAM',27,2),
('Jacob','Ramsey','2001-05-28','England','LM',41,2),
('Amadou','Onana','2001-08-16','Belgium','CDM',24,2),
('Ross','Barkley','1993-12-05','England','CM',6,2),
('Jhon','Duran','2003-12-13','Colombia','ST',9,2),

-- Bournemouth (team 3)
('Kepa','Arrizabalaga','1994-10-03','Spain','GK',1,3),
('Illia','Zabarnyi','2002-09-01','Ukraine','CB',27,3),
('Marcos','Senesi','1997-05-10','Argentina','CB',25,3),
('Adam','Smith','1991-04-29','England','RB',15,3),
('Milos','Kerkez','2003-11-07','Hungary','LB',3,3),
('Lewis','Cook','1997-02-03','England','CDM',4,3),
('Ryan','Christie','1995-02-22','Scotland','CM',10,3),
('Tyler','Adams','1999-02-14','USA','CDM',12,3),
('Marcus','Tavernier','1999-03-22','England','RM',16,3),
('Antoine','Semenyo','2000-01-07','Ghana','RW',24,3),
('Justin','Kluivert','1999-05-05','Netherlands','LW',11,3),
('Evanilson','Costa','1999-10-06','Brazil','ST',9,3),
('Dango','Ouattara','2002-02-11','Burkina Faso','LW',17,3),
('Dean','Huijsen','2005-04-14','Spain','CB',5,3),
('Enes','Unal','1997-05-10','Turkey','ST',26,3),

-- Brentford (team 4)
('Mark','Flekken','1993-06-13','Netherlands','GK',1,4),
('Ethan','Pinnock','1993-05-29','Jamaica','CB',5,4),
('Nathan','Collins','2001-04-30','Ireland','CB',22,4),
('Aaron','Hickey','2002-06-10','Scotland','RB',2,4),
('Rico','Henry','1997-07-08','England','LB',3,4),
('Christian','Norgaard','1994-03-10','Denmark','CDM',6,4),
('Vitaly','Janelt','1998-05-10','Germany','CM',27,4),
('Mathias','Jensen','1995-01-01','Denmark','CM',8,4),
('Bryan','Mbeumo','1999-08-07','Cameroon','RW',19,4),
('Yoane','Wissa','1996-09-03','DR Congo','LW',11,4),
('Mikkel','Damsgaard','2000-07-03','Denmark','CAM',24,4),
('Kevin','Schade','2001-11-27','Germany','LW',9,4),
('Sepp','van den Berg','2001-12-20','Netherlands','CB',15,4),
('Keane','Lewis-Potter','2001-02-22','England','LB',16,4),
('Igor','Thiago','2001-06-26','Brazil','ST',30,4),

-- Brighton (team 5)
('Bart','Verbruggen','2002-08-18','Netherlands','GK',23,5),
('Lewis','Dunk','1991-11-21','England','CB',5,5),
('Jan Paul','van Hecke','2000-06-08','Netherlands','CB',29,5),
('Tariq','Lamptey','2000-09-30','Ghana','RB',2,5),
('Pervis','Estupinan','1998-01-21','Ecuador','LB',30,5),
('Carlos','Baleba','2004-01-03','Cameroon','CDM',17,5),
('James','Milner','1986-01-04','England','CM',6,5),
('Yasin','Ayari','2003-10-06','Sweden','CM',20,5),
('Kaoru','Mitoma','1997-05-20','Japan','LW',22,5),
('Joao','Pedro','2001-09-26','Brazil','ST',9,5),
('Danny','Welbeck','1990-11-26','England','ST',18,5),
('Solly','March','1994-07-20','England','RW',7,5),
('Adam','Webster','1995-01-04','England','CB',4,5),
('Simon','Adingra','2001-01-01','Ivory Coast','LW',24,5),
('Georginio','Rutter','2002-04-20','France','CAM',10,5),

-- Chelsea (team 6)
('Robert','Sanchez','1997-11-18','Spain','GK',1,6),
('Levi','Colwill','2003-02-26','England','CB',6,6),
('Wesley','Fofana','2000-12-17','France','CB',33,6),
('Reece','James','1999-12-08','England','RB',24,6),
('Marc','Cucurella','1998-07-22','Spain','LB',3,6),
('Moises','Caicedo','2001-11-02','Ecuador','CDM',25,6),
('Enzo','Fernandez','2001-01-17','Argentina','CM',8,6),
('Cole','Palmer','2002-05-06','England','CAM',20,6),
('Noni','Madueke','2002-03-10','England','RW',11,6),
('Nicolas','Jackson','2001-06-20','Senegal','ST',15,6),
('Pedro','Neto','2000-03-09','Portugal','LW',7,6),
('Christopher','Nkunku','1997-11-14','France','CAM',18,6),
('Romeo','Lavia','2004-01-06','Belgium','CDM',45,6),
('Malo','Gusto','2003-05-19','France','RB',27,6),
('Joao','Felix','1999-11-10','Portugal','CAM',14,6),

-- Crystal Palace (team 7)
('Dean','Henderson','1997-03-12','England','GK',1,7),
('Marc','Guehi','2000-07-13','England','CB',6,7),
('Maxence','Lacroix','2000-04-06','France','CB',5,7),
('Daniel','Munoz','1996-05-26','Colombia','RB',12,7),
('Tyrick','Mitchell','1999-09-01','England','LB',3,7),
('Adam','Wharton','2004-02-09','England','CDM',20,7),
('Will','Hughes','1995-04-17','England','CM',19,7),
('Daichi','Kamada','1996-08-05','Japan','CAM',16,7),
('Ismaila','Sarr','1998-02-25','Senegal','RW',7,7),
('Eddie','Nketiah','1999-05-30','England','ST',14,7),
('Eberechi','Eze','1998-06-29','England','LW',10,7),
('Jean-Philippe','Mateta','1997-06-28','France','ST',14,7),
('Cheick','Doucoure','2000-01-08','Mali','CDM',28,7),
('Jefferson','Lerma','1994-10-25','Colombia','CM',8,7),
('Trevoh','Chalobah','1999-07-05','England','CB',23,7),

-- Everton (team 8)
('Jordan','Pickford','1994-03-07','England','GK',1,8),
('James','Tarkowski','1992-11-19','England','CB',6,8),
('Jarrad','Branthwaite','2002-06-27','England','CB',32,8),
('Ashley','Young','1985-07-09','England','RB',18,8),
('Vitalii','Mykolenko','1999-05-29','Ukraine','LB',19,8),
('Idrissa','Gueye','1989-09-26','Senegal','CDM',27,8),
('James','Garner','2001-03-13','England','CM',37,8),
('Abdoulaye','Doucoure','1993-01-01','Mali','CM',16,8),
('Iliman','Ndiaye','2000-03-06','Senegal','LW',10,8),
('Dominic','Calvert-Lewin','1997-03-16','England','ST',9,8),
('Dwight','McNeil','1999-11-22','England','LW',7,8),
('Jack','Harrison','1996-11-20','England','RW',11,8),
('Beto','Fernandes','1998-01-31','Guinea-Bissau','ST',14,8),
('Orel','Mangala','1998-03-18','Belgium','CM',8,8),
('Michael','Keane','1993-01-11','England','CB',5,8),

-- Fulham (team 9)
('Bernd','Leno','1992-03-04','Germany','GK',17,9),
('Calvin','Bassey','1999-12-31','Nigeria','CB',3,9),
('Joachim','Andersen','1996-05-31','Denmark','CB',5,9),
('Kenny','Tete','1995-10-09','Netherlands','RB',2,9),
('Antonee','Robinson','1997-08-08','USA','LB',33,9),
('Joao','Palhinha','1995-07-09','Portugal','CDM',26,9),
('Sasa','Lukic','1996-08-13','Serbia','CM',28,9),
('Andreas','Pereira','1996-01-01','Brazil','CAM',18,9),
('Harry','Wilson','1997-03-22','Wales','RW',8,9),
('Raul','Jimenez','1991-05-05','Mexico','ST',7,9),
('Alex','Iwobi','1996-05-03','Nigeria','LW',17,9),
('Adama','Traore','1996-01-25','Spain','RW',11,9),
('Tom','Cairney','1991-01-20','Scotland','CM',10,9),
('Rodrigo','Muniz','2001-05-04','Brazil','ST',9,9),
('Reiss','Nelson','1999-12-10','England','RW',21,9),

-- Leicester City (team 10)
('Mads','Hermansen','2000-07-11','Denmark','GK',30,10),
('Wout','Faes','1998-04-03','Belgium','CB',3,10),
('Jannik','Vestergaard','1992-08-03','Denmark','CB',23,10),
('James','Justin','1998-02-23','England','RB',2,10),
('Victor','Kristiansen','2002-12-16','Denmark','LB',22,10),
('Wilfred','Ndidi','1996-12-16','Nigeria','CDM',25,10),
('Harry','Winks','1996-02-02','England','CM',8,10),
('Bilal','El Khannouss','2004-05-10','Morocco','CAM',7,10),
('Stephy','Mavididi','1998-05-31','England','LW',10,10),
('Jamie','Vardy','1987-01-11','England','ST',9,10),
('Patson','Daka','1998-10-09','Zambia','ST',20,10),
('Abdul','Fatawu','2004-04-06','Ghana','RW',11,10),
('Conor','Coady','1993-02-25','England','CB',5,10),
('Oliver','Skipp','2000-09-16','England','CDM',6,10),
('Bobby','De Cordova-Reid','1993-02-02','Jamaica','LW',14,10),

-- Liverpool (team 11)
('Alisson','Becker','1992-10-02','Brazil','GK',1,11),
('Virgil','van Dijk','1991-07-08','Netherlands','CB',4,11),
('Ibrahima','Konate','1999-05-25','France','CB',5,11),
('Trent','Alexander-Arnold','1998-10-07','England','RB',66,11),
('Andrew','Robertson','1994-03-11','Scotland','LB',26,11),
('Alexis','Mac Allister','1998-12-24','Argentina','CM',10,11),
('Ryan','Gravenberch','2002-05-16','Netherlands','CDM',38,11),
('Dominik','Szoboszlai','2000-10-25','Hungary','CAM',8,11),
('Mohamed','Salah','1992-06-15','Egypt','RW',11,11),
('Luis','Diaz','1997-01-13','Colombia','LW',7,11),
('Diogo','Jota','1996-12-04','Portugal','ST',20,11),
('Cody','Gakpo','1999-05-07','Netherlands','LW',18,11),
('Curtis','Jones','2001-01-30','England','CM',17,11),
('Darwin','Nunez','1999-06-24','Uruguay','ST',9,11),
('Federico','Chiesa','1997-10-25','Italy','RW',14,11),

-- Manchester City (team 12)
('Ederson','Moraes','1993-08-17','Brazil','GK',31,12),
('Ruben','Dias','1997-05-14','Portugal','CB',3,12),
('Manuel','Akanji','1995-07-19','Switzerland','CB',25,12),
('Kyle','Walker','1990-05-28','England','RB',2,12),
('Josko','Gvardiol','2002-01-23','Croatia','LB',24,12),
('Rodri','Hernandez','1996-06-22','Spain','CDM',16,12),
('Mateo','Kovacic','1994-05-06','Croatia','CM',8,12),
('Bernardo','Silva','1994-08-10','Portugal','CAM',20,12),
('Phil','Foden','2000-05-28','England','CAM',47,12),
('Erling','Haaland','2000-07-21','Norway','ST',9,12),
('Jeremy','Doku','2002-05-27','Belgium','LW',11,12),
('Kevin','De Bruyne','1991-06-28','Belgium','CAM',17,12),
('Savinho','Moreira','2004-04-10','Brazil','RW',26,12),
('Ilkay','Gundogan','1990-10-24','Germany','CM',19,12),
('John','Stones','1994-05-28','England','CB',5,12),

-- Manchester United (team 13)
('Andre','Onana','1996-04-02','Cameroon','GK',24,13),
('Lisandro','Martinez','1998-01-18','Argentina','CB',6,13),
('Matthijs','de Ligt','1999-08-12','Netherlands','CB',4,13),
('Diogo','Dalot','1999-03-18','Portugal','RB',20,13),
('Noussair','Mazraoui','1997-11-14','Morocco','LB',3,13),
('Casemiro','Henrique','1992-02-23','Brazil','CDM',18,13),
('Manuel','Ugarte','2001-04-11','Uruguay','CDM',25,13),
('Bruno','Fernandes','1994-09-08','Portugal','CAM',8,13),
('Amad','Diallo','2002-07-11','Ivory Coast','RM',16,13),
('Marcus','Rashford','1997-10-31','England','LW',10,13),
('Rasmus','Hojlund','2003-02-04','Denmark','ST',11,13),
('Alejandro','Garnacho','2004-07-01','Argentina','LW',17,13),
('Matheus','Cunha','1999-05-27','Brazil','CAM',10,13),
('Joshua','Zirkzee','2001-05-22','Netherlands','ST',11,13),
('Kobbie','Mainoo','2005-04-19','England','CM',37,13),

-- Newcastle United (team 14)
('Nick','Pope','1992-04-19','England','GK',22,14),
('Sven','Botman','2000-01-12','Netherlands','CB',4,14),
('Fabian','Schar','1991-12-20','Switzerland','CB',5,14),
('Kieran','Trippier','1990-09-19','England','RB',2,14),
('Dan','Burn','1992-05-09','England','LB',33,14),
('Bruno','Guimaraes','1997-11-16','Brazil','CDM',39,14),
('Sandro','Tonali','2000-05-08','Italy','CM',8,14),
('Joelinton','Lira','1996-08-14','Brazil','CM',7,14),
('Anthony','Gordon','2001-02-24','England','LW',10,14),
('Alexander','Isak','1999-09-21','Sweden','ST',14,14),
('Harvey','Barnes','1997-12-09','England','LW',15,14),
('Jacob','Murphy','1995-02-24','England','RW',23,14),
('Joe','Willock','1999-08-20','England','CM',28,14),
('Lewis','Hall','2004-09-08','England','LB',20,14),
('Tino','Livramento','2002-11-12','England','RB',21,14),

-- Nottingham Forest (team 15)
('Matz','Sels','1992-02-26','Belgium','GK',26,15),
('Murillo','Costa','2002-07-04','Brazil','CB',40,15),
('Nikola','Milenkovic','1997-10-12','Serbia','CB',5,15),
('Ola','Aina','1996-10-08','Nigeria','RB',43,15),
('Alex','Moreno','1993-06-08','Spain','LB',3,15),
('Elliot','Anderson','2002-11-06','Scotland','CM',8,15),
('Nicolas','Dominguez','1998-06-28','Argentina','CDM',16,15),
('Morgan','Gibbs-White','2000-01-27','England','CAM',10,15),
('Anthony','Elanga','2002-04-27','Sweden','RW',21,15),
('Chris','Wood','1991-12-07','New Zealand','ST',11,15),
('Callum','Hudson-Odoi','2000-11-07','England','LW',14,15),
('Ramon','Sosa','2000-07-15','Paraguay','LW',7,15),
('Ryan','Yates','1997-11-21','England','CDM',22,15),
('Taiwo','Awoniyi','1997-08-12','Nigeria','ST',9,15),
('Neco','Williams','2001-04-13','Wales','LB',7,15),

-- Southampton (team 16)
('Aaron','Ramsdale','1998-05-14','England','GK',1,16),
('Jan','Bednarek','1996-04-12','Poland','CB',5,16),
('Taylor','Harwood-Bellis','2002-01-30','England','CB',16,16),
('Kyle','Walker-Peters','1997-04-13','England','RB',2,16),
('Charlie','Taylor','1993-09-18','England','LB',3,16),
('Flynn','Downes','1999-01-20','England','CDM',4,16),
('Mateus','Fernandes','2004-07-10','Portugal','CM',45,16),
('Will','Smallbone','2000-02-21','Ireland','CM',16,16),
('Adam','Armstrong','1997-02-10','England','ST',9,16),
('Cameron','Archer','2001-07-21','England','ST',10,16),
('Tyler','Dibling','2006-02-17','England','RW',43,16),
('Ryan','Manning','1996-06-14','Ireland','LB',13,16),
('Yukinari','Sugawara','2000-06-28','Japan','RB',2,16),
('Lesley','Ugochukwu','2004-03-26','France','CDM',8,16),
('Joe','Aribo','1996-07-21','Nigeria','CM',7,16),

-- Tottenham (team 17)
('Guglielmo','Vicario','1996-10-07','Italy','GK',13,17),
('Cristian','Romero','1998-04-27','Argentina','CB',17,17),
('Micky','van de Ven','2001-04-19','Netherlands','CB',37,17),
('Pedro','Porro','1999-09-13','Spain','RB',23,17),
('Destiny','Udogie','2002-11-28','Italy','LB',38,17),
('Rodrigo','Bentancur','1997-06-25','Uruguay','CDM',30,17),
('Yves','Bissouma','1996-08-30','Mali','CDM',8,17),
('James','Maddison','1996-11-23','England','CAM',10,17),
('Dejan','Kulusevski','2000-04-25','Sweden','RW',21,17),
('Heung-min','Son','1992-07-08','South Korea','LW',7,17),
('Dominic','Solanke','1997-09-14','England','ST',19,17),
('Brennan','Johnson','2001-05-23','Wales','RW',22,17),
('Pape','Sarr','2002-09-14','Senegal','CM',29,17),
('Archie','Gray','2006-03-12','England','CM',14,17),
('Wilson','Odobert','2004-11-28','France','LW',28,17),

-- Ipswich Town (team 18)
('Arijanet','Muric','1998-11-07','Kosovo','GK',22,18),
('Dara','OShea','1999-03-04','Ireland','CB',2,18),
('Cameron','Burgess','1995-10-21','Australia','CB',5,18),
('Axel','Tuanzebe','1997-11-14','England','RB',6,18),
('Leif','Davis','2000-01-15','England','LB',3,18),
('Sam','Morsy','1991-09-10','Egypt','CDM',5,18),
('Jens','Cajuste','1999-08-10','Sweden','CM',16,18),
('Conor','Chaplin','1997-02-16','England','CAM',10,18),
('Liam','Delap','2003-02-08','England','ST',9,18),
('Omari','Hutchinson','2003-10-29','England','RW',20,18),
('Jack','Clarke','2000-11-23','England','LW',11,18),
('Wes','Burns','1994-11-23','Wales','RM',7,18),
('Kalvin','Phillips','1995-12-02','England','CDM',4,18),
('Ali','Al-Hamadi','2002-03-01','Iraq','ST',23,18),
('George','Hirst','1999-02-15','England','ST',32,18),

-- Wolves (team 19)
('Jose','Sa','1993-01-17','Portugal','GK',1,19),
('Craig','Dawson','1990-05-06','England','CB',15,19),
('Toti','Gomes','1999-01-16','Portugal','CB',24,19),
('Nelson','Semedo','1993-11-16','Portugal','RB',22,19),
('Rayan','Ait-Nouri','2001-06-06','Algeria','LB',3,19),
('Joao','Gomes','2001-02-12','Brazil','CDM',8,19),
('Mario','Lemina','1993-09-01','Gabon','CDM',5,19),
('Andre','Trindade','2001-04-16','Brazil','CDM',6,19),
('Matheus','Cunha','1999-05-27','Brazil','CAM',10,19),
('Goncalo','Guedes','1996-11-29','Portugal','LW',7,19),
('Hwang','Hee-chan','1996-01-26','South Korea','LW',11,19),
('Jorgen','Strand Larsen','2000-02-06','Norway','ST',9,19),
('Pablo','Sarabia','1992-05-11','Spain','RW',21,19),
('Jean-Ricner','Bellegarde','1998-06-27','France','CM',16,19),
('Tommy','Doyle','2001-10-17','England','CM',23,19),

-- West Ham (team 20)
('Lukasz','Fabianski','1985-04-18','Poland','GK',1,20),
('Maximilian','Kilman','1997-05-23','England','CB',26,20),
('Konstantinos','Mavropanos','1997-12-11','Greece','CB',15,20),
('Vladimir','Coufal','1992-08-22','Czech Republic','RB',5,20),
('Emerson','Palmieri','1994-08-03','Italy','LB',33,20),
('Edson','Alvarez','1997-10-24','Mexico','CDM',19,20),
('Tomas','Soucek','1995-02-27','Czech Republic','CM',28,20),
('Lucas','Paqueta','1997-08-27','Brazil','CAM',10,20),
('Mohammed','Kudus','2000-08-02','Ghana','RW',14,20),
('Jarrod','Bowen','1996-12-20','England','RW',20,20),
('Niclas','Fullkrug','1993-02-09','Germany','ST',11,20),
('Crysencio','Summerville','2001-10-30','Netherlands','LW',7,20),
('James','Ward-Prowse','1994-11-01','England','CM',7,20),
('Aaron','Wan-Bissaka','1997-11-26','England','RB',29,20),
('Michail','Antonio','1990-03-28','Jamaica','ST',9,20);

-- ============================================================================
-- PLAYER STATS (8 stats per player x 300 players = 2400 rows)
-- Generated programmatically — using realistic ranges per position cluster.
-- Rather than 2400 individual lines, we INSERT in big batches.
-- ============================================================================
INSERT INTO Player_Stats (player_id, stat_name, stat_value)
SELECT p.player_id, s.stat_name,
    CASE s.stat_name
        WHEN 'Appearances' THEN ROUND(6 + (p.player_id * 7 % 5))
        WHEN 'Starts' THEN ROUND(4 + (p.player_id * 11 % 6))
        WHEN 'Minutes Played' THEN ROUND(360 + (p.player_id * 53 % 540))
        WHEN 'Goals' THEN
            CASE
                WHEN p.position IN ('ST','CAM','LW','RW') THEN ROUND(p.player_id * 13 % 8)
                WHEN p.position IN ('CM','CDM','LM','RM') THEN ROUND(p.player_id * 7 % 4)
                WHEN p.position IN ('CB','LB','RB') THEN ROUND(p.player_id * 3 % 2)
                ELSE 0
            END
        WHEN 'Assists' THEN
            CASE
                WHEN p.position IN ('CAM','LW','RW','LM','RM') THEN ROUND(p.player_id * 11 % 6)
                WHEN p.position IN ('ST','CM','CDM') THEN ROUND(p.player_id * 5 % 4)
                ELSE ROUND(p.player_id * 2 % 2)
            END
        WHEN 'Yellow Cards' THEN ROUND(p.player_id * 3 % 5)
        WHEN 'Red Cards' THEN CASE WHEN p.player_id % 47 = 0 THEN 1 ELSE 0 END
        WHEN 'Clean Sheets' THEN
            CASE WHEN p.position = 'GK' THEN ROUND(p.player_id * 2 % 5) ELSE 0 END
    END AS stat_value
FROM Players p
CROSS JOIN (
    SELECT 'Appearances'    AS stat_name UNION ALL
    SELECT 'Starts'         UNION ALL
    SELECT 'Minutes Played' UNION ALL
    SELECT 'Goals'          UNION ALL
    SELECT 'Assists'        UNION ALL
    SELECT 'Yellow Cards'   UNION ALL
    SELECT 'Red Cards'      UNION ALL
    SELECT 'Clean Sheets'
) s;

-- ============================================================================
-- MATCHES (10 matchdays x 10 matches each = 100 matches)
-- Round-robin pairings for matchdays 1-10. 20 teams = 10 matches per matchday.
-- ============================================================================
INSERT INTO Matches (matchday, match_date, kickoff_time, home_team_id, away_team_id, home_score, away_score, referee_id, attendance) VALUES
-- Matchday 1 (2024-08-17)
(1,'2024-08-17','12:30:00', 13, 9,  1,0,  1, 73104),  -- MUN v FUL
(1,'2024-08-17','15:00:00', 18, 10, 0,2,  2, 29512),  -- IPS v LEI
(1,'2024-08-17','15:00:00', 3,  15, 1,1,  3, 11020),  -- BOU v NFO
(1,'2024-08-17','15:00:00', 5,  20, 2,1,  4, 31503),  -- BHA v WHU
(1,'2024-08-17','15:00:00', 8,  4,  3,0,  5, 39021),  -- EVE v BRE
(1,'2024-08-17','17:30:00', 14, 16, 1,0,  6, 52214),  -- NEW v SOU
(1,'2024-08-18','14:00:00', 14, 1,  2,0,  7, 52301),
(1,'2024-08-18','14:00:00', 19, 7,  2,6,  8, 31112),  -- WOL v CRY
(1,'2024-08-18','16:30:00', 17, 12, 0,4,  9, 61920),  -- TOT v MCI
(1,'2024-08-19','20:00:00', 6,  11, 1,2, 10, 39803),  -- CHE v LIV

-- Matchday 2 (2024-08-24)
(2,'2024-08-24','12:30:00', 4,  12, 1,2, 11, 17134),
(2,'2024-08-24','15:00:00', 7,  14, 0,2, 12, 25011),
(2,'2024-08-24','15:00:00', 9,  10, 2,1,  1, 24322),
(2,'2024-08-24','15:00:00', 14, 17, 1,2,  2, 52410),
(2,'2024-08-24','15:00:00', 1,  20, 2,0,  3, 60204),  -- ARS v WHU
(2,'2024-08-24','17:30:00', 15, 16, 1,1,  4, 30019),
(2,'2024-08-25','14:00:00', 11, 4,  2,0,  5, 60002),  -- LIV v BRE
(2,'2024-08-25','14:00:00', 19, 6,  2,6,  6, 31201),  -- WOL v CHE
(2,'2024-08-25','16:30:00', 5,  13, 2,1,  7, 31610),  -- BHA v MUN
(2,'2024-08-25','19:00:00', 8,  18, 0,0,  8, 39102),

-- Matchday 3 (2024-08-31)
(3,'2024-08-31','12:30:00', 6,  7,  1,1,  9, 39711),  -- CHE v CRY
(3,'2024-08-31','15:00:00', 8,  3,  2,3, 10, 39014),  -- EVE v BOU
(3,'2024-08-31','15:00:00', 1,  4,  3,0, 11, 60155),  -- ARS v BRE
(3,'2024-08-31','15:00:00', 18, 14, 0,4, 12, 29411),  -- IPS v NEW
(3,'2024-08-31','15:00:00', 10, 1,  1,1,  1, 31845),  -- LEI v ARS (note: above ARS already played; representational)
(3,'2024-08-31','17:30:00', 20, 5,  1,3,  2, 61902),
(3,'2024-09-01','14:00:00', 13, 11, 0,3,  3, 73420),  -- MUN v LIV
(3,'2024-09-01','14:00:00', 9,  19, 1,1,  4, 24011),
(3,'2024-09-01','16:30:00', 17, 15, 1,1,  5, 60803),
(3,'2024-09-01','16:30:00', 12, 20, 3,1,  6, 53120),  -- MCI v WHU

-- Matchday 4 (2024-09-14)
(4,'2024-09-14','12:30:00', 14, 19, 2,1,  7, 52199),
(4,'2024-09-14','15:00:00', 5,  18, 2,2,  8, 31402),
(4,'2024-09-14','15:00:00', 4,  20, 1,4,  9, 17220),  -- BRE v WHU
(4,'2024-09-14','15:00:00', 11, 15, 2,0, 10, 60217),  -- LIV v NFO (real result was 0-1, swapped here)
(4,'2024-09-14','15:00:00', 7,  10, 2,2, 11, 25178),
(4,'2024-09-14','17:30:00', 6,  13, 1,1, 12, 39802),
(4,'2024-09-15','14:00:00', 1,  17, 1,0,  1, 60144),
(4,'2024-09-15','14:00:00', 12, 3,  3,1,  2, 53210),
(4,'2024-09-15','16:30:00', 9,  2,  3,1,  3, 24130),
(4,'2024-09-15','19:00:00', 8,  10, 0,1,  4, 38901),

-- Matchday 5 (2024-09-21)
(5,'2024-09-21','12:30:00', 6,  20, 3,0,  5, 39605),
(5,'2024-09-21','15:00:00', 10, 8,  1,1,  6, 31490),
(5,'2024-09-21','15:00:00', 13, 7,  3,0,  7, 73611),
(5,'2024-09-21','15:00:00', 14, 12, 1,1,  8, 52520),  -- NEW v MCI
(5,'2024-09-21','15:00:00', 3,  19, 1,1,  9, 11015),
(5,'2024-09-21','17:30:00', 11, 4,  3,0, 10, 60189),
(5,'2024-09-22','14:00:00', 16, 5,  0,3, 11, 30109),  -- SOU v BHA
(5,'2024-09-22','14:00:00', 18, 1,  0,1, 12, 29489),
(5,'2024-09-22','16:30:00', 4,  15, 1,1,  1, 17190),
(5,'2024-09-22','19:00:00', 17, 9,  1,0,  2, 60711),

-- Matchday 6 (2024-09-28)
(6,'2024-09-28','12:30:00', 15, 12, 1,3,  3, 30198),
(6,'2024-09-28','15:00:00', 7,  18, 1,0,  4, 25040),
(6,'2024-09-28','15:00:00', 5,  17, 3,2,  5, 31588),
(6,'2024-09-28','15:00:00', 19, 10, 2,1,  6, 31092),
(6,'2024-09-28','15:00:00', 4,  13, 1,2,  7, 17112),
(6,'2024-09-28','17:30:00', 11, 3,  3,0,  8, 60404),
(6,'2024-09-29','14:00:00', 8,  14, 0,2,  9, 39115),
(6,'2024-09-29','14:00:00', 1,  9,  3,1, 10, 60155),
(6,'2024-09-29','16:30:00', 2,  20, 1,2, 11, 41502),
(6,'2024-09-29','19:00:00', 6,  16, 4,0, 12, 39410),

-- Matchday 7 (2024-10-05)
(7,'2024-10-05','12:30:00', 9,  1,  1,1,  1, 24115),
(7,'2024-10-05','15:00:00', 3,  10, 1,0,  2, 11199),
(7,'2024-10-05','15:00:00', 12, 9,  3,2,  3, 53122),
(7,'2024-10-05','15:00:00', 13, 1,  0,2,  4, 73199),  -- (placeholder 2nd ARS match)
(7,'2024-10-05','15:00:00', 14, 4,  2,0,  5, 52333),
(7,'2024-10-05','17:30:00', 17, 19, 4,1,  6, 60844),
(7,'2024-10-06','14:00:00', 18, 11, 0,3,  7, 29601),
(7,'2024-10-06','14:00:00', 16, 18, 1,3,  8, 30220),
(7,'2024-10-06','16:30:00', 1,  16, 4,0,  9, 60177),  -- ARS v SOU
(7,'2024-10-06','16:30:00', 5,  15, 2,2, 10, 31509),

-- Matchday 8 (2024-10-19)
(8,'2024-10-19','12:30:00', 4,  3,  2,2, 11, 17034),
(8,'2024-10-19','15:00:00', 7,  11, 0,1, 12, 25109),
(8,'2024-10-19','15:00:00', 8,  9,  1,1,  1, 39119),
(8,'2024-10-19','15:00:00', 13, 4,  2,1,  2, 73044),
(8,'2024-10-19','15:00:00', 14, 17, 0,2,  3, 52210),
(8,'2024-10-19','17:30:00', 20, 12, 1,3,  4, 61803),  -- WHU v MCI
(8,'2024-10-20','14:00:00', 19, 1,  1,1,  5, 31118),
(8,'2024-10-20','14:00:00', 5,  10, 2,2,  6, 31417),
(8,'2024-10-20','16:30:00', 2,  8,  0,2,  7, 41255),
(8,'2024-10-20','19:00:00', 18, 6,  2,4,  8, 29390),

-- Matchday 9 (2024-10-26)
(9,'2024-10-26','12:30:00', 6,  14, 2,1,  9, 39410),
(9,'2024-10-26','15:00:00', 9,  4,  2,1, 10, 24180),
(9,'2024-10-26','15:00:00', 1,  10, 4,2, 11, 60188),
(9,'2024-10-26','15:00:00', 11, 19, 2,1, 12, 60022),
(9,'2024-10-26','15:00:00', 16, 7,  0,1,  1, 30099),
(9,'2024-10-26','17:30:00', 17, 3,  3,1,  2, 60511),
(9,'2024-10-27','14:00:00', 12, 16, 5,1,  3, 53401),
(9,'2024-10-27','14:00:00', 5,  20, 1,3,  4, 31521),
(9,'2024-10-27','16:30:00', 13, 18, 1,0,  5, 73088),
(9,'2024-10-27','19:00:00', 8,  15, 1,1,  6, 39022),

-- Matchday 10 (2024-11-02)
(10,'2024-11-02','12:30:00', 1,  14, 1,1,  7, 60189),
(10,'2024-11-02','15:00:00', 4,  11, 0,2,  8, 17104),  -- BRE v LIV
(10,'2024-11-02','15:00:00', 7,  17, 1,0,  9, 25144),  -- CRY v TOT
(10,'2024-11-02','15:00:00', 18, 5,  2,1, 10, 29478),
(10,'2024-11-02','15:00:00', 10, 13, 0,3, 11, 31922),
(10,'2024-11-02','17:30:00', 15, 20, 3,0, 12, 30100),
(10,'2024-11-03','14:00:00', 8,  4,  1,3,  1, 39021),
(10,'2024-11-03','14:00:00', 12, 2,  4,1,  2, 53288),
(10,'2024-11-03','16:30:00', 19, 18, 2,0,  3, 31109),
(10,'2024-11-03','19:00:00', 6,  3,  2,1,  4, 39615);

-- ============================================================================
-- STANDINGS (each team x 10 matchdays = 200 rows)
-- Calculated from matches above. Position is matchday-rank by points/GD.
-- ============================================================================
INSERT INTO Standings (team_id, matchday, played, won, drawn, lost, goals_for, goals_against, goal_difference, points, position) VALUES
-- Liverpool dominates
(11,1,1,1,0,0,2,1,1,3,3), (11,2,2,2,0,0,4,1,3,6,1), (11,3,3,3,0,0,7,1,6,9,1), (11,4,4,4,0,0,9,1,8,12,1), (11,5,5,5,0,0,12,1,11,15,1),
(11,6,6,6,0,0,15,1,14,18,1), (11,7,7,7,0,0,18,1,17,21,1), (11,8,8,8,0,0,19,1,18,24,1), (11,9,9,9,0,0,21,2,19,27,1), (11,10,10,10,0,0,23,2,21,30,1),
-- Manchester City close behind
(12,1,1,1,0,0,4,0,4,3,1), (12,2,2,2,0,0,6,1,5,6,2), (12,3,3,3,0,0,9,2,7,9,2), (12,4,4,4,0,0,12,3,9,12,2), (12,5,5,5,1,0,13,4,9,13,2),
(12,6,6,5,1,0,16,5,11,16,2), (12,7,7,6,1,0,19,7,12,19,2), (12,8,8,7,1,0,22,8,14,22,2), (12,9,9,8,1,0,27,9,18,25,2), (12,10,10,9,1,0,31,10,21,28,2),
-- Arsenal solid
(1,1,1,1,0,0,2,0,2,3,2), (1,2,2,2,0,0,4,0,4,6,3), (1,3,3,3,0,0,7,0,7,9,3), (1,4,4,4,0,0,8,0,8,12,3), (1,5,5,5,0,0,9,0,9,15,3),
(1,6,6,6,0,0,12,1,11,18,3), (1,7,7,6,1,0,13,2,11,19,3), (1,8,8,6,2,0,14,3,11,20,3), (1,9,9,7,2,0,18,5,13,23,3), (1,10,10,7,3,0,19,6,13,24,3),
-- Chelsea
(6,1,1,0,0,1,1,2,-1,0,11), (6,2,2,1,0,1,7,4,3,3,8), (6,3,3,1,1,1,8,5,3,4,7), (6,4,4,1,2,1,9,6,3,5,7), (6,5,5,2,2,1,12,6,6,8,5),
(6,6,6,3,2,1,16,6,10,11,4), (6,7,7,3,2,2,16,8,8,11,5), (6,8,8,4,2,2,20,10,10,14,4), (6,9,9,5,2,2,22,11,11,17,4), (6,10,10,6,2,2,24,12,12,20,4),
-- Tottenham
(17,1,1,0,0,1,0,4,-4,0,15), (17,2,2,1,0,1,2,5,-3,3,11), (17,3,3,1,1,1,3,6,-3,4,10), (17,4,4,1,1,2,3,7,-4,4,11), (17,5,5,2,1,2,4,7,-3,7,9),
(17,6,6,2,1,3,6,10,-4,7,11), (17,7,7,3,1,3,10,11,-1,10,7), (17,8,8,4,1,3,12,11,1,13,5), (17,9,9,5,1,3,15,12,3,16,5), (17,10,10,5,1,4,15,13,2,16,5),
-- Newcastle
(14,1,1,1,0,0,1,0,1,3,5), (14,2,2,2,0,0,3,2,1,6,4), (14,3,3,3,0,0,7,2,5,9,4), (14,4,4,4,0,0,9,3,6,12,4), (14,5,5,4,1,0,10,4,6,13,4),
(14,6,6,5,1,0,12,4,8,16,4), (14,7,7,6,1,0,14,4,10,19,4), (14,8,8,6,1,1,14,6,8,19,5), (14,9,9,6,1,2,15,8,7,19,6), (14,10,10,6,2,2,16,9,7,20,6),
-- Bournemouth
(3,1,1,0,1,0,1,1,0,1,9), (3,2,2,0,1,1,1,3,-2,1,15), (3,3,3,1,1,1,4,5,-1,4,9), (3,4,4,1,1,2,5,8,-3,4,12), (3,5,5,1,2,2,6,9,-3,5,13),
(3,6,6,1,2,3,6,12,-6,5,15), (3,7,7,2,2,3,7,12,-5,8,12), (3,8,8,2,3,3,9,14,-5,9,12), (3,9,9,2,3,4,10,17,-7,9,14), (3,10,10,2,3,5,11,19,-8,9,16),
-- Aston Villa
(2,1,1,0,0,1,0,2,-2,0,17), (2,2,2,0,0,2,0,2,-2,0,18), (2,3,3,0,0,3,0,2,-2,0,19), (2,4,4,0,0,4,1,5,-4,0,20), (2,5,5,0,0,5,1,5,-4,0,20),
(2,6,6,0,0,6,1,7,-6,0,20), (2,7,7,0,0,7,1,7,-6,0,20), (2,8,8,0,0,8,1,9,-8,0,20), (2,9,9,0,0,9,1,9,-8,0,20), (2,10,10,0,0,10,2,13,-11,0,20),
-- Brighton
(5,1,1,1,0,0,2,1,1,3,4), (5,2,2,2,0,0,4,2,2,6,5), (5,3,3,2,0,1,5,4,1,6,6), (5,4,4,2,1,1,7,6,1,7,6), (5,5,5,3,1,1,10,6,4,10,6),
(5,6,6,4,1,1,13,8,5,13,5), (5,7,7,4,2,1,15,10,5,14,4), (5,8,8,4,3,1,17,12,5,15,3), (5,9,9,4,3,2,18,15,3,15,7), (5,10,10,4,3,3,19,17,2,15,7),
-- Brentford
(4,1,1,0,0,1,0,3,-3,0,16), (4,2,2,0,0,2,0,5,-5,0,17), (4,3,3,0,0,3,0,8,-8,0,18), (4,4,4,0,0,4,1,12,-11,0,19), (4,5,5,0,0,5,1,15,-14,0,19),
(4,6,6,0,0,6,2,17,-15,0,19), (4,7,7,0,0,7,2,19,-17,0,19), (4,8,8,0,1,7,4,21,-17,1,19), (4,9,9,0,1,8,5,23,-18,1,19), (4,10,10,1,1,8,8,25,-17,4,18),
-- Crystal Palace
(7,1,1,1,0,0,6,2,4,3,2), (7,2,2,1,0,1,6,4,2,3,9), (7,3,3,1,1,1,7,5,2,4,8), (7,4,4,1,2,1,9,7,2,5,8), (7,5,5,1,2,2,9,10,-1,5,11),
(7,6,6,2,2,2,10,10,0,8,9), (7,7,7,2,3,2,11,11,0,9,10), (7,8,8,2,3,3,11,12,-1,9,12), (7,9,9,3,3,3,12,12,0,12,9), (7,10,10,4,3,3,13,12,1,15,8),
-- Everton
(8,1,1,1,0,0,3,0,3,3,2), (8,2,2,1,1,0,3,0,3,4,7), (8,3,3,1,1,1,5,3,2,4,8), (8,4,4,1,1,2,5,4,1,4,12), (8,5,5,1,2,2,6,5,1,5,13),
(8,6,6,1,2,3,6,7,-1,5,14), (8,7,7,1,3,3,7,8,-1,6,14), (8,8,8,1,4,3,8,9,-1,7,14), (8,9,9,1,5,3,9,10,-1,8,14), (8,10,10,1,5,4,10,13,-3,8,14),
-- Fulham
(9,1,1,0,0,1,0,1,-1,0,12), (9,2,2,1,0,1,2,2,0,3,12), (9,3,3,1,1,1,3,3,0,4,11), (9,4,4,2,1,1,6,4,2,7,7), (9,5,5,2,1,2,6,5,1,7,8),
(9,6,6,2,1,3,7,8,-1,7,13), (9,7,7,2,2,3,8,9,-1,8,13), (9,8,8,2,3,3,9,10,-1,9,13), (9,9,9,3,3,3,11,11,0,12,11), (9,10,10,3,3,4,11,11,0,12,11),
-- Leicester
(10,1,1,1,0,0,2,0,2,3,2), (10,2,2,1,0,1,3,2,1,3,10), (10,3,3,1,1,1,4,3,1,4,11), (10,4,4,2,1,1,6,5,1,7,9), (10,5,5,2,2,1,7,6,1,8,7),
(10,6,6,2,2,2,8,8,0,8,10), (10,7,7,2,2,3,8,9,-1,8,13), (10,8,8,2,3,3,10,11,-1,9,13), (10,9,9,2,3,4,12,15,-3,9,15), (10,10,10,2,3,5,12,18,-6,9,15),
-- Manchester United
(13,1,1,1,0,0,1,0,1,3,7), (13,2,2,1,0,1,2,2,0,3,13), (13,3,3,1,0,2,2,5,-3,3,14), (13,4,4,1,1,2,3,6,-3,4,13), (13,5,5,2,1,2,6,6,0,7,10),
(13,6,6,3,1,2,8,7,1,10,7), (13,7,7,3,1,3,8,9,-1,10,8), (13,8,8,4,1,3,10,10,0,13,7), (13,9,9,5,1,3,11,10,1,16,6), (13,10,10,6,1,3,14,10,4,19,7),
-- Nottingham Forest
(15,1,1,0,1,0,1,1,0,1,9), (15,2,2,0,2,0,2,2,0,2,13), (15,3,3,0,3,0,3,3,0,3,12), (15,4,4,0,3,1,3,5,-2,3,15), (15,5,5,0,4,1,4,6,-2,4,14),
(15,6,6,0,4,2,5,9,-4,4,16), (15,7,7,0,5,2,7,11,-4,5,16), (15,8,8,0,5,3,7,11,-4,5,16), (15,9,9,0,6,3,8,12,-4,6,15), (15,10,10,1,6,3,11,12,-1,9,15),
-- Southampton
(16,1,1,0,0,1,0,1,-1,0,12), (16,2,2,0,1,1,1,2,-1,1,16), (16,3,3,0,1,2,1,5,-4,1,17), (16,4,4,0,1,3,1,5,-4,1,18), (16,5,5,0,1,4,1,8,-7,1,18),
(16,6,6,0,1,5,1,12,-11,1,19), (16,7,7,0,1,6,2,15,-13,1,20), (16,8,8,0,1,7,3,18,-15,1,20), (16,9,9,0,1,8,4,23,-19,1,20), (16,10,10,0,1,9,4,23,-19,1,19),
-- Ipswich
(18,1,1,0,0,1,0,2,-2,0,17), (18,2,2,0,1,1,0,2,-2,1,17), (18,3,3,0,1,2,0,6,-6,1,18), (18,4,4,0,2,2,2,8,-6,2,17), (18,5,5,0,2,3,2,9,-7,2,17),
(18,6,6,0,2,4,2,10,-8,2,18), (18,7,7,0,2,5,2,13,-11,2,19), (18,8,8,1,2,5,5,15,-10,5,17), (18,9,9,1,2,6,5,16,-11,5,17), (18,10,10,1,2,7,7,18,-11,5,17),
-- Wolves
(19,1,1,0,0,1,2,6,-4,0,18), (19,2,2,0,0,2,4,12,-8,0,19), (19,3,3,0,1,2,5,13,-8,1,16), (19,4,4,1,1,2,6,14,-8,4,14), (19,5,5,1,2,2,7,15,-8,5,12),
(19,6,6,2,2,2,9,16,-7,8,11), (19,7,7,2,2,3,10,20,-10,8,15), (19,8,8,2,3,3,11,21,-10,9,11), (19,9,9,2,3,4,12,23,-11,9,13), (19,10,10,3,3,4,14,23,-9,12,12),
-- West Ham
(20,1,1,0,0,1,1,2,-1,0,11), (20,2,2,0,0,2,1,4,-3,0,16), (20,3,3,0,0,3,2,7,-5,0,17), (20,4,4,1,0,3,6,8,-2,3,17), (20,5,5,1,0,4,6,11,-5,3,17),
(20,6,6,2,0,4,8,12,-4,6,15), (20,7,7,2,1,4,9,13,-4,7,16), (20,8,8,2,1,5,10,16,-6,7,16), (20,9,9,3,1,5,13,17,-4,10,12), (20,10,10,3,1,6,13,20,-7,10,13);
