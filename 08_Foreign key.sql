-- foreign key
create database social_media_app;
use social_media_app;

create table users(
id int not null primary key auto_increment,
user_name varchar(200)
);

-- insert data
insert into users(user_name)
values
('Amanda'), ('Brian'), ('Cally'), ('Daniel'), ('Edward');

select * from users;

create table photos(
id int not null primary key auto_increment,
photo_url varchar(200),
user_id int,
-- key point!
foreign key (user_id) references users(id)
);

-- check table settings
desc photos;

-- insert data
insert into photos(photo_url, user_id)
values('https://123456.png', 1);

select * from users;
select * from photos;

insert into photos(photo_url, user_id)
values
('https://123456.png', 1),
('https://123456.png', 2),
('https://123456.png', 2),
('https://123456.png', 3);

select * from photos;

insert into photos
(photo_url, user_id)
values
('https://77777.png', 5566);

show warnings;
-- 	Error	1452	Cannot add or update a child row: a foreign key constraint fails (`social_media_app`.`photos`, CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))

-- insert without certain user id
insert into photos
(photo_url, user_id)
values
('https://99999.png', null);

select * from photos;

-- on delete restrict
drop table users;

show warnings;

-- 	Error	3730	Cannot drop table 'users' referenced by a foreign key constraint 'photos_ibfk_1' on table 'photos'.

delete from users where id = 1;

show warnings;

-- 	Error	1451	Cannot delete or update a parent row: a foreign key constraint fails (`social_media_app`.`photos`, CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))