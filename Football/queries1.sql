USE Football_tournament
GO
--Query 1
SELECT P.jersey_number, P.player_name, T.team_nation
FROM players as P
INNER JOIN teams as T
ON P.team_id = T.team_id
GROUP BY P.jersey_number, P.player_name, T.team_nation
HAVING T.team_nation = 'Argentina';

--Query 2
SELECT
(
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON T.team_nation = J.team_nation AND ((T.team_id = M.team_id_host AND M.goals_host > M.goals_guest) 
	OR (T.team_id = M.team_id_guest AND M.goals_guest > M.goals_host))
) AS [wins],
(
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON T.team_nation = J.team_nation 
	AND ((T.team_id = M.team_id_host AND M.goals_host < M.goals_guest) 
	OR (T.team_id = M.team_id_guest AND M.goals_guest < M.goals_host))
) AS [losses],
(
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON T.team_nation = J.team_nation AND (M.goals_host = M.goals_guest 
	AND (T.team_id = M.team_id_host OR T.team_id = M.team_id_guest))
) AS [ties],
T.team_nation
FROM teams as T;

--Query 3
SELECT ranks.team, ranks.match_rank, ranks.match_date
FROM
(
	SELECT T.team_nation as team, CONVERT(VARCHAR(10), M.play_date, 103) as match_date,
		   ROW_NUMBER() over (PARTITION BY T.team_id ORDER BY M.play_date DESC) as match_rank
	FROM teams as T
		RIGHT OUTER JOIN matches as M
		ON T.team_id = M.team_id_guest OR T.team_id = M.team_id_host
) ranks
WHERE match_rank <= 5;

--Query 4
SELECT a.nation, a.wins, a.played_matches
FROM
	(SELECT
		(
			SELECT COUNT(M.match_id)
			FROM matches as M
			JOIN teams as J
			ON T.team_nation = J.team_nation 
			AND ((T.team_id = M.team_id_host AND M.goals_host > M.goals_guest) 
			OR (T.team_id = M.team_id_guest AND M.goals_guest > M.goals_host))
		) as [wins],
		(
			SELECT COUNT(M.match_id)
			FROM matches as M
			JOIN teams as J
			ON T.team_nation = J.team_nation AND (T.team_id = M.team_id_host OR T.team_id = M.team_id_guest)
		) as [played_matches], T.team_nation as [nation]
	FROM teams as T
	) a
WHERE a.played_matches > 1 AND a.wins > a.played_matches*0.5;

--Query 5/Procedure
USE Football_tournament
GO

CREATE PROCEDURE calculate_points
(@pdate as DATE, @pteam as VARCHAR(50))
AS
SELECT
(
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON M.play_date <= @pdate AND T.team_nation = J.team_nation 
	AND ((T.team_id = M.team_id_host AND M.goals_host > M.goals_guest) 
	OR (T.team_id = M.team_id_guest AND M.goals_guest > M.goals_host))
)*3 + (
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON M.play_date <= @pdate AND T.team_nation = J.team_nation 
	AND (M.goals_host = M.goals_guest AND (T.team_id = M.team_id_host 
	OR T.team_id = M.team_id_guest))
) AS [points], T.team_nation
FROM teams as T
WHERE T.team_nation = @pteam;

EXEC calculate_points @pdate = '2022-12-07', @pteam = 'Argentina';
GO