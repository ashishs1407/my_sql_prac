-- sub - queries  => inside multiple 
select * from menu;
select * from sales ;

-- get the revenue of items after '2021-01-11' 
select * 
from sales s 
left join menu m 
using(product_id) 
where order_date > '2021-01-11' ;  


select * 
from menu 
where product_id  in (
	select distinct product_id from sales 
	where order_date < '2021-01-11'
)  ; 


select * from sakila.actor  where actor_id in (1 ,10,20,30,40,53,108,162,188,198);
select * from sakila.film_actor where film_id  = 1  ;
select film_id from sakila.film where title = 'ACADEMY DINOSAUR';

-- which actor acted in film  ACADEMY DINOSAUR film_id 1 
select * from sakila.actor  
where actor_id in ( 
	select actor_id from sakila.film_actor 
    where film_id  = 
    (
    select film_id from sakila.film where title = 'ACADEMY DINOSAUR'
    )
    
);


-- from subqueries 

select  * from sakila.actor ;
select * from sakila.film_actor ; 

select actor_id  
from  
(select * from sakila.film_actor where film_id = 106) xy ;

-- 
select customer_id , sum(price) as revenue , 
(select sum(price) from menu left join sales using(product_id) ) as total_revenue 
from sales 
left join menu 
 using (product_id) 
 group by 1 ;
 
 
 select * , (select sum(salary) from employee ) as total_salary from employee ; 
 
 
 -- 
 -- cte : common table expression 
 
 with <name_cte> as (
 any select statement 
 ) 
 select * from name_cte ;
 
 
 with 
 cte_m as (
 select * from employee where gender = 'M' 
 ) 
 select first_name , last_name , email ,salary  from cte_m 
 ;
 
 with xyz as ( 
 select * from employee where gender = 'M' 
 ) 
 , abc as (
  select * from employee where gender = 'F' 
  )
  , xyz_lj_abc as (
	select xyz.* from xyz left join abc using(region_id) 
    ) 
  select sum(salary) from xyz_lj_abc ;
  
  
-- Temporary table  : create on run time and this table is not stored in db 

-- create table <tbl_name> (col1 dtype , .... ,.... )

select * from employee  where department = 'sports';
create table emp_sports as ( select * from employee  where department = 'sports') ; 

create temporary table temp_emp_sports
 as  (select * from employee  where department = 'sports' ) ;

use my_prac ;
select * from temp_emp_sports ;
  
(select * from emp_sports ) -- 4 
union all 
(select * from employee where region_id = 7 ); -- 12

insert into emp_sports 
(select * from employee where region_id = 7  )  ;
 
 -- views : are nothing but a queries being executed at run time 
 -- difference b/w table and view 
 
 -- create view <v_name> as (select statement ) ;
  
 create view view_rgn7  as
 (select * from employee where region_id = 7) ;

 select * from view_rgn7 ;
 
 -- materialized view | view 
 
 -- 
 
 -- subsets of sql  | type of sql statement 
 -- ddl => data defination lang. eg. drop , alter , rename , truncate 
 -- dml => data manupulation lang. eg. insert , update , delete , join ,union 
 -- dql => data query lang.  eg. select 
 -- dcl => data control lang.
 -- tcl => transaction control lang . 
 
 -- drop ,, truncate |  delete 
 create table temp as (
 select * from emp_sports ) ;
 
 
 drop table emp_sports ; 
 
 select * from temp ;
 truncate table  temp ;  --  deleted all the records 
 create table emp_temp as (
 select * from emp_temp ) ;
 
 -- delete from <tbl_name > where condition 
 
 delete from emp_temp where employee_id = 1 ;
 
delete from emp_temp  ;
-- 2 - 3 m 
truncate table emp_temp ;
 
 -- var 
 select * from employee;
 
 select * from employee 
 where salary = (select max(salary) from employee) ;
 
 set @max_sal = (select max(salary) from employee) ;
 
 select * from employee where salary = @max_sal ;
 
 
 set @even_regn = (select region_id from employee where region_id%2 = 0) ;
 
 
Create table If Not Exists Weather (id int, recordDate date, temperature int) ;
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');
select *  from Weather ;
-- id 
--  tempcur > tempprev 
--  curent - 1 day =  prev 

select *  from weather w1 
join weather w2 
on date_add(w1.recorddate  , interval -1 day ) = w2.recorddate  
and w1.temperature > w2.temperature ;

-- 




 
select date_add('2015-01-02' ,interval -1 day)  ;


-- RENAME TABLE a TO aa; 
 -- subsets of sql  | type of sql statement 
 -- ddl => data defination lang. eg. drop , alter , rename , truncate 
 -- dml => data manupulation lang. eg. insert , update , delete , join ,union 
 -- dql => data query lang.  eg. select 
 -- dcl => data control lang.
 -- tcl => transaction control lang . 

create  table emp_temp as  (
select * from employee );

select * from emp_temp ;

drop table emp_temp  ;

truncate table emp_temp ; 

RENAME TABLE emp TO empolyee_d; 
-- table 
-- col name datatyes 

select * from emp_temp ;

-- add a column 
-- mob_no  varchar(10)

-- alter table <tabl_name > add < colname dataype >  

