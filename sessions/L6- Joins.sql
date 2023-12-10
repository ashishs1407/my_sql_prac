--  joins 
select * from sales ;
select * from menu ;
select * from members ;

-- how many order indiviual  member placed ??

select   customer_id , order_date , s.product_id , product_name , price 
from sales  as s
join  menu as m
on s.product_id = m.product_id 
where s.customer_id = 'A' and s.order_date = '2021-01-11'
 ; 
 
  --- left join 
select   customer_id , order_date , s.product_id , product_name , price 
from sales  as s
left join  menu as m
on s.product_id = m.product_id 
 ; 
INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15')
  ;
  
  
  -- right join 

select * from menu ;
select   customer_id , order_date , s.product_id , product_name , price 
from sales  as s
left join  menu as m
on s.product_id = m.product_id ;
;
use my_prac ;
select   customer_id , order_date , s.product_id , product_name , price 
from menu as m
right join   sales  as s
on s.product_id = m.product_id 
 ; 
 
 create table A (id int,rates int);
insert into A values(1,10),(2,20),(3,30);
select * from A;

create table B (id int,rates int);
insert into B values(5,10),(6,15),(2,20),(2,20);
select * from B;


select * 
from A left join B 
on A.id = B.id ;

select * 
from A right join B 
on A.id = B.id 
where a.id is null ;

use my_prac ;
-- self join => table joined with the same table 
select * 
from A  as a1 
join A  as a2 
 on a1.id = a2.id  ;