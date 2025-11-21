-- in & not in
use my_train_titanic;

-- in
select * from passengers where portId = 1 or portId = 3;
select * from passengers where portId in (1, 3);

-- not in (get portId == 2)
select * from passengers where portId != 1 and portId != 3;
select * from passengers where portId not in (1, 3);

-- p.137 practice
select * from passengers where sex != 'female' and portId not in (2, 3);