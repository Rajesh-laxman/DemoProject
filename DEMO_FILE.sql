/*1.% mysql -u root -p  2.   L9k%DiX,Xh-,6mj 
TERMINAL % mysql -u root -p 
L9k%DiX,Xh-,6mj */
#------------------------------------------------TUTUORIAL-1 START--------------------------------------------------------------#
#CREATE ALTER DROP 	 [DATABASE & TABLES]:

#DATABASE KEYWORDS:
SHOW DATABASES;
CREATE DATABASE DEMO;
DROP DATABASE DEMO;
#ALTER DATABASE STUDENTS MODIFY NAME = STUDENT_DB;  #MODIFY DATABES NAME IS NOT AVAILABLE IN MYSQL
USE DEMO;

#TABLE KEYWORDS:
SHOW TABLES;
CREATE TABLE STUDENT(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(25) NOT NULL,
CITY VARCHAR(20)
);
CREATE TABLE STUDENT_TEMP(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(25) NOT NULL,
CITY VARCHAR(20)
);


DESCRIBE STUDENT;
DROP TABLE STUDENT;
ALTER TABLE STUDENT ADD  AGE INT NOT NULL;
ALTER TABLE STUDENT ADD  GENDER VARCHAR(50) NOT NULL DEFAULT 'NO NEED' AFTER CITY;   #PUT COMMA AND "ADD NEXT COLUMN"
ALTER TABLE STUDENT MODIFY CITY VARCHAR(15) NOT NULL;
ALTER TABLE STUDENT_TEMP DROP CITY;
SELECT * FROM STUDENT_TEMP;
ALTER TABLE STUDENT_TEMP RENAME TO DUMMY_TABLE;

#INSERT:
INSERT INTO STUDENT (NAME,CITY,AGE) VALUES ('RAJESH','MARKET',25);
INSERT INTO STUDENT VALUES (NULL,'PAUL','NGO',28);
INSERT INTO STUDENT VALUES (NULL,'ESAI','STH_BZR',26),(NULL,'NARI','SHT_NGR',24),(NULL,'IYAM','SENTHIL_NGR',26);

#UPDATE & DELETE:
UPDATE STUDENT SET CITY ='SHANTHI_NAGAR' WHERE ID=4;
DELETE FROM STUDENT WHERE ID =5;

#SELECT:
SELECT * FROM STUDENT;
SELECT ID,NAME FROM STUDENT;
SELECT *  FROM STUDENT WHERE AGE>25;
SELECT * FROM STUDENT WHERE AGE >25 AND NAME LIKE '%AI%';
SELECT * FROM STUDENT WHERE ID<3 OR AGE >25;
SELECT * FROM STUDENT WHERE AGE > (SELECT AVG(AGE) FROM  STUDENT);  #SELECT STUDENT LIST WHICH IS "ABOVE AVERAGE OF AGE"
SELECT * FROM STUDENT WHERE AGE<>26;  #NOT OPERATOR
SELECT * FROM STUDENT WHERE AGE!=26;  #NOT OPERATOR

SELECT NAME+'-'+CITY AS NICKS FROM STUDENT; # [WRONG:I THINK FOR CONCAT IT SHOULD BE IN TEXT DATA TYPE FROMAT] use CONCAT(NAME,'-',CITY)

SELECT * FROM STUDENT WHERE NAME LIKE '_AJ%';
SELECT * FROM STUDENT WHERE NAME NOT LIKE '_AJ%';
SELECT * FROM PERSONAL_INFO WHERE NAME LIKE "[SMG]U%";#NOT WORKING IN MYSQL

SELECT * FROM STUDENT WHERE AGE BETWEEN 26 AND 28;
SELECT * FROM STUDENT WHERE AGE NOT BETWEEN 26 AND 28;

SELECT * FROM STUDENT WHERE AGE IN (28,29,26);#MULTIPLE OR
SELECT * FROM STUDENT WHERE AGE NOT IN (28,29,26);

SELECT * FROM STUDENT LIMIT 2;
SELECT * FROM STUDENT LIMIT 2,3;
SELECT * FROM STUDENT LIMIT 0,1;
SELECT * FROM STUDENT ORDER BY ID DESC LIMIT 0,1;
#SELECT TOP 10 * FROM STUDENT;            #NOT IN MYSQL
#SELECT TOP 10 PERCENT * FROM STUDENT;    #NOT IN MYSQL


