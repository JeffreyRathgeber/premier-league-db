USE premier_league;

DROP PROCEDURE IF EXISTS transfer_player;

DELIMITER $$

CREATE PROCEDURE transfer_player(IN p_player_id INT, IN p_new_team_id INT)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Players WHERE player_id = p_player_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Player not found';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Teams WHERE team_id = p_new_team_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Team not found';
    END IF;

    UPDATE Players SET team_id = p_new_team_id WHERE player_id = p_player_id;
END$$

DELIMITER ;
