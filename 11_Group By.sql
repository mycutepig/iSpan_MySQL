use my_train_titanic;
-- group by & aggregation
select * from passengers
group by pclass;

show warnings;
#Error	1055	Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'my_train_titanic.passengers.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

-- count(pclass), count(sex) not exist
select count(pclass) from passengers
group by pclass;

select pclass, count(pclass) from passengers
group by pclass;

select sex, count(sex) from passengers
group by sex;

-- P.118 practice
# 1
select sex, avg(age) from passengers
group by sex;
# 2
select pclass, max(age) from passengers
group by pclass;
# 3
select pclass, min(age) from passengers
group by pclass;

-- group by with join
create table artists(
id int primary key auto_increment,
artist_name varchar(50) not null unique
);

create table songs(
id int not null primary key auto_increment,
song_name varchar(50) not null,
artist_id int,
foreign key(artist_id) references artists(id) on delete cascade
);

insert into artists(artist_name)
values('Bruno Mars'), ('Jay Sean'), ('Usher'), ('Sean Kingston');

insert into songs(song_name, artist_id)
values('Just the way you are', 1), ('Treasure', 1), ('Down', 2), ('Yeah', 3), ('DJ got us fall in love again', 3), ('Beautiful girls', 4);

select * from artists;
select * from songs;

-- p.119 practice solution
-- join first then group by!
select artist_name, count(artist_id) as 'numbers of songs'
from artists
join songs
on artist_id = artists.id
group by artist_id;

-- p.120 
-- having (like where)
select artist_name, count(artist_id) 'numbers of songs'
from artists
join songs
on artist_id = artists.id
group by artist_id
having count(artist_id) > 1;

-- p.120 practice
select * from passengers;
select * from ports;

-- 123123 
-- on => codition so can't express null
select city, count(*) as 'boarding counts'
from passengers
join ports
on portId = ports.id
group by portId;
-- having count(portId) > 99;

select city, count(portId) as 'boarding counts'
from passengers
join ports
on portId = ports.id
group by portId
having count(portId) > 99;

-- count(portId) vs. count(*) => all data from the column
select portId, count(portId) from passengers
group by portId;

select portId, count(*) from passengers
group by portId;