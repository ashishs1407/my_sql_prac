CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;



CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);





INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');


CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 show tables;
 select * from bonus;
 select * from title;
 select * from worker;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name as <WORKER_NAME>.
select first_name as worker_name from worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
select upper(first_name) as worker_name from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
select distinct department from worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
select left(first_name,3) from worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select instr(first_name,"a") as idx_position from worker where first_name ='Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side
select rtrim(first_name) as first_name from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select ltrim(department) as dept_name from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select distinct department,length(department) as count_of_characters from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a','A') as replaced_str from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME.
--  A space char should separate them.
select concat(first_name,' ',last_name) as full_name from worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name ;  # ascending is by default no need to specify

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name ,department desc;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from the Worker table.
select * from worker where first_name = "Vipul" or first_name = 'Satish';
select * from worker where first_name in ('vipul','satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select * from worker where first_name not in ('vipul','satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department = 'Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’
select * from worker where  first_name like '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where  first_name like '%a';


-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where  first_name like '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from worker where salary between 100000 and 500000 order by salary; # here order by is optional 

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where joining_date like '2014-02%';
 
-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(worker_id) as cnt_of_employee_in_admin from worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select first_name,last_name from worker where salary >= 50000 and salary<= 100000;
select first_name,last_name from worker where salary between 50000 and 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department , count(worker_id) as cnt_of_emp from worker 
group by department;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

select * from worker w join title t on worker_id=worker_ref_id and t.worker_title='Manager';

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select * from worker
group by worker_id 
having count(*)>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
select * from worker;
select * from worker where worker_id%2=1;
-- Q-27. Write an SQL query to show only even rows from a table.
select * from worker where worker_id%2=0;

-- Q-28. Write an SQL query to clone a new table from another table.
create table worker_clone as 
select * from worker;

select * from worker_clone;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.
select w.*,t.* from worker w inner join title t on w.worker_id=t.worker_ref_id;

-- Q-30. Write an SQL query to show records from one table that another table does not have.
select w.*,t.* from worker w left join bonus t on w.worker_id=t.worker_ref_id;


-- Q-31. Write an SQL query to show the current date and time.
select current_timestamp();
select now();

-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by salary desc limit 10;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select distinct salary from worker order by salary desc limit 1 offset 4;
select distinct salary from worker order by salary desc limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
with nth_sal as(
select salary ,row_number() over() n from (
select distinct salary
 from worker order by salary desc ) a )
 select salary from nth_sal where n=5;
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.first_name,w1.salary from worker w1 join worker w2 
on w1.salary=w2.salary and w1.first_name!=w2.first_name;


-- Q-36. Write an SQL query to show the second highest salary from a table.
with nth_sal as(
select salary ,row_number() over() n from (
select distinct salary
 from worker order by salary desc ) a )
 select salary from nth_sal where n=2;

-- Q-37. Write an SQL query to show one row twice in results from a table.
select *,count(worker_ref_id) from bonus
group by worker_ref_id
having count(*)>1;



-- Q-38. Write an SQL query to fetch intersecting records of two tables.
select b.* , t.* from bonus b join title t using(worker_ref_id);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
# in mysql top n percent does not work

select * from worker where worker_id <=(select round(count(worker_id)/2) from worker);


-- Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select department from worker 
group by department 
having count(worker_id)<5;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select distinct department ,count(worker_id) over(partition by department) as no_of_emp
from worker;


-- Q-42. Write an SQL query to show the last record from a table.
select * from worker order by worker_id desc limit 1;

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.
 select * from (select * from worker order by worker_id desc limit 5) x
 order by worker_id;
 
-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select first_name,salary,department from (
select first_name,salary,department ,max(salary) over(partition by department) as highest_paying
from worker) a
where salary=highest_paying;

-- Q-46. Write an SQL query to fetch three max salaries from a table.
select distinct salary from worker order by salary desc limit 3;
 
-- Q-47. Write an SQL query to fetch three min salaries from a table.
select distinct salary from worker order by salary limit 3;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
with nth_sal as(
select salary ,row_number() over() n from (
select distinct salary
 from worker order by salary desc ) a )
 select salary from nth_sal where n=5;     
 


-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select distinct department,(select sum(salary) from worker w2 where w1.department=w2.department) as dept_sal
from worker w1 
group by department
order by salary desc;

select distinct department , sum(salary) over(partition by department ) as dept_sal
from worker;
-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name,last_name,salary from worker 
where salary =(select max(salary) from worker);
