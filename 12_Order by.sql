use my_train_titanic;

select * from passengers;
select * from passengers order by age;

-- descend(desc)
select * from passengers order by age desc;

-- p.123 practice
select * from passengers
order by -portId desc; 
