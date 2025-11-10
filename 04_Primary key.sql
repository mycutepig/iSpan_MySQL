use my_database;

create table cars_04(
car_id int primary key,
car_brand varchar(50),
car_color varchar(50),
car_sale_price int
);

desc cars_04;

-- insert a row of data
insert into cars_04
(car_id, car_brand, car_color, car_sale_price)
values
(1, "Luxgen", "pink", 140000);

select * from cars_04;

-- insert a row of data again
insert into cars_04
(car_id, car_brand, car_color, car_sale_price)
values
(1, "Luxgen", "pink", 140000);

show warnings;
-- Error	1062	Duplicate entry '1' for key 'cars_04.PRIMARY'

select * from cars_04;

insert into cars_04
(car_id, car_brand, car_color, car_sale_price)
values
(2, "Luxgen", "purple", 120000);

select * from cars_04;

insert into cars_04
(car_brand, car_color, car_sale_price)
values
("Luxgen", "purple", 120000);

show warnings;
-- Error	1364	Field 'car_id' doesn't have a default value

-- auto increment
create table cars_05(
car_id int primary key auto_increment,
car_brand varchar(50),
car_color varchar(50),
car_sale_price int
);

desc cars_05;

insert into cars_05
(car_brand, car_color, car_sale_price)
values
("luxgen", "yellow", 100000);

select * from cars_05;

-- insert * 3
insert into cars_05
(car_brand, car_color, car_sale_price)
values
("luxgen", "yellow", 100000);

select * from cars_05;

-- insert car_id manually
insert into cars_05
(car_id, car_brand, car_color, car_sale_price)
values
(5566, "Lungex", "green", 80000);

select * from cars_05;

-- id start from 5566
insert into cars_05
(car_brand, car_color, car_sale_price)
values
("luxgen", "red", 60000);

select * from cars_05;

-- auto increment customized
create table cars_06(
car_id int primary key auto_increment,
car_brand varchar(50),
car_color varchar(50),
car_sale_price int
);

alter table cars_06 auto_increment = 101;

insert into cars_06
(car_brand, car_color, car_sale_price)
values
("luxgen", "brown", 60000);

select * from cars_06;

-- unique key
create table user_account(
user_id int primary key auto_increment,
user_name varchar(100) not null unique,
user_password varchar(100) not null
);

desc user_account;

# 1
insert into user_account
(user_name, user_password)
values
("iloveLuxgen", "5566");

select * from user_account;

# 2
insert into user_account
(user_name, user_password)
values
("iloveLuxgen", "5566");

show warnings;
-- 	Error	1062	Duplicate entry 'iloveLuxgen' for key 'user_account.user_name'

# 3
insert into user_account
(user_name, user_password)
values
("ihateLuxgen", "5566");

select * from user_account;

-- practice
