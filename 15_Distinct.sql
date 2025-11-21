use my_train_titanic;
-- distinct
select * from passengers;

select pclass from passengers;
select distinct pclass from passengers;

-- could show "NULL"!
select distinct portId from passengers;

-- p.130 practice
select count(pclass) from passengers;
select count(distinct pclass) as class_count
from passengers;

-- not include "NULL"
select count(distinct portId)
from passengers;

-- how many types of fare 
select * from tickets;
select count(distinct fare)
from tickets;

-- double distinct
select distinct pclass, sex
from passengers;

-- count 
-- 3 * 2
select count(distinct pclass, sex)
from passengers;
-- 3 * 2 * 3
select count(distinct pclass, sex, portId)
from passengers;