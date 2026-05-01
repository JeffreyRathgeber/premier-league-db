DELIMITER $$

CREATE TRIGGER after_team_insert
AFTER INSERT ON Teams
FOR EACH ROW
BEGIN
    INSERT INTO Team_Stats (team_id, stat_name, stat_value) VALUES
        (NEW.team_id, 'Total Shots',      0),
        (NEW.team_id, 'Shots on Target',  0),
        (NEW.team_id, 'Possession Avg %', 0),
        (NEW.team_id, 'Fouls Committed',  0),
        (NEW.team_id, 'Offsides',         0),
        (NEW.team_id, 'Corners Won',      0);
END$$

DELIMITER ;