SELECT AGE,COUNT(ID) AS TOTAL FROM STUDENT GROUP BY AGE;
SELECT AGE,COUNT(ID) AS TOTAL FROM STUDENT GROUP BY AGE HAVING TOTAL>1;

SELECT AGE FROM STUDENT ORDER BY AGE;
SELECT DISTINCT AGE FROM STUDENT ORDER BY AGE;
SELECT COUNT(DISTINCT AGE ) AS TOTAL_AGE_COUNT FROM STUDENT ORDER BY AGE; #need to check no need for oreder by age here#

SELECT SUM(AGE) FROM STUDENT;
SELECT MAX(AGE) FROM STUDENT;
SELECT MIN(AGE) FROM STUDENT;
SELECT AVG(AGE) FROM STUDENT;
SELECT ROUND(AVG(AGE) )FROM STUDENT;
SELECT ROUND(AVG(AGE) ,2)FROM STUDENT;

TRUNCATE TABLE STUDENT;

#TUTOR JOES EXAMPLE:
CREATE TABLE PERSONAL_INFO(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
GENDER VARCHAR(50) NOT NULL,
CITY VARCHAR(50) NOT NULL,
CONTACT_NO VARCHAR(25)
);
INSERT INTO PERSONAL_INFO (NAME,GENDER,CITY,CONTACT_NO)VALUES("MUTHU","MALE","NAMAKKAL","9045798847"),
("KUMAR","MALE","NAMAKKAL","9080475847"),
("VISH","MALE","AANDRA","9080849747"),
("PONRAJ","MALE","SIVAKASSI","9760898847"),
("DARSHU","FEMALE","PDKT","9956898847"),
("SUJI","FEMALE","SIVAKASI","8980898847")
;
SELECT * FROM PERSONAL_INFO;

CREATE TABLE ATTENDANCE (
AID INT NOT NULL AUTO_INCREMENT,
ID INT NOT NULL,
ADATE DATE NOT NULL,
ASTATUS VARCHAR (10) NOT NULL,
PRIMARY KEY(AID)
) ;
INSERT INTO ATTENDANCE (ID,ADATE,ASTATUS) VALUES (1,'2024-01-01',"P"),(1,'2024-01-02',"P"),(1,'2024-01-03',"A"),(1,'2024-01-04',"P"),
(2,'2024-01-01',"P"),(2,'2024-01-02',"A"),(2,'2024-01-03',"P"),(2,'2024-01-04',"P"),
(3,'2024-01-01',"P"),(3,'2024-01-02',"P"),(3,'2024-01-03',"P"),(3,'2024-01-04',"P"),
(5,'2024-01-01',"P"),(5,'2024-01-02',"P"),(5,'2024-01-03',"A"),(5,'2024-01-04',"P"),
(6,'2024-01-01',"A"),(6,'2024-01-02',"A"),(6,'2024-01-03',"P"),(6,'2024-01-04',"P"),
(7,'2024-01-01',"P"),(7,'2024-01-02',"P"),(7,'2024-01-03',"P"),(7,'2024-01-04',"P"),
(8,'2024-01-01',"A"),(8,'2024-01-02',"A"),(8,'2024-01-03',"A"),(8,'2024-01-04',"A"),
(9,'2024-01-01',"P"),(9,'2024-01-02',"P"),(9,'2024-01-03',"P"),(9,'2024-01-04',"A");
SELECT * FROM ATTENDANCE;
SELECT * FROM ATTENDANCE WHERE ID=3;
SELECT DISTINCT ID FROM ATTENDANCE;

SELECT ID,COUNT(IF(ASTATUS='P',1,NULL)) AS PRESENTED_COUNT FROM ATTENDANCE GROUP BY ID;
SELECT ID,COUNT(IF(ASTATUS='F',1,NULL)) AS NOT_PRESENTED_COUNT FROM ATTENDANCE GROUP BY ID;

