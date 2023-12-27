-- windows functions 

-- Aggregation function : sum min max avg count 

select * FROM STUDENT_SCORE ;

select * , (select max(score) from student_score)  as max_score from STUDENT_SCORE ; -- subquery

-- select  window_fun  over(<partition by > <order by > <frames >) from tbl_name 
select  * ,max(score) over()  as max_score from STUDENT_SCORE ;

select  * ,max(score) over()  as max_score  ,
avg(score) over() as avg_score , 
count(student_id ) over() as total_strength 
from STUDENT_SCORE ;


-- partitions  => some group of records  4

use my_prac ;
select *, avg(score) over(partition by dep_name ) as avg_dept_score from student_score  ;

select * from student_score ss
left join ( select dep_name , avg(score) as avg_score_dept  from student_score group by 1 )s 
using(dep_name) ;

select * from employee_data ;

select * , sum(salary) over(partition by  department  ) as dept_avg_sala from employee_data ; 


-- ranking window functions 
-- 1,2,3,4,5,

-- row_number() 


select *, row_number() over(partition by dep_name order by score desc ) from student_score   ; 

-- rank() 
-- dense_rank()
select * , 
row_number() over( order by score desc ) as rn ,
rank() over( order by score desc ) rk , 
dense_rank() over(order by score desc ) as dn_rk  from student_score ;


-- to get the top 1  stutents > score  desc <  from all department 

with cte as (
select * , row_number() over(partition by dep_name order by score desc ) as top_1 from student_score  
)
select * from cte 
where top_1 = 1 ;

-- analytical funtions 
-- first_value() 

select * , first_value(score) over()  from student_score ;





select * from student_score;

select * , first_value(salary) over(partition by  department  ) as first_person_sala from employee_data ; 
select * , last_value(salary) over(partition by  department  ) as last_person_sala from employee_data ; 
select * , nth_value(salary , 2) over(partition by  department  ) as nth_person_sala from employee_data ; 

-- lag  (<exp>,<offset>,<default>)
select * , lag(salary) over(partition by  department  ) as lag_person_sala from employee_data ;

select * , lag(score,2,1000) over() as lag_ from student_score ; 
-- lead  (<exp>,<offset>,<default>)
select * , lead(score) over() as lag_ from student_score ; 


-- frame  default frame :  range between unbounded preceding and current row
select * , avg(salary) over(partition by department order by salary  range between unbounded preceding and current row ) as lag_
 from employee_data ; 
 
 use my_prac ;
 select * , sum(salary) over(partition by department order by salary range between unbounded preceding and current row)  as running_total 
 from employee_data ;
  select * , sum(salary) over(partition by department order by salary)  as running_total  ,
 from employee_data ;
 
 
 create table sales_val 
 (date1 date , sales int) ;
 
 insert into sales_val values 
(date_format('01-01-2023','%d-%c-%Y'),727),
('02-01-2023',734),
('03-01-2023',222),
('04-01-2023',315),
('05-01-2023',912),
('06-01-2023',402),
('07-01-2023',113),
('08-01-2023',832),
('09-01-2023',672),
('10-01-2023',525),
('11-01-2023',254),
('12-01-2023',936),
('13-01-2023',	222) ;

SHOW VARIABLES LIKE "secure_file_priv";

C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_val1.csv'
INTO TABLE sales_val
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

select * from sales_val ;


select * , avg(sales) over(order by date1 asc ) as avg_ ,
sum(sales) over(order by date1 asc ) as sum_running from sales_val ;

select * , avg(sales) over(order by day range between unbounded preceding and current row ) as runn_avg ,
avg(sales) over(order by day range between 4 preceding and current row ) as day5moving_avg  
from sales_val1 ;

select (727+734+222)/3 ; -- 561.0000

create table sales_val1 as (
 select * , day(date1) as day  from sales_val)  ;
 
 
 select * , avg(sales) over(order by day range between current row and unbounded following  ) as runn_avg ,
 avg(sales) over(order by day range between current row and 4 following  ) as 5_runn_avg
from sales_val1 ;

select * from employee_data ;

-- sp 

DELIMITER &&
select * from employee_data ;


DELIMITER &&  
CREATE PROCEDURE get_distinct_dept()  
BEGIN  
    SELECT COUNT(distinct department) AS cnt_dept FROM employee_data ;     
END  &&  
DELIMITER ; 

CALL get_distinct_dept();  

drop procedure  get_distinct_dept ;


select * from employee ;
-- call a sp 
CALL get_distinct_dept();  


-- 3 parameters = > in , out , inout 

-- in parameter
drop procedure get_distinct_dept_in;

DELIMITER &&  
CREATE PROCEDURE get_distinct_dept_in (IN var1 INT )  
BEGIN  
     SELECT distinct department FROM employee_data LIMIT var1;  
END &&  
DELIMITER ;  

CALL get_distinct_dept_in(3);  

delimiter && 
create procedure get_n_highest_sal(in n int )
Begin 
select * from (
select * , row_number() over() as rn  from employee_data ) emp 
where rn = n ;
end &&
delimiter ;

call get_n_highest_sal(2);

DELIMITER &&  
CREATE PROCEDURE get_distinct_dept_in_dept (IN var1 INT, var2 varchar(30) , var3 varchar(2) )  
BEGIN  
     SELECT  * FROM employee_data where department = var2 and gender = var3 LIMIT var1;  
