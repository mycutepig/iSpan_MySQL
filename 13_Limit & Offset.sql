use my_train_titanic;

-- limit & offset
select * from passengers;
select * from passengers limit 10;
-- if limit > all data amounts, it just returns the maximum amount of data
select * from passengers limit 1000;

-- limit <num1>(index), <num2>
-- from <num1> output <num2> data
-- output id => 11, 12
select * from passengers limit 10, 2;

-- offset
-- output id => 11, 12
-- 
select * from passengers limit 2 offset 10;

-- p.126 practice
select * from passengers
order by -portId desc;

select * from passengers
order by -portId desc
limit 10;