#JOIN QUERY:
CREATE TABLE EMP (
ID INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, NAME VARCHAR(45) NOT NULL, DESIGN VARCHAR (45) NOT NULL, DOJ DATE NOT NULL, PRIMARY KEY (ID)
);
INSERT INTO EMP (NAME, DESIGN, DOJ) VALUES
('RAM', 'MANAGER', '2018-09-10'),
('SAM', 'HR', '2018-09-10'),
('TOM', 'AMC', '2018-09-11'),
('RAVI', 'SALES','2018-09-23'),
('KUMAR', 'SALES', '2018-10-02')
;
SELECT * FROM EMP;

CREATE TABLE SALARY (
SID INT NOT NULL AUTO_INCREMENT,
ID INT NOT NULL,
SDATE DATE NOT NULL,
AMT INT NOT NULL,
PRIMARY KEY(SID));
INSERT INTO SALARY (ID,SDATE, AMT) VALUES
(1, '2018-09-01',10000),
(2, '2018-09-01',7500),
(3, '2018-09-01',6000),
(4, '2018-09-01' ,4000),
(6, '2017-08-01' ,2000)
;
SELECT * FROM SALARY; 
 
SELECT E.ID,E.NAME,E.DESIGN,S.SDATE,S.AMT  FROM EMP E INNER JOIN SALARY S ON E.ID=S.ID;
SELECT E.ID,E.NAME,E.DESIGN,S.SDATE,S.AMT  FROM EMP E LEFT JOIN SALARY S ON E.ID=S.ID;
SELECT S.ID,E.NAME,E.DESIGN,S.SDATE,S.AMT  FROM EMP E RIGHT JOIN SALARY S ON E.ID=S.ID;

#CASE WHEN THEN END:
SELECT * FROM STUDENT;
SELECT NAME,(CASE 
WHEN AGE<=25 THEN 'YOUNG BOY'
WHEN AGE > 25 THEN 'OLD BOY'
ELSE 'NOTHING'
END) AS YOUNGER_OR_OLDER FROM STUDENT;

#------------------------------------------------TUTUORIAL-1 END--------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------------------------------------#
#CHAT GBT JOIN WITH GROUP BY EXAMPLE CODE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO orders VALUES (1, 'John Doe', '2024-01-10');
INSERT INTO orders VALUES (2, 'Jane Smith', '2024-01-11');

INSERT INTO order_items VALUES (101, 1, 'Product A', 2, 10.00);
INSERT INTO order_items VALUES (102, 1, 'Product B', 1, 15.00);
INSERT INTO order_items VALUES (103, 2, 'Product A', 3, 10.00);
INSERT INTO order_items VALUES (104, 2, 'Product C', 2, 20.00);

select *  FROM orders;
select *  FROM order_items;

SELECT
    orders.order_id,
    orders.customer_name,
    orders.order_date,
    SUM(order_items.quantity) AS total_quantity,
    SUM(order_items.quantity * order_items.price) AS total_price
FROM
    orders
JOIN      # JOIN == INNER JOIN
    order_items ON orders.order_id = order_items.order_id
GROUP BY
    orders.order_id, orders.customer_name, orders.order_date;
/*group the results by orders.order_id, orders.customer_name, and orders.order_date.
This means that each unique combination of these three fields will be treated as a separate group, and the aggregation functions (SUM) will be calculated for each group separately.
*/
SELECT
    orders.order_id,
    orders.customer_name,
    orders.order_date,
    SUM(order_items.quantity) AS total_quantity,
    SUM(order_items.quantity * order_items.price) AS total_price
FROM
    orders
JOIN
    order_items ON orders.order_id = order_items.order_id
GROUP BY
    orders.order_id;
/*This query only groups the results by orders.order_id.
As a result, the aggregation functions (SUM) will be calculated only for each unique order_id, regardless of the customer_name or order_date.*/
#SUMMARY:
/*In summary, the first  query provide more detailed grouping by including customer_name and order_date, while the last query groups the results at a higher level, considering only the order_id.*/
#-----------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------------TUTUORIAL-2 START--------------------------------------------------------------#
CREATE TABLE STUDENT_2(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(25) NOT NULL,
AGE INT NOT NULL,
CITY VARCHAR(20),
ROLL_NO INT NOT NULL,
CID INT NOT NULL
);
INSERT INTO STUDENT_2 VALUES (NULL,'RAJESH',25,'MARKET',5046,2),(NULL,'PAUL',28,'NGO',5034,1),(NULL,'ESAI',26,'STH_BZR',5018,3),
(NULL,'NARI',24,'SHT_NGR',5032,1),(NULL,'IYAM',26,'SENTHIL_NGR',5015,2);

