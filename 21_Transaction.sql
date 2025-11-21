-- transaction
create database transaction_test;
use transaction_test;

create table transaction_test(
id int not null primary key auto_increment,
user_name varchar(50),
user_deposit bigint
);

insert into transaction_test(user_name, user_deposit)
values
('Sam', 200000),
('Evelyn', 80000);

select * from transaction_test;

-- normal transaction
update transaction_test 
set user_deposit = user_deposit - 20000
where id = 1;

update transaction_test 
set user_deposit = user_deposit + 20000
where id = 2;

# 180000 100000
select * from transaction_test;

-- auto commit off
set @@autocommit = off;
-- transaction with auto commit off
-- 
update transaction_test 
set user_deposit = user_deposit - 20000
where id = 1;

update transaction_test 
set user_deposit = user_deposit + 20000
where id = 2;

select * from transaction_test;
# 160000 120000

-- reboot 
use transaction_test;
select * from transaction_test;
# 180000 100000
# @@autocommit didn't store the data (need to use commit like below)

-- auto commit off again
set @@autocommit = off;
-- transaction with auto commit off
-- 
update transaction_test 
set user_deposit = user_deposit - 20000
where id = 1;

update transaction_test 
set user_deposit = user_deposit + 20000
where id = 2;

commit;

select * from transaction_test;
# 160000 120000

-- rollback
set @@autocommit = off;

update transaction_test 
set user_deposit = user_deposit - 20000
where id = 1;

select * from transaction_test;
# 140000 120000

rollback;

select * from transaction_test;
# 160000 120000

-- rollback multi lines
set @@autocommit = off;

update transaction_test 
set user_deposit = user_deposit - 20000
where id = 1;

update transaction_test 
set user_deposit = user_deposit + 20000
where id = 2;

select * from transaction_test;
# 140000 140000

rollback;

select * from transaction_test;
# 160000 120000

set @@autocommit = on;