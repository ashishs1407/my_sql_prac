
-- contraints in sql 
NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly
;

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

insert into Persons values (1 , 'sharma' , 'kapil' , 17 ) ;
insert into Persons values (null , 'sharma' , 'kapil' , 17 ) ;
select * from persons ;

drop table persons ;
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
insert into Persons values (1 , 'sharma' , 'kapil' , 17 ) ;
select * from persons ;
insert into Persons values (2 , 'sharma1' , 'kapil1' , 22 ) ;


drop table persons ;
CREATE TABLE Persons (
    ID int PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
select * from persons;
insert into Persons values (2 , 'sharma1' , 'kapil1' , 22 ) ;
insert into Persons values (1 , 'sharma1' , 'kapil1' , 22 ) ;

insert into Persons values (3 , 'sharma2' , 'kapil2' , 24 ) ;

;
-- mysql
drop table orders ; 
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(ID)
);

insert into orders values (101 , 123 , 3 ) ;
select * from orders ;


drop table persons ;
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18 and id > 0 )
);
insert into Persons values (1 , 'sharma2' , 'kapil2' , 24 ) ;
insert into Persons values (-1 , 'sharma2' , 'kapil2' , 19) ;


drop table Orders ;
drop table Persons ;
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL DEFAULT 'singh' ,
    Middlename varchar (30) , 
    FirstName varchar(255),
    Age int  ,
    country  varchar(255) DEFAULT 'INDIA'
);
select * from persons;
insert into Persons (id ,Middlename, firstname ) value (1 , 'sharma' , 'kapil ' ) ;




-- relationships 
-- one to one : country - capitals (1)
-- one to many : 
-- many to many : 

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

select *, avg(score) over(partition by dep_name ) as avg_dept_score from student_score  ;

select * from student_score ss
left join ( select dep_name , avg(score) as avg_score_dept  from student_score group by 1 )s 
using(dep_name) ;