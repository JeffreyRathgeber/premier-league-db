USE premier_league;

DROP FUNCTION IF EXISTS fn_points_from_record;

CREATE FUNCTION fn_points_from_record(wins INT, draws INT)
RETURNS INT
DETERMINISTIC
RETURN (wins * 3) + draws;
