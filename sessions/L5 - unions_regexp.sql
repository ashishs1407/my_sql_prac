;
 use my_prac ;
 select * from employee_data ;
 
 select mod(4,2) ; -- eveevn 
 
 (
 select 'even' as total ,count(region_id) , 'ajay' as first_name   from employee_data 
 where mod(region_id ,2 ) = 0  )
 union all 
  (
  select 'odd'  as total ,count(region_id) , 43536 as mob_no   from employee_data 
 where mod(region_id ,2 ) <> 0  ) ;
 
 -- union all => follow the squence of while union all 
 
 
 
 -- query 1  => 10columns 
 union all 
 -- query 2 => 10 columns
 
 
 
 
 
select *  from employee_data 
 where  region_id % 2  = 0 
 ;
 select count( distinct department) from   employee_data; => count distinct 
 select count(department) from employee_data ; ==> all total value 
 
  select count(department)  - count( distinct department) from employee_data;
use my_prac ;
select * from employee where first_name REGEXP 'or|Av';


--  function | operators | joins 

-- union   => sandwiching the data  | constraint => diffrent len columns  -- removes duplicates 
-- union all
(select * from emp where mgr = 7688 ) -- q1 1  8 columns
union all 
(select * from employee where gender = 'M') ; -- 12 q2 9 columns 

-- regex patterns 

-- details of employees if there name starts with "AV"
-- '<char>%'  -- '<^ char>'
select * from employee 
where first_name like 'AV%' ;

select * from employee
where first_name regexp '^Av' ; 

-- details of employees if there name end with "ra"
-- <%char> 'char$'
select * from employee 
where first_name like '%ra' ;

select * from employee 
where first_name regexp 'ra$' ;

-- details of employees if there name contains with "th"
-- <%char%> <'char'> 
select * from employee 
where first_name like '%th%' ;

select * from employee 
where first_name regexp 'th' ;

-- list the details of employee if name starts with 'a' or 's' or 't' ;
select * from employee 
where first_name like 'a%' or first_name  like 's%'   or first_name like 't%' ; -- 16 records 

-- regxp  
-- ^a ^s ^t

select * from employee 
where first_name regexp '^a' or first_name  regexp '^s'   or first_name regexp '^t' ;

select * from employee 
where first_name regexp '^[ast]' ;

  -- regexp  '^[ast]' ;

-- list the details of employee if name not  starts with 'a' or 's' or 't' ;
select * from employee 
where first_name not like 'a%' and first_name  not like 's%'   and  first_name not like 't%' ;

-- regexp 
select * from employee 
where first_name not  regexp '^[ast]' ; 

select * from employee 
where first_name  regexp '^[^a]' ;  

select * from employee 
where first_name  regexp '^[^ast]' ;    

-- list the details of employee if name ends with 'a' or 's' or 't' ;
select * from employee where first_name not like 'a%' or 's%' or 't%';

select * from employee
where first_name regexp '[ast]$' ; 

select * from employee where first_name  like '%a' or  first_name  like '%s' or  first_name  like '%t'; 

-- list the details of employee if name not  ends with 'a' or 's' or 't' ;
select * from employee
where first_name regexp '[ast]$' ; 

select * from employee
where first_name regexp '[^ast]$' ;  

-- list the employees if name contains  has Av or rd ; 
select * from employee 
where first_name like '%Av%'  or first_name like '%rd%' ;

select * from employee 
where first_name regexp 'Av'  or first_name regexp 'rd' ;

select * from employee 
where first_name regexp 'Av|rd|f' ;


select email from employee 
where email  regexp '[0-9]'   

;
select * from employee ;

-- pincode varchar(6) 
-- '123456' 
-- '12345e'

select salary  from employee 
where salary  regexp '[a-z]'  ;

-- 
select * from employee ;



create table test  (email varchar(50) ) ;
insert into test values ('test@gmail$com' ),( 'test1@gamil.com') , ('test3!@gmail.com') ;

select * from test ;

select email from test 
where email regexp '!$' ;







