DELIMITER $$

CREATE TRIGGER before_player_delete
BEFORE DELETE ON Players
FOR EACH ROW
BEGIN
    DELETE FROM Player_Stats WHERE player_id = OLD.player_id;
END$$

DELIMITER ;
