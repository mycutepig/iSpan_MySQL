-- like
use my_train_titanic;

select * from passengers;

-- where
select * from passengers where name = "Braund";
select * from passengers where name = "Braund, Mr. Owen Harris";

-- like
select * from passengers where name like '%william%';
select * from passengers where name like 'william%';
select * from passengers where name like '%william';

-- find William
select * from passengers where name like '% william %';
select * from passengers where name like '% william %' and sex = 'male';

-- p.133 practice
select * from passengers where name like 'williams, %';

-- find smith
select * from passengers where name like '%smith%';
select * from passengers where name like 'smith,%';

select * from passengers where name like '%)';
select * from passengers where name like '%) ';

select * from passengers where name like '%williams%' and name like '%charles%';

select * from passengers where ticketid like '_';
select * from passengers where ticketid like '__';

-- p.135 practice
select * from passengers where ticketid like '__' and name like '% william %' and name not like '%)';
select * from passengers where ticketid like '__' and name like '% william %' and sex = 'male';