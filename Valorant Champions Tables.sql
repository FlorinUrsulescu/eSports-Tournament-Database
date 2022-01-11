

CREATE TABLE Coaches (
    coach_id INT PRIMARY KEY,
    coach_first_name VARCHAR(255),
    coach_last_name VARCHAR(255),
    coach_nickname VARCHAR(255) UNIQUE
);
alter table coaches
modify coach_id int auto_increment;


CREATE TABLE Teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255) UNIQUE,
    team_region VARCHAR(255),
    coach_id INT,
    group_name VARCHAR(1),
    won INT,
    lost INT,
    final_place INT,
    prize_money INT,
    FOREIGN KEY (coach_id)
        REFERENCES Coaches (coach_id)
);

 alter table teams
 modify prize_money numeric(10,3);




CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_day VARCHAR(255),
    tournament_stage VARCHAR(255),
    team_1 INT,
    team_2 INT,
    map_1 VARCHAR(255) NOT NULL,
    map_1_score VARCHAR(10),
    map_2 VARCHAR(255) NOT NULL,
    map_2_score VARCHAR(10),
    map_3 VARCHAR(255),
    map_3_score VARCHAR(255),
    score VARCHAR(10),
    MVP INT,
    FOREIGN KEY (team_1)
        REFERENCES Teams (team_id),
    FOREIGN KEY (team_2)
        REFERENCES Teams (team_id),
    FOREIGN KEY (MVP)
        REFERENCES players (player_id)
);

alter table Matches
modify tournament_day int unique;
 
CREATE TABLE final (
    final_match_id INT PRIMARY KEY,
    final_day VARCHAR(255),
    city VARCHAR(255),
    venue VARCHAR(255),
    final_team_1 INT,
    final_team_2 INT,
    final_map_1 VARCHAR(255),
    final_map_1_score VARCHAR(255),
    final_map_2 VARCHAR(255),
    final_map_2_score VARCHAR(255),
    final_map_3 VARCHAR(255),
    final_map_3_score VARCHAR(255),
    final_map_4 VARCHAR(255),
    final_map_4_score VARCHAR(255),
    final_map_5 VARCHAR(255),
    final_map_5_score VARCHAR(255),
    final_score VARCHAR(255),
    final_mvp INT,
    FOREIGN KEY (final_team_1)
        REFERENCES Teams (team_id),
    FOREIGN KEY (final_team_2)
        REFERENCES Teams (team_id),
    FOREIGN KEY (final_mvp)
        REFERENCES players (player_id)
);



CREATE TABLE players (
    player_id INT AUTO_INCREMENT KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    nickname VARCHAR(255) UNIQUE,
    date_of_birth DATE,
    age INTEGER,
    country VARCHAR(255),
    team_id INT,
    FOREIGN KEY (team_id)
        REFERENCES Teams (team_id)
);


insert into coaches(coach_id)
values (300);

insert into coaches(coach_first_name,coach_last_name,coach_nickname)
values('Andrei','Sholokov','Engh'),
('Shane','Flaherty','Rawkus'),
('Chet','Singh','Chet'),
('Rodrigo','Dalmagero','Onur'),
('Matheus','Tarasconi','bzKa'),
('Pedro','Koy','Pulig'),
('Laurynas','Kisielius','Nbs'),
('Jacob','Harris','mini'),
('Seon-ho','Pyeon','termi'),
('Young-bin','Lim','Twinkl'),
('Yuranun','Sangurang','0bi'),
('Gilbert','Sales Jr','Gibo'),
('Yoon','Eu-teum','Autumn'),
('Connor','Blomfield','Sliggy'),
('Carlos','Mohn','Carlao'),
('Songchai','Payang','Tongrak');






insert into teams (team_id,team_name , team_region ,coach_id  ,group_name , won ,lost ,final_place ,prize_money)
values(200,'Gambit','EMEA',(select coach_id from coaches where coach_nickname='Engh'),'C',4,1,2,150.000);
insert into teams (team_name , team_region ,coach_id  ,group_name , won ,lost ,final_place ,prize_money)
values ('Sentinels','NA',(select coach_id from coaches where coach_nickname='Rawkus'),'B',1,2,12,20.000);