CREATE TABLE COURSE(CID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,CNAME VARCHAR(50) NOT NULL);
INSERT INTO  COURSE VALUES(NULL,'BCA'),(NULL,'MCA'),(NULL,'MBA');

CREATE TABLE MARKS(MID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,ID INT NOT NULL,M1 INT NOT NULL, M2 INT NOT NULL, M3 INT NOT NULL);
INSERT INTO MARKS VALUES (NULL,1,85,95,99),(NULL,2,89,75,79),(NULL,3,85,85,89),(NULL,4,75,65,80),(NULL,5,70,78,81);

SELECT * FROM STUDENT_2;
SELECT * FROM COURSE;
SELECT * FROM MARKS;

#USING TWO INNER JOINS
SELECT STUDENT_2.NAME,STUDENT_2.ROLL_NO,COURSE.CNAME,MARKS.M1,MARKS.M2,MARKS.M3 FROM STUDENT_2 
INNER JOIN COURSE ON  STUDENT_2.CID = COURSE.CID 
INNER JOIN MARKS  ON  STUDENT_2.ID  = MARKS.ID;

#TOTAL,AVG,RESULT,GRADE
SELECT STUDENT_2.NAME,STUDENT_2.ROLL_NO,COURSE.CNAME,MARKS.M1,MARKS.M2,MARKS.M3,(MARKS.M1+MARKS.M2+MARKS.M3) AS TOTAL,
ROUND((MARKS.M1+MARKS.M2+MARKS.M3)/3,2) AS AVERAGE , (CASE 
WHEN MARKS.M1>=35 AND MARKS.M2>= 35 AND MARKS.M3>=35 THEN 'PASS'
ELSE 'FAIL'
END) AS RESULT ,(CASE 
WHEN MARKS.M1>=85 AND MARKS.M2>= 85 AND MARKS.M3>=85 THEN 'O'
WHEN MARKS.M1>=55 AND MARKS.M2>= 55 AND MARKS.M3>=55 THEN 'A'
ELSE 'B'
END) AS GRADE FROM STUDENT_2 
INNER JOIN COURSE ON  STUDENT_2.CID = COURSE.CID 
INNER JOIN MARKS  ON  STUDENT_2.ID  = MARKS.ID;

UPDATE MARKS SET M3 = 34 WHERE MID = 2;

#FAIL
SELECT STUDENT_2.NAME,STUDENT_2.ROLL_NO,COURSE.CNAME,MARKS.M1,MARKS.M2,MARKS.M3,(MARKS.M1+MARKS.M2+MARKS.M3) AS TOTAL,
ROUND((MARKS.M1+MARKS.M2+MARKS.M3)/3,2) AS AVERAGE , (CASE 
WHEN MARKS.M1>=35 AND MARKS.M2>= 35 AND MARKS.M3>=35 THEN 'PASS'
ELSE 'FAIL'
END) AS RESULT ,(CASE 
WHEN MARKS.M1>=85 AND MARKS.M2>= 85 AND MARKS.M3>=85 THEN 'O'
WHEN MARKS.M1>=55 AND MARKS.M2>= 55 AND MARKS.M3>=55 THEN 'A'
ELSE 'B'
END) AS GRADE FROM STUDENT_2 
INNER JOIN COURSE ON  STUDENT_2.CID = COURSE.CID 
INNER JOIN MARKS  ON  STUDENT_2.ID  = MARKS.ID HAVING RESULT ='FAIL';

#PASS
SELECT STUDENT_2.NAME,STUDENT_2.ROLL_NO,COURSE.CNAME,MARKS.M1,MARKS.M2,MARKS.M3,(MARKS.M1+MARKS.M2+MARKS.M3) AS TOTAL,
ROUND((MARKS.M1+MARKS.M2+MARKS.M3)/3,2) AS AVERAGE , (CASE 
WHEN MARKS.M1>=35 AND MARKS.M2>= 35 AND MARKS.M3>=35 THEN 'PASS'
ELSE 'FAIL'
END) AS RESULT ,(CASE 
WHEN MARKS.M1>=85 AND MARKS.M2>= 85 AND MARKS.M3>=85 THEN 'O'
WHEN MARKS.M1>=55 AND MARKS.M2>= 55 AND MARKS.M3>=55 THEN 'A'
ELSE 'B'
END) AS GRADE FROM STUDENT_2 
INNER JOIN COURSE ON  STUDENT_2.CID = COURSE.CID 
INNER JOIN MARKS  ON  STUDENT_2.ID  = MARKS.ID HAVING RESULT ='PASS';

