USE premier_league;

DROP VIEW IF EXISTS Manager_Performance;

CREATE VIEW Manager_Performance AS
SELECT
    manager_id,
    first_name,
    last_name,
    nationality,
    team,
    matches,
    wins,
    draws,
    losses,
    fn_points_from_record(wins, draws)        AS points,
    ROUND(wins / matches * 100, 1)            AS win_rate_pct
FROM (
    SELECT
        mg.manager_id,
        mg.first_name,
        mg.last_name,
        mg.nationality,
        t.name AS team,
        COUNT(m.match_id) AS matches,
        SUM(CASE
            WHEN (m.home_team_id = t.team_id AND m.home_score > m.away_score)
              OR (m.away_team_id = t.team_id AND m.away_score > m.home_score) THEN 1 ELSE 0
        END) AS wins,
        SUM(CASE WHEN m.home_score = m.away_score THEN 1 ELSE 0 END) AS draws,
        SUM(CASE
            WHEN (m.home_team_id = t.team_id AND m.home_score < m.away_score)
              OR (m.away_team_id = t.team_id AND m.away_score < m.home_score) THEN 1 ELSE 0
        END) AS losses
    FROM Managers mg
    JOIN Teams t ON t.manager_id = mg.manager_id
    JOIN Matches m ON t.team_id IN (m.home_team_id, m.away_team_id)
    GROUP BY mg.manager_id, mg.first_name, mg.last_name, mg.nationality, t.name
) sub
ORDER BY points DESC, win_rate_pct DESC;
