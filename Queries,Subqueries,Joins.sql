-- The nickname and age of all the players
SELECT 
    nickname, age
FROM
    players
WHERE
    date_of_birth > '2000/01/01'
ORDER BY age;

-- The first name ,last name and birth countries of all the players
SELECT 
    first_name, last_name, country
FROM
    players
GROUP BY country;

-- The number of players and number of team
SELECT 
    COUNT(player_id), COUNT(DISTINCT team_id)
FROM
    players;

-- The average age,maximum age and minimum of the players
SELECT 
    AVG(age), MAX(age), MIN(age)
FROM
    players;

-- All the players that are from Brazil and Russia
SELECT 
    nickname, country
FROM
    players
WHERE
    country LIKE ('Russia')
        OR country LIKE ('Brazil');

-- All the matches where map 3  was played
SELECT 
    team_1, team_2, score
FROM
    matches
WHERE
    map_3 IS NOT NULL
ORDER BY score;

SELECT 
    COUNT(match_id)
FROM
    matches;

-- The teams that finished in top 4
SELECT 
    team_name, team_region, final_place
FROM
    teams
WHERE
    final_place <= 4
ORDER BY final_place;

-- The number of all the matches disputed including the final
SELECT 
    ((SELECT 
            COUNT(match_id)
        FROM
            matches) + (SELECT 
            COUNT(final_match_id)
        FROM
            final)) AS allMatches;

-- The player that has player_id 1084
SELECT 
    nickname, player_id
FROM
    players
WHERE
    player_id IN (SELECT 
            player_id
        FROM
            players
        WHERE
            player_id = 1084);
                   
 -- The teams that won 0 games                   
SELECT 
    team_name, won, lost
FROM
    teams
WHERE
    won IN (SELECT 
            won
        FROM
            teams
        WHERE
            won = 0);
               
               
-- A view containing all players that have won Match MVP
CREATE VIEW mvp_winners AS
    SELECT 
        p.player_id, m.mvp, p.nickname
    FROM
        players p
            JOIN
        matches m ON p.player_id = m.mvp;
  
  
  
-- A view containing the name of the coaches and their teams
CREATE VIEW team_coaches AS
    SELECT 
        c.coach_id, c.coach_nickname, t.team_name
    FROM
        teams t
            JOIN
        coaches c ON c.coach_id = t.coach_id;
   

-- A view containing the Finals MVP
CREATE VIEW finals_mvp AS
    SELECT 
        p.player_id, f.final_mvp, p.nickname
    FROM
        players p
            JOIN
        final f ON p.player_id = f.final_mvp;


-- A view containing all players and teams from the EMEA region 
CREATE VIEW emea AS
    SELECT 
        p.player_id, t.team_id, p.nickname, t.team_name
    FROM
        players p
            JOIN
        teams t ON p.team_id = t.team_id
    WHERE
        team_region = 'EMEA';


