--Upload 

-- Step1 run the code 

SHOW VARIABLES LIKE "secure_file_priv";
-- move the file to this location 

-- run the code 

use my_prac;
truncate table employee ;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sample_employee_data.csv'
INTO TABLE employee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


-- still if the issue persists 
-- to run the following code 
GRANT FILE ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;



-- Download 

-- If you want to download a file  
-- Note: file will be download to path configured by  SHOW VARIABLES LIKE "secure_file_priv"; 
SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employee_data.csv'
FIELDS TERMINATED BY ','
FROM employee;

