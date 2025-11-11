-- alter table setting
# rename => rename the table_name
select * from employee;

alter table employee rename 員工;

select * from 員工;

# change column => rename the column name (<old_name> <new_name> <data_type>)
select * from 員工;

alter table 員工 change column employee_salary 員工薪資 int;

select * from 員工;