insert into teams (team_name , team_region ,coach_id  ,group_name , won ,lost ,final_place ,prize_money)
values('Team Envy','NA',(select coach_id from coaches where coach_nickname='Chet'),'A',1,2,11,20.000),
('KRU Esports','LATAM',(select coach_id from coaches where coach_nickname='Onur'),'B',3,2,4,90.000),
('Team Vikings','BR',(select coach_id from coaches where coach_nickname='bzKa'),'C',1,2,10,20.000),
('Keyd Stars','BR',(select coach_id from coaches where coach_nickname='Koy'),'A',0,2,13,20.000),
('Acend','EMEA',(select coach_id from coaches where coach_nickname='Nbs'),'A',5,0,1,350.000),
('Fnatic','EMEA',(select coach_id from coaches where coach_nickname='mini'),'D',2,1,5,40.000),
('Vision Strikers','KR',(select coach_id from coaches where coach_nickname='termi'),'D',1,2,9,20.000),
('Crazy Racoons','JP',(select coach_id from coaches where coach_nickname='Twinkl'),'C',0,2,16,20.000),
('X10 CRIT','SEA',(select coach_id from coaches where coach_nickname='0bi'),'A',2,1,6,40.000),
('Team Secret','SEA',(select coach_id from coaches where coach_nickname='Gibo'),'C',2,1,7,40.000),
('Cloud 9','NA',(select coach_id from coaches where coach_nickname='Autumn'),'C',0,1,8,40.000),
('Team Liquid','EMEA',(select coach_id from coaches where coach_nickname='Sliggy'),'B',3,1,3,90.000),
('Furia Esports','SA',(select coach_id from coaches where coach_nickname='Carlao'),'B',0,2,15,20.000),
('Full Sense','APAC',(select coach_id from coaches where coach_nickname='Tongrak'),'D',0,2,14,20.000);

UPDATE teams 
SET 
    won = 2,
    lost = 1
WHERE
    team_name LIKE ('Cloud 9');

insert into coaches(coach_first_name,coach_last_name,coach_nickname)
values('Pedro','Pulig','Koy');


insert into teams (team_name , team_region ,coach_id  ,group_name , won ,lost ,final_place ,prize_money)
values ('Keyd Stars','BR',(select coach_id from coaches where coach_nickname='Koy'),'A',0,2,13,20.000);


insert into players( player_id , first_name ,last_name ,nickname ,date_of_birth,age  ,country , team_id )
values(1000,'Timofey','Khromov','Chronicle','2002/08/16',19,'Russia',(select team_id from teams where team_name='Gambit'));

