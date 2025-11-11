use my_database;

create table player(
player_id int primary key auto_increment,
player_name varchar(50),
player_position varchar(50),
player_age int
);

insert into player
(player_name, player_position, player_age)
values
('Bobby', 'INF', 23),
('Luis', 'P', 30),
('Jonah', 'C', 28),
('Framber', 'P', 30),
('Pete', 'P', 27),
('Matt', 'INF', 29),
('Corbin', 'OF', 23),
('Juan', 'OF', 28);

select * from  player;

-- partial select
select player_name from player;
select player_id, player_name from player;

-- compare two table (#2 much better order to find player_age)
-- #1
select player_position, player_age, player_name from player;
-- #2
select 
player_id, player_name, player_age 
from 
player;

-- where clause
select * 
from player
where player_age = 23;

select player_name, player_age from player where player_age = 23;

-- >, <, =
select * from player where player_age > 28;
select * from player where player_age >= 28;

select * from player where player_age < 28;
select * from player where player_age <= 28;

-- case insensitive in MySQL
select * from player where player_name = 'Corbin';
select * from player where player_name = 'corbin';
select * from player where player_name = 'CorBIN';

-- double where (where + and)
select * from player where player_position = 'P';
select * from player where player_position = 'P' and player_age < 28;

-- merge the conditions
#1
select * from player where player_age >= 27;
#2
select * from player where player_age <= 29;
#3
select * from player where player_position = 'P';
# merge 1, 2, 3 
select * from player where player_age >= 27 and player_age <= 29 and player_position = 'P';
# improve the merge (n1~n2 => between n1 and n2)
select * from player where (player_age between 27 and 29) and player_position = 'P';

-- p.82 practice
create table grocery(
grocery_id int primary key auto_increment,
grocery_name varchar(50),
grocery_category varchar(50),
grocery_reserves int
);

desc grocery;

insert into grocery(grocery_name, grocery_category, grocery_reserves)
values
('Beef', 'Meat', 13),
('Milk', 'Dairy', 15),
('Spinach', 'Vegetables', 20),
('Cheese', 'Dairy', 5),
('Pork', 'Meat', 8),
('Beer', 'Beverage', 60),
('Cabbage', 'Vegetables', 21),
('Lamb', 'Meat', 16);

select * from grocery;

#1
select grocery_name, grocery_category, grocery_reserves from grocery;
#2
select grocery_id, grocery_name from grocery where (grocery_id between 3 and 7);
#3
select grocery_id, grocery_name, grocery_category
from grocery
where grocery_category = 'Meat';

-- aliases
select player_name, player_position, player_age from player;
-- heading catagory as xxx
select player_name as 球員姓名, player_position as 球員位置, player_age as 球員年齡 from player;
-- if space 'xxx yyy'
select player_name as '球員 姓名', player_position as 球員_位置, player_age as 球員_年齡 from player;
-- omit as
select player_name 球員姓名, player_position 球員位置, player_age 球員年齡 from player;

-- update
select * from player;

select * from player where player_position = 'P';

update player 
set player_position = 'Pitcher'
where player_position = 'P';

select * from player; 

select * from player where player_name = 'Pete';

update player
set player_position = 'OF'
where player_name = 'Pete';

select * from player; 

-- p86 practice
select * from player where player_name = 'Bobby';

update player
set player_age = 26
where player_name = 'Bobby';

select * from player; 

select * from player where player_name = 'Jonah';

update player
set player_name = 'Jonathan'
where player_name = 'Jonah';

select player_name, player_age from player where player_name = 'Bobby' or player_name = 'Jonathan';

-- delete
select * from player where player_id = 3;

delete from player where player_name = 'Jonathan';

select * from player;