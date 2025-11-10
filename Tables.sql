-- Tables

create table employee(
employee_id int,
employee_name varchar(50),
employee_age int,
employee_salary int,
employee_department varchar(50)
);

desc employee;

insert into employee
(employee_id, employee_name, employee_age, employee_salary, employee_department)
values
(1, "Tim", 39, 100000, "Sales"),
(2, "Danny", 27, 33000, "Accounting"),
(3, "Wilson", 33, 42000, "Administration"),
(4, "Elizabeth", 22, 29000, "Accounting");

select * from employee;

create table members(
member_id int,
member_name varchar(50),
member_gender varchar(50),
member_age int
);

insert into members(member_id, member_name, member_gender, member_age)
values(1, "Abigail", "Female", 15);

insert into members
(member_id, member_name, member_gender, member_age)
values
(2, "Maria", "Female", 21),
(3, "Gregory", "Male", 35),
(4, "Scott", "Male", 39);

-- * means "all"
select * from members;

-- error
show warnings;
 
 -- check the table setting
 show columns from members;
 describe members;
 desc members;

-- delete table
drop table members;

-- practice
create table player_02(
player_id int,
player_name varchar(50),
player_age int,
player_salary int,
player_team varchar(100)
);

desc player_02;

drop table player_02;