alter table emp_temp add pincode  int ; 

select * from emp_temp ;

-- delete 
-- alter table <table_name> drop column <colname >

 alter table emp_temp drop column hire_date ;
 
 -- rename column 
 -- alter table < tabl_name > rename column <old col name> to <new colunm name >
 alter table emp_temp rename column mob_no to mobile_number ; 
 
-- alter the datatype 
-- alter table <tble_name> modify <existing column  new_datatype>
alter table emp_temp modify region_id varchar(10) ;

select employee_id , first_name , last_name 
email , pincode ,department , gender , salary , region_id , mobile_number 
  from emp_temp ;
-- temporary 
-- drop existing 
-- rectreate it fron temp table  seq of columns 

create temporary table  emp_temp1 as ( 
select * from emp_temp ) ;

select * from emp_temp1 ;
drop table emp_temp ;

create table emp_temp as (  select employee_id , first_name , last_name ,
email , pincode ,department , gender , salary , region_id , mobile_number 
from emp_temp1
);

select * from emp_temp ;



-- update => row level 
update emp_temp set mobile_number = '1234567890' where employee_id = 2 ; 

use my_prac ;
Create table If Not Exists Salary (id int, name varchar(100), sex char(1), salary int)  ;
Truncate table Salary ;
insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500') ;
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500');
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500');
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500');

select * from salary ; 

update salary 
set sex = (case when sex = 'm' then 'f' 
				when sex = 'f' then 'm' 
			end )  ;
            
update salary 
set sex  = 'f' 
where name = 'A' ;

select * from salary;

with cte as (
select * , row_number() over(partition by name , sex  order by salary desc)  as rn 
from salary )
select id , name , sex ,salary from cte 
where rn = 1;


Create table If Not Exists Person (Id int, Email varchar(255)) ;
Truncate table Person ;
insert into Person (id, email) values ('1', 'john@example.com') ;
insert into Person (id, email) values ('2', 'bob@example.com') ;
insert into Person (id, email) values ('3', 'john@example.com') ;

select * from person ;

select p1.* from person p1 
left join person p2 
on p1.email = p2.email
and  p1.id  > p2.id  
where p2.id is null ;

select p1.* 
from person p1
join person p2 
on p1.email = p2.email 
and p1.id > p2.id ;
select * from person ;
delete p1 
from person p1
join person p2 
on p1.email = p2.email 
and p1.id > p2.id ;


Create table If Not Exists Employee1 (id int, name varchar(255), salary int, managerId int) ;
Truncate table Employee ;
insert into Employee1 (id, name, salary, managerId) values ('1', 'Joe', '70000', '3') ;
insert into Employee1 (id, name, salary, managerId) values ('2', 'Henry', '80000', '4') ;
insert into Employee1 (id, name, salary, managerId) values ('3', 'Sam', '60000', Null) ;
insert into Employee1 (id, name, salary, managerId) values ('4', 'Max', '90000', Null) ;


select * from employee1 ;
SELECT *  
FROM Employee1 e
 JOIN Employee1 m ON e.managerId = m.id 
where e.salary > m.salary ;

Create table If Not Exists orders (order_number int, customer_number int) ;
Truncate table orders ; 
insert into orders (order_number, customer_number) values ('1', '1') ;
insert into orders (order_number, customer_number) values ('2', '2') ;
insert into orders (order_number, customer_number) values ('3', '3') ;
insert into orders (order_number, customer_number) values ('4', '3') ;

select * from orders ;

with cte AS (
select customer_number , count(*)  as cnt
from Orders 
group by customer_number 
)
select customer_number from cte 
where cnt = (select max(cnt) from cte) ;


Create table If Not Exists Employee (id int, salary int) ; 
drop table Employee ; 
insert into Employee (id, salary) values ('1', '100') ; 
insert into Employee (id, salary) values ('2', '200') ;
insert into Employee (id, salary) values ('3', '300') ;


select * from employee ;

select * from employee
order by 2 desc 
limit 1 offset 2   ;

DROP TABLE IF EXISTS student_score;

CREATE TABLE student_score (
  student_id  int ,
  student_name VARCHAR(30),
  dep_name VARCHAR(40),
  score INT
);

INSERT INTO student_score VALUES (11, 'Ibrahim', 'Computer Science', 80);
INSERT INTO student_score VALUES (7, 'Taiwo', 'Microbiology', 76);
INSERT INTO student_score VALUES (9, 'Nurain', 'Biochemistry', 80);
INSERT INTO student_score VALUES (8, 'Joel', 'Computer Science', 90);
INSERT INTO student_score VALUES (10, 'Mustapha', 'Industrial Chemistry', 78);
INSERT INTO student_score VALUES (5, 'Muritadoh', 'Biochemistry', 85);
INSERT INTO student_score VALUES (2, 'Yusuf', 'Biochemistry', 70);
INSERT INTO student_score VALUES (3, 'Habeebah', 'Microbiology', 80);
INSERT INTO student_score VALUES (1, 'Tomiwa', 'Microbiology', 65);
INSERT INTO student_score VALUES (4, 'Gbadebo', 'Computer Science', 80);
INSERT INTO student_score VALUES (12, 'Tolu', 'Computer Science', 67);

select * from student_score ;