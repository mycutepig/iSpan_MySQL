use my_train_titanic;

-- stored procedure
delimiter //
create procedure select_ports()
begin
	select * from ports;
end //
delimiter ;

call select_ports();
drop procedure select_ports;

select * from ports;
delimiter //
create procedure ports_city(in portsid int)
begin
	select city from ports where id = portsid;
end //
delimiter ;

call ports_city(1);

-- p.146 practice
-- using concat
select * from passengers where name like concat('%', 'william', '%');
delimiter $$
create procedure get_passenger_port(in pname varchar(150))
begin
	select name, portId from passengers where name like concat('%', pname, '%');
end $$
delimiter ;

call get_passenger_port('williams, ');

