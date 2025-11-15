use my_database;

create table ports(
id int(10),
embarked varchar(5),
city varchar(20),
primary key(id)
);

create table class(
id int(10),
class_number int(5),
class_level varchar(20),
primary key(id)
);

create table passengers(
id int(10), 
pclass int(10), 
pname varchar(100), 
sex varchar(6), 
age int(10), 
portId int(10),
foreign key(portId) references ports(id),
foreign key(pclass) references class(id)
);

INSERT INTO ports(id, embarked, city) VALUES (1, 'S', 'Southampton');
INSERT INTO ports(id, embarked, city) VALUES (2, 'C', 'Cherbourg');
INSERT INTO ports(id, embarked, city) VALUES (3, 'Q', 'Queenstown');

INSERT INTO class(id, class_number, class_level) VALUES (1, 1, 'First Class');
INSERT INTO class(id, class_number, class_level) VALUES (2, 2, 'Second Class');
INSERT INTO class(id, class_number, class_level) VALUES (3, 3, 'Third Class');

INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (1, 3, 'Braund, Mr. Owen Harris', 'male', 22, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (2, 1, 'Cumings, Mrs. John Bradley (Florence Briggs Thayer)', 'female', 38, 2);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (3, 3, 'Heikkinen, Miss. Laina', 'female', 26, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (4, 1, 'Futrelle, Mrs. Jacques Heath (Lily May Peel)', 'female', 35, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (5, 3, 'Allen, Mr. William Henry', 'male', 35, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (6, 3, 'Moran, Mr. James', 'male', NULL, 3);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (7, 1, 'McCarthy, Mr. Timothy J', 'male', 54, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (8, 3, 'Palsson, Master. Gosta Leonard', 'male', 2, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (9, 3, 'Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)', 'female', 27, 1);
INSERT INTO passengers(id, pclass, pname, sex, age, portId) VALUES (10, 2, 'Nasser, Mrs. Nicholas (Adele Achem)', 'female', 14, 2);

select * from passengers;
select * from ports;
select * from class;

-- inner join
select *
from passengers
join ports
on portid = ports.id;

-- join with specific columns (only pname, city)
select pname, city
from passengers
join ports
on portid = ports.id;

--
select passengers.id, pname, city
from passengers
join ports
on portid = ports.id;

-- join with aliases
select pa.id as '乘客ID', pname, po.id as '港口ID', city
from passengers as pa
join ports as po
on portid = po.id;

-- skip 'as'
select pa.id '乘客ID', pname, po.id '港口ID', city
from passengers pa
join ports po
on portid = po.id;

-- p108 practice
select pname '乘客姓名', class_level '船艙等級'
from passengers
join class
on pclass = class.id;

-- join with null
select * from passengers;

insert into passengers(id, pclass, pname, sex, age, portid)
values(11, 2, 'Nancy Alomar', 'female', 54, null);

select * from passengers;

-- try inner join (no date appear with that null one)
select * 
from passengers
join ports
on portid = ports.id;

-- try left join
select * 
from passengers
left join ports
on portid = ports.id;

-- try right join
insert into ports
(id, embarked, city)
values
(4, null, 'Taipei');

select * from ports;

select *
from passengers
right join ports
on portid = ports.id;

-- switch table order
select *
from ports
right join passengers
on portid = ports.id;

-- full outer join (no usage in MySQL now)
select *
from passengers
full join ports
on portid = ports.id;

-- union
select *
from passengers
left join ports
on portid = ports.id
union
select *
from passengers
right join ports
on portid = ports.id;

-- join with where
select pname, city
from passengers
join ports
on portId = ports.id
where sex = 'female';

-- p113 practice
select pname, class_level
from passengers
join class
on class.id = pclass
where pclass = 2 or pclass = 3;

-- three table join
create table teams(
id int not null primary key auto_increment,
team_name varchar(50),
team_nickname varchar(50)
);

create table result(
id int not null primary key auto_increment,
result_name varchar(50),
result_description varchar(100)
);

create table matches(
fk_result_id int,
fk_team_id int,
foreign key (fk_result_id) references result(id),
foreign key (fk_team_id) references teams(id)
);

insert into teams(team_name, team_nickname)
values
('Brother Elephants', '爪爪'),
('Rakuten Monkeys', '吱吱'),
('Uni Lions', '喵喵'),
('Fubon Guardians', '邦邦'),
('WeiChuan Dragons', '油龍');

insert into result(result_name, result_description)
values
('贏球', '得分比對方多'),
('輸球', '得分比對方少'),
('平手', '雙方得分一樣多');

insert into matches(fk_result_id, fk_team_id)
values
(1, 2),
(1, 3),
(1, 5),
(1, 4),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 3);

-- check table
select * from teams;
select * from result;
select * from matches;

use my_database;
-- p115 practice
-- #1 
select team_nickname, result_name
from matches
join teams
on teams.id = fk_team_id
join result
on result.id = fk_result_id;

-- #2
select team_nickname, result_name
from matches
join teams
on teams.id = fk_team_id
join result
on fk_result_id = result.id
order by teams.id;