END &&  
DELIMITER ;  
call get_distinct_dept_in_dept(5  , 'tools' , 'f') ;


use imtiaz ;
-- out parameter 
drop PROCEDURE  get_distinct_dept_out;
DELIMITER &&  
CREATE PROCEDURE get_max_salary_out (OUT max_sal int)  
BEGIN  
    SELECT MAX(salary) INTO max_sal FROM employee_data;   
END &&  
DELIMITER ;  

CALL get_max_salary_out(@t); 
select @t;

select * from employee_data where salary = @t ;

DELIMITER &&  
CREATE PROCEDURE get_distinct_dept_out_t ()  
BEGIN  
    SELECT MAX(department) FROM employees;   
END &&  
DELIMITER ;  

call get_distinct_dept_out_t();


set @x = 'abc' ;
select @x;


select @x ;

select * from employees;
-- inout parameter
drop procedure get_distinct_dept_inout;
DELIMITER &&  
CREATE PROCEDURE get_distinct_dept_inout (INOUT var1 INT)  
BEGIN  
    SELECT salary INTO var1 FROM employee_data WHERE employee_id = var1;   
END &&  
DELIMITER ;  

SET @id = 4;  
CALL get_distinct_dept_inout(@id);  
SELECT @id;  

set @ep = '1';
select @ep;
CALL get_distinct_dept_inout(@ep);  
select @ep;

-- user-defined functions 
drop function age_calc;


DELIMITER $$  
CREATE FUNCTION age_calc(birthday date)   
RETURNS VARCHAR(20) DETERMINISTIC  
BEGIN  
    DECLARE age_diff VARCHAR(20);  
    set age_diff = round((datediff(curdate() , birthday) / 365)) ;
    RETURN (age_diff);  
END$$  
DELIMITER ;  

select floor(datediff(curdate() , "1995-01-01")/365);
select age_calc("1995-01-01") ;

call  get_distinct_dept() ;


with cte as (
select first_name ,last_name , department ,hire_date , current_date()
 from employee_data)
select * from cte
where age_calc(hire_date) >= 10;

-- invocation of function and sp 
-- call <sp_name>
-- 
select now();
select get_distinct_dept

 -- trigger => complied code which gets triggered based on a specific event and specific time 
 -- events : update , insert , delete : DML actions 
 -- time : after / before 
 
 
 ;
 drop table emp_log ;
 CREATE TABLE emp_log (  
  emp_id int NOT NULL ,  
  emp_name varchar(15) DEFAULT NULL,  
  designation varchar(35) DEFAULT NULL,  
  salary int DEFAULT NULL,  
  phone varchar(15) DEFAULT NULL,  
  Lastinserted Time

);  
drop table emp_info ;
CREATE TABLE emp_info (  
  emp_id int NOT NULL,  
  emp_name varchar(15) DEFAULT NULL,  
  designation varchar(35) DEFAULT NULL,  
  salary int DEFAULT NULL,  
  phone varchar(15) DEFAULT NULL
);  

insert into emp_info values (6 , "amar_1","director",54000,"15553456789");
insert into emp_info values (5 , "amar_1","director",54000,"15553456789");
 select * from emp_log;
 select * from emp_info;

drop trigger  after_insert_details ;
DELIMITER //  
Create Trigger after_insert_details  
AFTER INSERT ON emp_info FOR EACH ROW  
BEGIN  
INSERT INTO emp_log VALUES (new.emp_id, new.emp_name, new.designation, new.salary, new.phone, CURTIME());  
END //  

DELIMITER //  
Create Trigger after_insert_details_1 
AFTER INSERT ON emp_info FOR EACH ROW  
BEGIN  
INSERT INTO emp_log VALUES (emp_id, emp_name,  designation, salary, phone, CURTIME());  
END //  


insert into emp_info values (27, "amar1","director",540770,"155u3456789") ; 
insert into emp_info values (28, "amar5","director",540970,"155u3956789") ; 

select * from emp_info ;
truncate table emp_log ;
select * from emp_log ;

-- after delete 
CREATE TABLE salaries (  
    emp_num INT PRIMARY KEY,  
    valid_from DATE NOT NULL,  
    amount DEC(8 , 2 ) NOT NULL DEFAULT 0  
);  
truncate table salaries;
select * from salaries ;

INSERT INTO salaries (emp_num, valid_from, amount)  
VALUES  
    (102, '2020-01-10', 45000),  
    (103, '2020-01-10', 65000),  
    (105, '2020-01-10', 55000),  
    (107, '2020-01-10', 70000),  
    (109, '2020-01-10', 40000);  
    
    
    
CREATE TABLE total_salary_budget(  
    total_budget DECIMAL(10,2) NOT NULL  
);  


 INSERT INTO total_salary_budget  
SELECT SUM(amount) FROM salaries;  

select * from total_salary_budget;

DELIMITER $$   
CREATE TRIGGER after_delete_salaries  
AFTER DELETE ON salaries FOR EACH ROW  
BEGIN  
   UPDATE total_salary_budget SET total_budget = total_budget - old.amount;  
END$$   
DELIMITER ;

select * from salaries ; -- 5 
select * from total_salary_budget ; -- 220000.00 165000.00


DELETE FROM salaries WHERE emp_num = 105;  

SELECT * FROM total_salary_budget;  
