USE premier_league;

DROP VIEW IF EXISTS Top_Scorers;

CREATE VIEW Top_Scorers AS
SELECT
    p.player_id,
    p.first_name,
    p.last_name,
    p.position,
    p.shirt_number,
    p.team_id,
    t.name AS team_name,
    CAST(ps.stat_value AS UNSIGNED) AS goals
FROM Players p
JOIN Player_Stats ps ON ps.player_id = p.player_id AND ps.stat_name = 'Goals'
LEFT JOIN Teams t ON t.team_id = p.team_id
ORDER BY ps.stat_value DESC, p.last_name ASC;
