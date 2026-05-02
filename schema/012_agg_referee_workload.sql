USE premier_league;

DROP VIEW IF EXISTS Referee_Workload;

CREATE VIEW Referee_Workload AS
SELECT
    r.referee_id,
    r.first_name,
    r.last_name,
    r.nationality,
    COUNT(m.match_id)                             AS matches_officiated,
    ROUND(AVG(m.attendance), 0)                   AS avg_attendance,
    SUM(m.home_score + m.away_score)              AS total_goals_overseen
FROM Referees r
JOIN Matches m ON m.referee_id = r.referee_id
GROUP BY r.referee_id, r.first_name, r.last_name, r.nationality
ORDER BY matches_officiated DESC, avg_attendance DESC;
