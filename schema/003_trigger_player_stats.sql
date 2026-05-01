DELIMITER $$

CREATE TRIGGER after_player_insert
AFTER INSERT ON Players
FOR EACH ROW
BEGIN
    INSERT INTO Player_Stats (player_id, stat_name, stat_value) VALUES
        (NEW.player_id, 'Appearances',    0),
        (NEW.player_id, 'Starts',         0),
        (NEW.player_id, 'Minutes Played', 0),
        (NEW.player_id, 'Goals',          0),
        (NEW.player_id, 'Assists',        0),
        (NEW.player_id, 'Yellow Cards',   0),
        (NEW.player_id, 'Red Cards',      0),
        (NEW.player_id, 'Clean Sheets',   0);
END$$

DELIMITER ;