insert into players( first_name ,last_name ,nickname ,date_of_birth,age  ,country , team_id )
values('Nikita','Sudakov','d3ffo','2001/10/10',20,'Russia',(select team_id from teams where team_name='Gambit')),
('Bogdan','Naumov','Sheydos','2001/10/01',20,'Russia',(select team_id from teams where team_name='Gambit')),
('Ayaz','Akhmetshin','nAts','2002/07/01',19,'Russia',(select team_id from teams where team_name='Gambit')),
('Igor','Vlasov','Redgar','1997/10/17',24,'Russia',(select team_id from teams where team_name='Gambit')),
('Shahzeb','Khan','ShahZaM','1993/10/08',28,'USA',(select team_id from teams where team_name='Sentinels')),
('Hunter','Mims','SicK','1998/09/02',23,'USA',(select team_id from teams where team_name='Sentinels')),
('Jared','Gitlin','zombs','1998/10/02',23,'USA',(select team_id from teams where team_name='Sentinels')),
('Michael','Gulino','dapr','1999/01/01',22,'USA',(select team_id from teams where team_name='Sentinels')),
('Tyson','Ngo','TenZ','2001/05/05',20,'Canada',(select team_id from teams where team_name='Sentinels')),
('Pujan','Mehta','FNS','1992/03/19',29,'Canada',(select team_id from teams where team_name='Team Envy')),
('Jacob','Whiteaker','yay','1998/09/09',23,'USA',(select team_id from teams where team_name='Team Envy')),
('Victor','Wong','Victor','1996/09/04',25,'USA',(select team_id from teams where team_name='Team Envy')),
('Austin','Roberts','crashies','1997/12/20',24,'USA',(select team_id from teams where team_name='Team Envy')),
('Jimmy','Nguyen','Marved','2000/02/24',21,'Canada',(select team_id from teams where team_name='Team Envy')),
('Nicolas','Ferrari','Klaus','2001/04/01',20,'Argentina',(select team_id from teams where team_name='KRU Esports')),
('Roberto','Francisco','Mazino','2001/06/29',20,'Chile',(select team_id from teams where team_name='KRU Esports')),
('Juan Pablo','Lopez Miranda','NagZ','2001/06/29',20,'Chile',(select team_id from teams where team_name='KRU Esports')),
('Juan Ignacio','Espinoza','delz1k','2000/11/23',21,'Chile',(select team_id from teams where team_name='KRU Esports')),
('Angelo','Mori','keznit','2001/08/14',20,'Chile',(select team_id from teams where team_name='KRU Esports')),
('Gustavo','Moura','gtnziN','1999/03/24',22,'Brazil',(select team_id from teams where team_name='Team Vikings')),
('Gustavo','Rossi','Sacy','1997/12/03',24,'Brazil',(select team_id from teams where team_name='Team Vikings')),
('Leandro','Gomes','frz','2000/07/10',21,'Brazil',(select team_id from teams where team_name='Team Vikings')),
('Gabriel','Dias','sutecas','1997/09/25',24,'Brazil',(select team_id from teams where team_name='Team Vikings')),
('Matias','Delipetro','Saadhak','1997/03/08',24,'Argentina',(select team_id from teams where team_name='Team Vikings')),
('Olavo','Marcelo','heat','2003/02/07',18,'Brazil',(select team_id from teams where team_name='Keyd Stars')),
('Jonathan','Gloria','JhoW','1996/06/22',25,'Brazil',(select team_id from teams where team_name='Keyd Stars')),
('Gabriel','Martins','v1xen','1999/03/22',22,'Brazil',(select team_id from teams where team_name='Keyd Stars')),
('Murillo','Tuchtenhagen','murizzz','1999/09/16',22,'Brazil',(select team_id from teams where team_name='Keyd Stars')),
('Leonardo','Serrati','mwzera','2001/06.30',20,'Brazil,',(select team_id from teams where team_name='Keyd Stars')),
('Santeri','Sassi','BONECOLD','1998/10/13',23,'Finland',(select team_id from teams where team_name='Acend')),
('Mehmet Yagiz','Ipek','cNED','2002/01/18',19,'Turkey',(select team_id from teams where team_name='Acend')),
('Vladyslav','Shvets','Kiles','1997/08/26',24,'Ukraine',(select team_id from teams where team_name='Acend')),
('Patryk','Kopczynski','starxo','2001/08/28',20,'Poland',(select team_id from teams where team_name='Acend')),
('Aleksander','Zygmunt','zeek','2001/09/11',20,'Poland',(select team_id from teams where team_name='Acend')),
('Jake','Howlett','Boaster','1995/05/25',26,'United Kingdom',(select team_id from teams where team_name='Fnatic')),
('Domagoj','Fancev','Doma','2003/06/29',18,'Croatia',(select team_id from teams where team_name='Fnatic')),
('James','Orfila','Mistic','2001/11/12',20,'United Kingdom',(select team_id from teams where team_name='Fnatic')),
('Nikita','Sirmitev','Derke','2003/02/06',18,'Finland',(select team_id from teams where team_name='Fnatic')),
('Martin','Penkov','Magnum','2001/08/09',20,'Czechia',(select team_id from teams where team_name='Fnatic')),
('Kim','Gu-taek','stax','2000/02/16',21,'South Korea',(select team_id from teams where team_name='Vision Strikers')),
('Goo','Sang-min','Rb','2001/12/07',20,'South Korea',(select team_id from teams where team_name='Vision Strikers')),
('Lee','Seung-Won','k1ng','2001/11/03',20,'South Korea',(select team_id from teams where team_name='Vision Strikers')),
('Yu','Byung-chul','BuZz','2003/01/13',18,'South Korea',(select team_id from teams where team_name='Vision Strikers')),
('Kim','Myeong-kwan','MaKo','2002/01/15',19,'South Korea',(select team_id from teams where team_name='Vision Strikers')),
('Park','Jun-ki','Bazzi','1999/03/24',22,'South Korea',(select team_id from teams where team_name='Crazy Racoons')),
('Teppei','Kuno','ade','1997/01/31',24,'Japan',(select team_id from teams where team_name='Crazy Racoons')),
('Hideki','Sasaki','Fisker','1997/01/20',24,'Brazil',(select team_id from teams where team_name='Crazy Racoons')),
('Byeon','Sang-beom','Munchkin','1998/03/27',23,'South Korea',(select team_id from teams where team_name='Crazy Racoons')),
('Yusuke','Matsuda','neth','1996/05/26',25,'Japan',(select team_id from teams where team_name='Crazy Racoons')),
('Thanamethk','Mahatthananuyut','Crws','1997/03/11',24,'Thailand',(select team_id from teams where team_name='X10 CRIT')),
('Itthirit','Ngamsaard','foxz','1999/04/08',22,'Thailand',(select team_id from teams where team_name='X10 CRIT')),
('Nutchaphon','Matarat','sScary','2000/10/04',21,'Thailand',(select team_id from teams where team_name='X10 CRIT')),
('Panyamat','Subsiriroj','sushiboys','2000/11/06',21,'Thailand',(select team_id from teams where team_name='X10 CRIT')),
('Patipiwong','Patiphan','Patiphan','2003/11/03',18,'Thailand',(select team_id from teams where team_name='X10 CRIT')),
('Jessie','Cristy Cuyco','JessieVash','1990/02/21',31,'Philippines',(select team_id from teams where team_name='Team Secret')),
('Jayvee','Paguirigan','DubsteP','1992/11/21',29,'Philippines',(select team_id from teams where team_name='Team Secret')),
('Jim','Timbreza','BORKUM','1996/04/18',25,'Philippines',(select team_id from teams where team_name='Team Secret')),
('Kevin','Te','Dispenser','1994/11/27',27,'Philipppines',(select team_id from teams where team_name='Team Secret')),
('Riley','Go','witz','1996/05/06',26,'Philippines',(select team_id from teams where team_name='Team Secret')),
('Mitch','Semago','mitch','1996/07/31',25,'Usa',(select team_id from teams where team_name='Cloud 9')),
('Nathan','Orf','leaf','2003/11/24',18,'USA',(select team_id from teams where team_name='Cloud 9')),
('Son','Seon-ho','xeta','1997/06/03',24,'South Korea',(select team_id from teams where team_name='Cloud 9')),
('Eric','Bach','Xeppaa','2000/07/19',21,'USA',(select team_id from teams where team_name='Cloud 9')),
('Anthony','Malaspina','vanity','1998/12/04',23,'USA',(select team_id from teams where team_name='Cloud 9')),
('Dom','Sulcas','Soulcas','2000/01/02',21,'United Kingdom',(select team_id from teams where team_name='Team Liquid')),
('Travis','Mendoza','L1nk','1998/08/08',23,'United Kingdom',(select team_id from teams where team_name='Team Liquid')),
('Adil','Benriltom','ScreaM','1994/07/02',27,'Belgium',(select team_id from teams where team_name='Team Liquid')),
('Nabil','Benriltom','Nivera','2000/06/10',21,'Belgium',(select team_id from teams where team_name='Team Liquid')),
('Elias','Olkkonen','Jamppi','2001/07/22',20,'Finland',(select team_id from teams where team_name='Team Liquid')),
('Alexandre','Zizi','xand','1995/04/11',26,'Brazil',(select team_id from teams where team_name='Furia Esports')),
('Gabriel','Lima','qck','2003/07/18',18,'Brazil',(select team_id from teams where team_name='Furia Esports')),
('Khalil','Schmidt','Khalil','2004/06/11',17,'Brazil',(select team_id from teams where team_name='Furia Esports')),
('Agustin','Ibarra','Nozwerr','1998/05/08',23,'Argentina',(select team_id from teams where team_name='Furia Esports')),
('Matheus','Araujo','mazin','1999/06/27',22,'Brazil',(select team_id from teams where team_name='Furia Esports')),
('Chanitpak','Suwanaprateep','ChAlalala','2001/07/22',20,'Thailand',(select team_id from teams where team_name='Full Sense')),
('Chanawin','Nakchain','JohnOlsen','1998/05/20',23,'Thailand',(select team_id from teams where team_name='Full Sense')),
('Elamrahim','Khanpathan','LAMMYSNAX','2002/08/10',19,'Thailand',(select team_id from teams where team_name='Full Sense')),
('Kittitkawin','Rattanasukol','PTC','1998/11/26',23,'Thailand',(select team_id from teams where team_name='Full Sense')),
('Nattawat','Yoosawat','SuperBus','2000/04/28',21,'Thailand',(select team_id from teams where team_name='Full Sense'));



