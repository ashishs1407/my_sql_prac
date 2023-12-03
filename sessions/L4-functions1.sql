use my_prac;
create table Dept (Dept_No int,Dname varchar(50),Loc varchar(50));
insert into Dept values(10,"accounting","Newyork"),(20,"Research","Dallas"),(30,"sales","chicago"),(40,"operation","boston");

select * from dept;

create table Emp (Emp_No int,Ename Varchar(50),Job varchar(50),Mgr int,Hiredate date, Sal int,comm int,Deptno int);
insert into Emp values (7499,"Allen","salesman",7688,"1981-02-20",1600,300,30),
                        (7521,"ward","salesman",7698,"1981-02-22",1250,500,30),
                        (7566,"Jones","Manager",7839,"1981-04-02",2950,Null,20),
                        (7654,"Martin","Salesman",7698,"1981-09-28",1250,1400,30),
                        (7698,"Blake","Manager",7839,"1981-05-01",2850,Null,30),
                        (7782,"Clark","Manager",7839,"1981-09-06",2450,Null,10),
                        (7788,"Scott","Analyst",7566,"1981-12-09",3000,Null,20),
                        (7839,"king","President",Null,"1981-11-17",5000,Null,10),
                        (7844,"Turner","Salesman",7698,"1981-09-08",1500,0,30),
                        (7876,"Adams","Clerk",7788,"1983-01-12",1100,Null,20),
                        (7900,"James","Clerk",7698,"1981-12-03",950,Null,30),
                        (7802,"Ford","Analyst",7566,"1981-01-03",3000,Null,20),
                        (7934,"Miller","Clerk",7782,"1982-01-23",1300,Null,10);
                        
select * from emp;



-- Q1) Display unique jobs from employee table

 -- Q2) list the employees in desc order of their salary?

-- Q3) list the employees who joined before 1981 ?

--  Q4) calculate employees daily salary ?


-- Q5) total number of employees in each department


select length('Allen') ;

select * from emp
where length(ename) = 5 ;

-- in operator 

select * from emp 
where mgr = 7698 or mgr = 7839  or mgr = 7566  ;

select * from emp 
where mgr not  in (7698 ,7839,7566 ) ;



SELECT DATE_FORMAT("2017-06-15", "%W %M %e %Y");


-- Function :=> 
-- 1) i/p => o/p
-- 2) predefined | user defined funtion 
-- 3)  perform operation 
-- select <> fun. 
--  def fun : script 10 code 
-- abstract the logic :=> 
-- 2) predefined / inbuilt functions  | user defined funtion 
-- 
select length('mysql') ;

/*
 functions in sql => performs the task ,  predefined formulas or codes , 
 wildcard operators 
 */
 -- fun -> parameterized , non-parameterizedc, => return a values
 -- scaler functions => min() , max() , avg() , sum() 
 -- string functions => upper() , lower() , sub_strings() , concat() ....
 -- date functions   => current_date() , now() , today() , date_diff() ....
 -- integer functions => sum() , avg() , min() ,
 
 -- parameterized :=> which needs input while invoking a function 
 -- non-parameterized :=> which does not require  input while invoking a function
 
 select now() ;
 select database();
 select length('samplestring');
 
 -- string : varchar / text  => 
 -- number : int / deci =>
 -- datetime : date / datetime =>
 
 
 -- string function : 
 -- upper() , lower() 
 select upper('samplestring');
 select lower('SAMPLESTRING') ;
 select length('SAMPLESTRING') ;
 select concat('sample','string');
 
 select * from emp ;
 select emp_no , ename , upper(job) as job , mgr , hiredate , sal , comm , deptno 
 from emp ;
 
 -- f_name , l_name  => full_name 

select * from employee ;

select employee_id , concat(first_name ,' ', last_name) as full_name  , email , hire_date , department , gender , salary , region_id 
from employee ;

select concat('e_',employee_id) as emp_id  , concat(first_name ,' ', last_name) as full_name  , email , hire_date , department , gender , salary , region_id 
from employee ;
-- e_1 ,e_2 


select employee_id , concat(first_name ,' ', last_name) as full_name  , email , hire_date ,
 left(department,3) as dept  , gender , salary , region_id 
from employee ;

select employee_id , concat(first_name ,' ', last_name) as full_name  , email , hire_date ,
 department , right(department,3) as dept  , gender , salary , region_id 
from employee ;


select ltrim('    mysql') ;

select rtrim("coding ") ;

select trim(' coding ') ;

select * from employee;
select left(first_name,3) , first_name , right(first_name,3)  from employee ;

select first_name from employee ;
-- "Berrie" => "B""err" => "err"
select right(left("Berrie",4) , 3)  ; 

select first_name , right(left(first_name,4) , 3) as char3_from_1st    from employee; 

select left(right("mysql",3),2);


-- select substring("Berrie",< from where to start > , <number of characters>)
select substring(first_name,2,3) , first_name from employee ; select right(left("Berrie",4) , 3)  ;
select substring(first_name,-3,2)  , first_name from employee ; -- sq

select * from employee;

-- proper / title 
-- Cllll 

select * from emp ;
select proper(first_name) from employee ;

select distinct job from emp ;


-- 

select concat(upper(substring("shubham",1,1))   ,    lower(substring("shubham",2)))  ;
-- upper lower concat substring 

select * from employee;

-- email   <host_name>@<domain_name>

select substring_index('test@gmail.com' ,'@',1) ;
select substring_index('test@gmail.com' ,'@',-1) ;

select 



select substring("mysql",-3,2)   ;

select employee_id , concat(first_name ,' ', last_name) as full_name  , email ,substring_index(email,'@',-1) as domain_name, hire_date ,
 department , right(department,3) as dept  , gender , salary , region_id 
from employee ;

select substring_index(email,'.',-2) , email from employee ; 

select substring_index(email,'@',-1) as domain_name , count(*) as cnt  from employee 
group by 1
order by cnt desc;

select upper(email) from employee ;
select count(email) from employee ;

-- Numbers | integers 
-- Aggregator function : scaler function : single record 
-- sum() , min() ,max() , count()

select max(salary)  from employee ;
select min(salary)  from employee ;
select sum(salary) from employee ;
select avg(salary) from employee ;
select count(salary) from employee; 

select * from emp ;
select count(emp_no) as cnt from emp ;
select count(comm) as cnt from emp ;