#PASS & AGE >25
SELECT STUDENT_2.NAME,STUDENT_2.ROLL_NO,COURSE.CNAME,MARKS.M1,MARKS.M2,MARKS.M3,(MARKS.M1+MARKS.M2+MARKS.M3) AS TOTAL,
ROUND((MARKS.M1+MARKS.M2+MARKS.M3)/3,2) AS AVERAGE , (CASE 
WHEN MARKS.M1>=35 AND MARKS.M2>= 35 AND MARKS.M3>=35 THEN 'PASS'
ELSE 'FAIL'
END) AS RESULT ,(CASE 
WHEN MARKS.M1>=85 AND MARKS.M2>= 85 AND MARKS.M3>=85 THEN 'O'
WHEN MARKS.M1>=55 AND MARKS.M2>= 55 AND MARKS.M3>=55 THEN 'A'
ELSE 'B'
END) AS GRADE FROM STUDENT_2 
INNER JOIN COURSE ON  STUDENT_2.CID = COURSE.CID 
INNER JOIN MARKS  ON  STUDENT_2.ID  = MARKS.ID WHERE STUDENT_2.AGE >25 HAVING RESULT ='PASS'AND GRADE='O';

#VIEW
CREATE VIEW VIEW_TABLE_STUDENT AS
SELECT STUDENT_2.NAME,STUDENT_2.ROLL_NO,COURSE.CNAME,MARKS.M1,MARKS.M2,MARKS.M3,(MARKS.M1+MARKS.M2+MARKS.M3) AS TOTAL,
ROUND((MARKS.M1+MARKS.M2+MARKS.M3)/3,2) AS AVERAGE , (CASE 
WHEN MARKS.M1>=35 AND MARKS.M2>= 35 AND MARKS.M3>=35 THEN 'PASS'
ELSE 'FAIL'
END) AS RESULT ,(CASE 
WHEN MARKS.M1>=85 AND MARKS.M2>= 85 AND MARKS.M3>=85 THEN 'O'
WHEN MARKS.M1>=55 AND MARKS.M2>= 55 AND MARKS.M3>=55 THEN 'A'
ELSE 'B'
END) AS GRADE FROM STUDENT_2 
INNER JOIN COURSE ON  STUDENT_2.CID = COURSE.CID 
INNER JOIN MARKS  ON  STUDENT_2.ID  = MARKS.ID ;

DROP VIEW VIEW_TABLE_STUDENT;
SHOW TABLES;
SHOW FULL TABLES;

SELECT * FROM VIEW_TABLE_STUDENT;
SELECT * FROM VIEW_TABLE_STUDENT WHERE RESULT ='PASS'; # HERE RESULT IS NOT AN AGGREGATE TYPE 

#INNER JOIN IN UPDATE QUERY
SELECT * FROM STUDENT_2;
SELECT * FROM COURSE;
SELECT * FROM MARKS;
UPDATE STUDENT_2 INNER JOIN MARKS ON  STUDENT_2.ID=MARKS.ID  SET M1=100,M2=98,M3=100  WHERE STUDENT_2.ROLL_NO=5046;

#TRIGGER
CREATE TABLE BACKUP_TABLE (ID INT PRIMARY KEY AUTO_INCREMENT,M1_OLD INT NOT NULL,M1_NEW INT NOT NULL );
/*
CREATE TRIGGER TRIGGER_NAME TRIGGER_TIME[BEFORE/AFTER/INSTEAD OF]  TRIGGER_EVENT[INSERT/UPDATE/DELETE] ON TABLE_NAME
FOR EACH ROW BEGIN {ACTUAL QUERY ON THE NEW TABLE;} END
DELIMITER[$$]
*/

