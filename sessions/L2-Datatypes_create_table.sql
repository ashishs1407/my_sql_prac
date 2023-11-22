-- 
-- create table <table_name> 
-- (<col1> dt , <col2> dt , ... ) ;
USE my_prac ; 
CREATE TABLE student 
(
name varchar(15) , 
roll_no int ,
class int ,
division varchar(5) ) ;

select * from student ;


-- practice question 
-- create a table order table 
-- 5 field / column / attriute
 
-- insert values to the table 
INSERT INTO employees (emp_id, emp_name, emp_salary) VALUES (1, 'John Doe', 50000);

insert into student (name , roll_no , class , division ) values ('Ajay' , 1 , 12 , 'A') ;
insert into student (name , roll_no , class , division ) values ('Sanjay' , 2 , 12 , 'A') ;
insert into student (name , roll_no , class , division ) values ('Amit' , 3 , 12 , 'B') ;

select * from student ;
insert into student  values ('Ajay1' , 4 , 12 , 'A') ;
insert into student  values ('Sanjay1' , 5 , 12 , 'A') ;
insert into student  values ('Amit1' , 6 , 12 , 'B') ;

insert into student ( roll_no , name , class , division ) values (  7 ,'Raj', 12 , 'B') ;
insert into student  values ('Ram',8, 13 , 'B') ;
insert into student values ('Ram1',9, 13 , 'B') , ('Ram2',10, 14 , 'B') ,('Ram3',11, 13 , 'B') ;
insert into student  values ('Ram',8, 13 , 'abcdefg') ;
select * from student;

-- practice order 
-- 5 field 
-- 5 records 


CREATE TABLE Mobile 
(
Brand varchar(15) , 
product_name varchar(15) ,
price decimal(15,2) ,
sepcs text  ,
launch_date  date ,
instore_time  datetime ) 
;

insert into mobile 
values ('Apple' , 'iphone 14' , 1500.99 , 
' Super Retina XDR display
15.40 cm / 6.1″ (diagonal) all‑screen OLED display
2532x1170-pixel resolution at 460 ppi
The iPhone 14 display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 15.40 centimetres (6.06″) diagonally (actual viewable area is less).'
, '2013-01-01' , '2013-01-01' ) ;

insert into mobile 
values ('Samsung' , 'Galaxy' , 1501.99 , 
' diagonally (actual viewable area is less).'
, '2013-01-01' , '2013-01-01 03:05:45' ) ;

 
create table my_prac.calender 
(fiscal_year year ,
fis_year int ) ; 

use my_prac ;

select * from calender ;
insert into calender value ( 2015 , 2015 );
insert into calender value ( 4500 , 2015 ); -- error 
insert into calender value ( 2016 , 5000 ); 


insert into calender value ( 2015 , 2045 ); -- int 
insert into calender value ( 2015 , '2015' ); -- string =>  ''
insert into calender value ( 2015 , 'tewnty twenty five' ); 

--- datatype casting 
-- implicit 
-- explicit  

-- cast fun. 
SELECT CAST(150 AS CHAR);

SELECT CAST(5-10 AS SIGNED);


select 10 + cast('a4' as char)  ;
select 10 + 'a4'  ; -- implicit 

select cast('2023-01-01'  as date) ;