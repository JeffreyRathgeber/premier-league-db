USE premier_league;

DROP VIEW IF EXISTS Team_Goal_Summary;

CREATE VIEW Team_Goal_Summary AS
SELECT
    t.team_id,
    t.name AS team,
    t.abbreviation,
    SUM(CASE WHEN m.home_team_id = t.team_id THEN m.home_score
             ELSE m.away_score END)              AS goals_scored,
    SUM(CASE WHEN m.home_team_id = t.team_id THEN m.away_score
             ELSE m.home_score END)              AS goals_conceded,
    SUM(CASE WHEN m.home_team_id = t.team_id THEN m.home_score
             ELSE m.away_score END) -
    SUM(CASE WHEN m.home_team_id = t.team_id THEN m.away_score
             ELSE m.home_score END)              AS goal_difference,
    COUNT(m.match_id)                            AS matches_played
FROM Teams t
JOIN Matches m ON t.team_id IN (m.home_team_id, m.away_team_id)
GROUP BY t.team_id, t.name, t.abbreviation
ORDER BY goals_scored DESC, goal_difference DESC;