/* RUN IN MYSQL TERMINAL *//*
DELIMITER $$
CREATE TRIGGER MARKS_BACKUP_TRG
BEFORE UPDATE 
ON MARKS
FOR EACH ROW 
BEGIN
INSERT INTO BACKUP_TABLE (M1_OLD,M1_NEW) VALUES (OLD.M1,NEW.M1);
END
$$  
DELIMITETR ;*/

/*BEFORE Triggers: These triggers fire before the execution of the INSERT, UPDATE, or DELETE operation. 
You can use them to modify the values being inserted, updated, or deleted.
INSTEAD OF Triggers: These triggers are specific to views and are used to perform custom actions 
instead of the default action when the view is manipulated (e.g., inserting, updating, or deleting rows).
*/

SELECT * FROM MARKS;
SELECT * FROM BACKUP_TABLE;
UPDATE MARKS SET M1 = 97 WHERE MID = 1;

DROP TRIGGER MARKS_BACKUP_TRG;
#------------------------------------------------TUTUORIAL-2 END----------------------------------------------------------------#
#------------------------------------------------SQL_NOTES START----------------------------------------------------------------#
#PRIMARY KEY
CREATE TABLE DEMO_TABLE_1(ID INT NOT NULL,NAME TEXT NOT NULL,
PRIMARY KEY(ID,NAME(10))); # WE CAN GIVE MORE THAN ONE COLUMN INSIDE PRIMARY KEY BUT WE CAN USE PRIMARY KEYWORD ONLY ONE TIME IN THE QUERY
                           # WHEN WE PASS TEXT AS PRIMARY KEY WE SHOULD SPECIFY THE KEY LENGTH [ NAME(10)]
DROP TABLE EMP_RL;
SELECT * FROM DEMO_TABLE_1;

CREATE TABLE EMP_RL (E_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,E_NAME VARCHAR(25),M_ID INT  );
INSERT INTO EMP_RL (E_NAME,M_ID) VALUES ('SHIV_NADAR',NULL),('RAMAYYA',1),('ANJANEYALU',2),('JD GARU',3),('RAJESH',4),('MAHANATHY',5);

#FOREIGN KEY
CREATE TABLE SALARY_RL(S_ID INT PRIMARY KEY AUTO_INCREMENT,E_ID INT NOT NULL ,SALARY INT NOT NULL,FOREIGN KEY (E_ID) REFERENCES EMP_RL(E_ID));
INSERT INTO SALARY_RL (E_ID,SALARY) VALUES (15,10000);  # ERROR BECOZ FOREIGN KEY 15 NOT AVAILABLE IN PARENT TABLE[EMP_RL]
														# FOREIGN KEY CAN ACCEPT NULL VALUES
INSERT INTO SALARY_RL (E_ID,SALARY) VALUES (1,10000000),(2,2000000),(3,300000),(4,40000),(5,5000),(6,600);

#UNIQUE ,CHECK(), DEFAULT 
CREATE TABLE RL_COMPANY(ID INT PRIMARY KEY AUTO_INCREMENT,DEPARTMENT VARCHAR(25)NOT NULL UNIQUE,NO_OF_EMPLOYEES INT NOT NULL CHECK (NO_OF_EMPLOYEES<1000),LOCATION VARCHAR(25) DEFAULT 'CHENNAI' );
INSERT INTO RL_COMPANY(DEPARTMENT,NO_OF_EMPLOYEES,LOCATION) VALUES ('IT',1000,'BGR'); #Error Code: 3819. Check constraint 'rl_company_chk_1' is violated.
INSERT INTO RL_COMPANY(DEPARTMENT,NO_OF_EMPLOYEES,LOCATION) VALUES ('IT',900,'BGR'),('IT',800,'HYD');#Error Code: 1062. Duplicate entry 'IT' for key 'rl_company.DEPARTMENT'
INSERT INTO RL_COMPANY(DEPARTMENT,NO_OF_EMPLOYEES,LOCATION) VALUES ('IT_DEVELOP',900,'BGR'),('IT_TESTING',600,'HYD'); 
INSERT INTO RL_COMPANY(DEPARTMENT,NO_OF_EMPLOYEES) VALUES ('VENDOR',900),('MAINTANENCE',600); #DEFAULT LOCATION WILL UPDATE


