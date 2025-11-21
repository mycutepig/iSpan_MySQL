use my_train_titanic;

-- subquery
# 1 find max(age) => 70
select max(age) from passengers
where pclass = 2;
# 2 find passengers whose age > 70
select * from passengers
where age > 70;
# 3 merge
select pclass, name, age
from passengers
where age > (select max(age) from passengers
where pclass = 2);

# better syntax
select pclass, name, age
from passengers
where age > (
	select max(age) 
    from passengers 
    where pclass = 2
);