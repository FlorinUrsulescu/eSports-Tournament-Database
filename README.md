# Valorant-Champions-Database

A database that contains information about all the players,teams,coaches and matches from an eSports tournament called Valorant Champions Tour 2021.

Table information

coaches - a table containing information about the coaches
   
    coach_id - a unique id for each coach
    coach_first_name -  first name of the coach
    coach_last_name -last name of the coach
    coach_nickname - nickname of the coach,each coach has a unique nickname

teams - a table containing information about the teams

    team_id - a unique id for each team
    team_name - the name of the team
    team_region - the region of which the team is part of(EMEA=Europe,NA=North America,LATAM=Latin America,BR=Brazil,SEA=South East Asia,KR=South Korea,JP=Japan,APAC=Asia and Pacific)
    coach_id - the coaches of the teams which is referencing the coach_id column from the coaches table
    group_name - the group in which the team has been seeded(A,B,C or D)
    won - total matches won by a team during the tournament
    lost -total matches lost by a team during the tournament
    final_place -  the place in which the team finished the tournament
    prize_money - the money sum won by the team for their perfomance in the tournament

players - a table containing information about the players

    player_id - a unique number for each player
    first_name -first name of the player
    last_name - last name of the player
    nickname -each players has a unique nickname
    date_of_birth - player's date of birth
    age - player's age
    country - what country is the player representing
    team_id - what team is the player part of referencing to the team_id column from teams table
   
matches - a table containing information about all the matches except the final

    match_id - a unique identification number for each match
    tournament_day - during which day of the tournament the match took place
    tournament_stage - at what stage of the tournament has the match took place
    team_1 - the first team that took part in the match, this column is referencing teams_id from teams table  
    tean_2 - the second team that took part in the match, this column is referencing teams_id from teams table 
    map_1 - name of the first map played in the match
    map_1_score - score of the first map
    map_2 - name of the second map played in the match
    map_2_score - score of the second map
    map_3 - name of the third map played in the match
    map_3_score - score of the third map
    score - the final score of the match,representing the number of maps won by each team
    MVP - the player that won Match MVP,this column is referencing player_id from the players table

Final - a table containing information about the final match

    final_match_id - a unique identification number for the final match
    final_day - what day of the tournament was the final day
    city - the city in which the final took place
    venue - the venue in which the final took place
    final_team_1 - the first finalist team which is referencing team_id from teams table
    final_team_2 - the second finalist team which is referencing team_id from teams table
    final_map_1 - the name of the first map played in the final
    final_map_1_score -the score of the first map played in final
    final_map_2 - the name of the second map played in the final
    final_map_2_score -the score of the second map played in final
    final_map_3 - the name of the third map played in the final
    final_map_3 -score_ the score of the third map played in final
    final_map_4 - the name of the fourth map played in the final
    final_map_4 -score_ the score of the fourth map played in final
    final_map_5 - the name of the fifth map played in the final
    final_map_5_score- the score of the fifth map played in final
    final_score - the score of the final representing the number of maps won by each team
    final_mvp - the player that has won Final MVP
