-- case
select * from passengers;

-- case, end (when + then, else)
select id, name,
case
	when portId = 1 then 'Southampton'
	when portId = 2 then 'Cherbourg'
	when portId = 3 then 'Queenstown'
    else '窩不知道'
end '上船地址'
from passengers;