SELECT * FROM EMP_RL;
SELECT * FROM SALARY_RL;
SELECT * FROM RL_COMPANY;

#JOIN BY "USING()" KEYWORD
SELECT E.E_ID,E.E_NAME,S.SALARY FROM EMP_RL E LEFT JOIN SALARY_RL S ON E.E_ID=S.E_ID;
SELECT E.E_ID,E.E_NAME,S.SALARY FROM EMP_RL E LEFT JOIN SALARY_RL S USING (E_ID); # ONLY IF THE NAME IS COMMON ONLY
#SELF JOIN [TASK_1 is to get the employee name with his/her manager name.]
SELECT E.E_NAME AS EMPLOYEE ,M.E_NAME AS MANAGER FROM EMP_RL E LEFT JOIN EMP_RL M ON E.M_ID = M.E_ID ;
SELECT E.E_NAME AS EMPLOYEE ,M.E_NAME AS MANAGER FROM EMP_RL E RIGHT JOIN EMP_RL M ON E.M_ID = M.E_ID ;
#[TASK_2 is fetch all employess who are also managers]
SELECT M.E_NAME AS MANAGERS_LIST FROM EMP_RL E LEFT JOIN EMP_RL M ON E.M_ID=M.E_ID HAVING MANAGERS_LIST IS NOT NULL; 
SELECT M.E_NAME AS MANAGERS_LIST FROM EMP_RL E RIGHT JOIN EMP_RL M ON E.M_ID=M.E_ID WHERE E.E_NAME IS NOT NULL;
#[ HINT : RIGHT OUTER JOIN WHERE A.KEY IS NULL]

#SELECT N-th HIGHEST 
SELECT DISTINCT SALARY FROM SALARY_RL ORDER BY SALARY DESC LIMIT 3/*N-1*/,1;

# ANY - ALL
CREATE TABLE TAX_PAYMENT(MAX_AMOUNT INT NOT NULL,TAX_PER DOUBLE NOT NULL);
INSERT INTO TAX_PAYMENT VALUES (700000,10.5),(5000000,18.5);
SELECT * FROM TAX_PAYMENT;

SELECT E_ID,SALARY FROM SALARY_RL WHERE SALARY > ANY(SELECT MAX_AMOUNT FROM TAX_PAYMENT);#SHOULD CAUGHT IN ANY ONE OF THE TAX PAYMENT
SELECT E_ID,SALARY FROM SALARY_RL WHERE SALARY > ALL(SELECT MAX_AMOUNT FROM TAX_PAYMENT);#SHOULD CAUGHT IN ALL OF THE TAX PAYMENT


#SELECT INTO [CREATE DATA IN NEW TABLE]
SELECT * INTO TAX_PAYMENT_DUMMY /*[IN DEMO]*/ FROM TAX_PAYMENT; #NOT IN MYSQL INSTED USE BELOW
CREATE TABLE TAX_PAYMENT_DUMMY AS
SELECT * FROM TAX_PAYMENT;
SELECT * FROM TAX_PAYMENT_DUMMY;

#INSERT INTO SELECT[APPEND DATA IN EXISTING TABLE]
INSERT INTO TAX_PAYMENT 
SELECT * FROM TAX_PAYMENT_DUMMY;

#SELECT INSIDE SELECT
SELECT * FROM (SELECT * FROM EMP_RL WHERE E_ID>3) AS TABLE_X;

#IS NULL & IFNULL() / COALESCE() :
SELECT * FROM EMP_RL;
SELECT * FROM EMP_RL WHERE M_ID IS NULL;
SELECT M_ID+1 FROM EMP_RL;#IF M_ID IS NULL IT WILL GIVE OUTPUT ALSO NULL
SELECT IFNULL(M_ID,0)+10 FROM EMP_RL;
SELECT COALESCE(M_ID,0)+10 FROM EMP_RL;

#PRINT ALL EMPLOYEES HAVING HIGHEST SALARY
UPDATE SALARY_RL SET SALARY = 10000000 WHERE E_ID = 5;
SELECT * FROM SALARY_RL;
SELECT E_ID,SALARY FROM SALARY_RL WHERE SALARY = (SELECT MAX(SALARY) FROM SALARY_RL);#ANS

