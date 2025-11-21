-- try full titanic data
create database if not exists my_titanic;
use my_titanic;

-- load data from CSV

CREATE TABLE IF NOT EXISTS full_passengers(
  id INT(11), 
  pclass DECIMAL(10, 2), 
  survived DECIMAL(10, 2), 
  pname VARCHAR(100), 
  sex VARCHAR(50), 
  age INT(11),
  sibsp INT(11), 
  parch INT(11),
  ticket VARCHAR(100),
  fare DECIMAL(10, 2),
  cabin VARCHAR(50), 
  embarked VARCHAR(50),
  boat VARCHAR(50),
  body INT(11),
  homedest varchar(100)
 );
# drop table full_passengers;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/titanic_full_data.csv'
INTO TABLE full_passengers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id, pclass, survived, pname, sex, @age, sibsp, parch, ticket, @fare, cabin, embarked, boat, @body, homedest)
SET age = NULLIF(@age,''), fare = nullif(@fare, ''), body = nullif(@body, '');

select * from full_passengers limit 1350;

# hw1_Titanic
use my_titanic;

# 1.查詢各性別乘客的總人數，請顯示在sex與gender_counts這兩個欄位
select sex, count(sex) as gender_counts
from full_passengers
group by sex;

# 2.查詢第591至第883名乘客的id與姓名資料
select id, pname 
from full_passengers
limit 590, 293;

# 3.請找出所有的Anders & Alfrida Andersson家成員以及存活狀態
select pname, survived
from full_passengers
where pname like 'Andersson, %' and homedest  like 'Sweden %';

# 4.承上題，已知Alfrida還有一個已婚的妹妹叫做Anna，請找出Anna與其丈夫小孩一家三口的全部資料
select *
from full_passengers
where ticket = (
select ticket from full_passengers where pname like '%Brogren%' and pname like '%Anna%'
);

# 5.找出所有名字是Leonard的男性乘客，顯示id, pclass, pname
select id, pclass, pname
from full_passengers
where pname like '% Leonard%' and sex = 'male';

# 6.查詢所有乘客持有的票券中，最多人持有的那一種ticket，回傳票券名稱(ticket)與持有人數(ticket_count)兩個欄位
select ticket, count(ticket) as ticket_count
from full_passengers
group by ticket
order by ticket_count desc
limit 1;

# 7.分開列出二等客艙以及三等客艙中所有男性乘客的平均年齡
select pclass, avg(age) as male_avg_age
from full_passengers
where sex = 'male' and pclass != 1
group by pclass;

# 8.列出所有登船點的登船人數與百分比，僅列出有明確登船地點的資料即可
select embarked as '登船點', count(embarked) as '登船人數', round(count(embarked) / (select count(id) from full_passengers) * 100, 2) as '登船點佔百分比'
from full_passengers
where embarked != ''
group by embarked;
