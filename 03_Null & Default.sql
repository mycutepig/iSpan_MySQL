-- null & default
use my_database;

desc employee;

insert into employee
(employee_id, employee_name)
values(10, "Harrison");

select * from employee;

create table cars(
car_brand varchar(50) not null,
car_color varchar(50) not null,
car_sale_price int
);

desc cars;

insert into cars
(car_brand, car_sale_price)
values("Luxgen", 200000);

show warnings;
-- Error	1364	Field 'car_color' doesn't have a default value

select * from cars;

insert into cars
(car_brand, car_color, car_sale_price)
values
("Luxgen", "white", 180000),
("Luxgen", "green");

show warnings;
-- Error	1136	Column count doesn't match value count at row 2

select * from cars;

insert into cars
(car_brand, car_color, car_sale_price)
values
("Luxgen", "white", 180000),
("Luxgen", "green", null);

select * from cars;

-- default
create table cars_02(
car_brand varchar(50) not null default "不知道",
car_color varchar(50) not null default "unknown",
car_sale_price int default 50000
);

desc cars_02;

insert into cars_02
()
values
();

select * from cars_02;

insert into cars_02
(car_color)
values
("black");

select * from cars_02;

-- null with default
create table cars_03(
car_brand varchar(50) default "不知道",
car_color varchar(50) default "unknown",
car_sale_price int default 50000
);

desc cars_03;

insert into cars_03
(car_brand, car_color, car_sale_price)
values
(null, "black", null);

insert into cars_03
(car_color)
values
("black");

select * from cars_03;

-- practice
insert into cars_03
(car_brand, car_color)
values
("Toyota", null),
("Honda", null);

select * from cars_03;

insert into cars_03
(car_brand, car_color, car_sale_price)
values
(null, "black", null),
(default, "black", default),
("Toyota", null, default),
("Honda", null, default);

select * from cars_03;