insert into matches(match_id, tournament_day  ,tournament_stage ,team_1 ,team_2 ,map_1 ,map_1_score,map_2 ,map_2_score,map_3 ,map_3_score,score ,MVP)
values(2000,'Day One','Groups',(select team_id from teams where team_name='Vision Strikers'),(select team_id from teams where team_name='Full Sense'),'Haven','13-5','Breeze','13-5',null,null,'2-0',(select player_id from players where nickname='BuZz'));

insert into matches( tournament_day  ,tournament_stage ,team_1 ,team_2 ,map_1 ,map_1_score,map_2 ,map_2_score,map_3 ,map_3_score,score,MVP )
values('Day One','Groups',(select team_id from teams where team_name='Team Vikings'),(select team_id from teams where team_name='Crazy Racoons'),'Icebox','13-9','Haven','13-8',null,null,'2-0',(select player_id from players where nickname='Sacy')),
('Day One','Groups',(select team_id from teams where team_name='Fnatic'),(select team_id from teams where team_name='Cloud 9'),'Icebox','13-11','Split','11-13','Fracture','14-12','2-1',(select player_id from players where nickname='Derke')),
('Day Two','Groups',(select team_id from teams where team_name='Gambit'),(select team_id from teams where team_name='Team Secret'),'Icebox','6-13','Breeze','13-0','Bind','13-6','2-1',(select player_id from players where nickname='nAts')),
('Day Two','Groups',(select team_id from teams where team_name='Sentinels'),(select team_id from teams where team_name='Furia Esports'),'Ascent','13-9','Breeze','10-13','Haven','13-9','2-1',(select player_id from players where nickname='TenZ')),
('Day Two','Groups',(select team_id from teams where team_name='KRU Esports'),(select team_id from teams where team_name='Team Liquid'),'Haven','5-13','Ascent','8-13',null,null,'0-2',(select player_id from players where nickname='L1nk')),
('Day Three','Groups',(select team_id from teams where team_name='Acend'),(select team_id from teams where team_name='Keyd Stars'),'Icebox','9-13','Bind','13-3','Breeze','13-10','2-1',(select player_id from players where nickname='zeek')),
('Day Three','Groups',(select team_id from teams where team_name='Vision Strikers'),(select team_id from teams where team_name='Fnatic'),'Icebox','10-13','Haven','13-10','Fracture','6-13','1-2',(select player_id from players where nickname='Derke')),
('Day Three','Groups',(select team_id from teams where team_name='Team Envy'),(select team_id from teams where team_name='X10 CRIT'),'Breeze','13-8','Ascent','13-7',null,null,'2-0',(select player_id from players where nickname='yay')),
('Day Four','Groups',(select team_id from teams where team_name='Gambit'),(select team_id from teams where team_name='Team Vikings'),'Split','13-6','Bind','5-13','Icebpx','14-12','2-1',(select player_id from players where nickname='Sacy')),
('Day Four','Groups',(select team_id from teams where team_name='Sentinels'),(select team_id from teams where team_name='Team Liquid'),'Breeze','12-14','Bind','13-2','Split','10-13','1-2',(select player_id from players where nickname='ShahZam')),
('Day Five','Groups',(select team_id from teams where team_name='Team Secret'),(select team_id from teams where team_name='Crazy Racoons'),'Split','13-5','Haven','13-2',null,null,'2-0',(select player_id from players where nickname='Dispenser')),
('Day Five','Groups',(select team_id from teams where team_name='Furia Esports'),(select team_id from teams where team_name='KRU Esports'),'Fracture','13-11','Ascent','8-13','Haven','9-13','1-2',(select player_id from players where nickname='Keznit')),
('Day Five','Groups',(select team_id from teams where team_name='Full Sense'),(select team_id from teams where team_name='Cloud 9'),'Split','7-13','Breeze','12-14',null,null,'0-2',(select player_id from players where nickname='leaf')),
('Day Six','Groups',(select team_id from teams where team_name='Acend'),(select team_id from teams where team_name='Team Envy'),'Ascent','13-8','Bind','13-11',null,null,'2-0',(select player_id from players where nickname='leaf')),
('Day Six ','Groups',(select team_id from teams where team_name='Keyd Stars'),(select team_id from teams where team_name='X10 CRIT'),'Icebox','6-13','Haven','5-13',null,null,'0-2',(select player_id from players where nickname='sushiboys')),
('Day Six','Groups',(select team_id from teams where team_name='Sentinels'),(select team_id from teams where team_name='KRU Esports'),'Fracture','13-7','Haven','11-13','Split','11-13','1-2',(select player_id from players where nickname='ShahZam')),
('Day Seven','Groups',(select team_id from teams where team_name='Vision Strikers'),(select team_id from teams where team_name='Cloud 9'),'Ascent','10-13','Split','13-9','Breeze','11-13','1-2',(select player_id from players where nickname='leaf')),
('Day Seven','Groups',(select team_id from teams where team_name='Team Vikings'),(select team_id from teams where team_name='Team Secret'),'Haven','6-13','Icebox','7-13',null,null,'0-2',(select player_id from players where nickname='DubsteP')),
('Day Seven','Groups',(select team_id from teams where team_name='Team Envy'),(select team_id from teams where team_name='X10 CRIT'),'Icebox','13-10','Split','8-13','Haven','12-14','1-2',(select player_id from players where nickname='sushiboys')),
('Day Eight','Quater Finals',(select team_id from teams where team_name='Acend'),(select team_id from teams where team_name='Team Secret'),'Icebox','13-8','Breeze','13-6',null,null,'0-2',(select player_id from players where nickname='cNed')),
('Day Eight','Quarter Finals',(select team_id from teams where team_name='Team Liquid'),(select team_id from teams where team_name='Cloud 9'),'Bind','13-10','Ascent','13-11',null,null,'0-2',(select player_id from players where nickname='leaf')),
('Day Nine','Quarter Finals',(select team_id from teams where team_name='Gambit'),(select team_id from teams where team_name='X10 CRIT'),'Fracture','13-7','Ascent','7-13','Breeze','13-7','2-1',(select player_id from players where nickname='Chronicle')),
('Day Nine','Quarter Finals',(select team_id from teams where team_name='Fnatic'),(select team_id from teams where team_name='KRU Esports'),'Haven','13-15','Icebpx','13-6','Split','8-13','1-2',(select player_id from players where nickname='Keznit')),
('Day Ten','Semi Finals',(select team_id from teams where team_name='Acend'),(select team_id from teams where team_name='Team Liquid'),'Bind','13-6','Split','13-5',null,null,'2-0',(select player_id from players where nickname='starxo')),
('Day Ten','Semi Finals',(select team_id from teams where team_name='Gambit'),(select team_id from teams where team_name='KRU Esports'),'Breeze','13-8','Ascent','7-13','Bind','18-16','2-1',(select player_id from players where nickname='Chronicle'));

insert into final (final_match_id ,final_day ,city,venue ,final_team_1 ,final_team_2 ,final_map_1,final_map_1_score ,final_map_2 ,final_map_2_score ,final_map_3 ,final_map_3_score ,final_map_4 ,final_map_4_score, final_map_5, final_map_5_score, final_score, final_mvp )
values (2100,'Day Eleven','Berlin','Verti Music Hall',(select team_id from teams where team_name='Acend'),(select team_id from teams where team_name='Gambit'),'Breeze','11-13','Ascent','13-7','Fracture','3-13','Icebox','14-12','Split','13-8','3-2',(select player_id from players where nickname='nAts'));
 



