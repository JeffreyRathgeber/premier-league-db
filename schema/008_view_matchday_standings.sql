USE premier_league;

DROP VIEW IF EXISTS Matchday_Standings;

CREATE VIEW Matchday_Standings AS
SELECT
    s.matchday,
    s.position,
    s.team_id,
    t.name AS team_name,
    t.abbreviation,
    s.played,
    s.won,
    s.drawn,
    s.lost,
    s.goals_for,
    s.goals_against,
    s.goal_difference,
    s.points
FROM Standings s
JOIN Teams t ON t.team_id = s.team_id
ORDER BY s.matchday ASC, s.position ASC;