#DATEDIFF [ SELECT DATEDIFF(end_date, start_date) AS date_difference FROM your_table;]
SELECT DATEDIFF('2022-01-01', '2022-01-10')AS DATE_GAP; 
SELECT DATEDIFF('2022-01-27', '2022-01-20')AS DATE_GAP; 
SELECT DATEDIFF('2022-02-27', '2022-01-20')AS DATE_GAP; 

#GETDATE()
ALTER TABLE SALARY_RL ADD S_DATE_2 DATE DEFAULT (GETDATE);# ONLY IN SQL SERVER 
ALTER TABLE SALARY_RL ADD COLUMN S_DATE DATE DEFAULT (CURRENT_DATE);
SELECT * FROM SALARY_RL;

#CREATE INDEX[CLUSTER & NON CLUSTER],DROP INDEX:
#PRIMARY KEY IN CREATE TABLE WILL CREATE CLUSTERED INDEX
CREATE INDEX NC_INDEX ON SALARY_RL (SALARY);  # NON CLUSTERED INDEX #FASTEN THE RETRIEVAL PROCESS
DROP INDEX NC_INDEX ON SALARY_RL;

# NOTE: FOR i]CHECK (AGE>18) ii]DEFAULT (CURRENT_DATE) iii] using (E_ID)   BRACKETS() ARE IMPORTANT

#------------------------------------------------SQL_NOTES   END----------------------------------------------------------------#
#STORED PROCEDURES: 
SELECT * FROM SALARY_RL;

#SIMPLE SP:
/*
CREATE PROCEDURE GET_RICH_EMP()
BEGIN
SELECT * FROM SALARY_RL WHERE SALARY = (SELECT MAX(SALARY) FROM SALARY_RL) ;
END$$
*/
CALL GET_RICH_EMP();
DROP PROCEDURE GET_RICH_EMP;
#INPUT PARAMETER:
/*
CREATE PROCEDURE GET_RICH_EMP_N(IN N INT)
BEGIN
SELECT * FROM SALARY_RL ORDER BY SALARY  DESC LIMIT 0,N ;
END$$
*/
CALL GET_RICH_EMP_N(3);
CALL GET_RICH_EMP_N(5);

#INPUT & OUTPUT PARAMETER
/*
CREATE PROCEDURE GET_SALARY_DET_BY_ID(IN EMP_ID INT,OUT SRY INT,OUT SDT DATE)
BEGIN
SELECT SALARY,S_DATE INTO SRY,SDT FROM SALARY_RL WHERE E_ID=EMP_ID;
END$$
*/
CALL GET_SALARY_DET_BY_ID(5,@AMOUNT,@DATEUH);
SELECT @AMOUNT,@DATEUH ;
CALL GET_SALARY_DET_BY_ID(3,@AMOUNT,@DATEUH);
SELECT @AMOUNT,@DATEUH ;
#-------------------------------------------------------------------------------------------------------------------------------------#

# USER DEFINED FUNCTIONS:
#User-defined functions can be written in C/C++ and then loaded into MySQL for use within SQL statements

# STORED PROCEDURE VS FUNCTIONS [REFER SQL NOTES]

#-------------------------------------------------------------------------------------------------------------------------------------#
#WINDOW FUNCTION[analytic function]
-- SELECT 
--     column1,
--     column2,
--     window_function(column3) OVER (PARTITION BY partition_column ORDER BY order_column)  
-- FROM
--     your_table;

-- PARTITION BY divides the result set into partitions, and the function is applied separately to each partition.
-- ORDER BY specifies the order of rows within each partition. This is optional but important for certain functions like ROW_NUMBER() or RANK()
-- 1.ROW_NUMBER(): Assigns a unique sequential integer to each row within a partition.
-- 2.RANK(), DENSE_RANK(): Assigns a rank to each row within a partition based on some ordering criteria.
-- 3.SUM(), AVG(), MIN(), MAX(): Calculate aggregate values over a window.
-- 4.LEAD(), LAG(): Access data from subsequent or preceding rows within the partition.
-- 5.NTILE(): Divides the result set into a specified number of quantiles.
#-------------------------------------------------------------------------------------------------------------------------------------#

#------------------------------------------------------------------ END -------------------------------------------------------------#