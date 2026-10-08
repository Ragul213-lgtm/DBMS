mysql> create database company;
ERROR 1007 (HY000): Can't create database 'company'; database exists
mysql> create database 'company';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''company'' at line 1
mysql> CREATE DATABASE COMPANY;
Query OK, 1 row affected (0.01 sec)

mysql> USE COMPANY;
Database changed
mysql> CREATE TABLE EMPLOYEE(Emp_no INT PRIMARY KEY,E_name VARCHAR(50),E_address VARCHAR(100),E_ph_no VARCHAR(15),Dept_no INT,Dept_name VARCHAR(50),Job_id CHAR(10), Salary DECIMAL(10,2));
Query OK, 0 rows affected (0.04 sec)

mysql> Describe EMPLOYEE;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| Emp_no    | int           | NO   | PRI | NULL    |       |
| E_name    | varchar(50)   | YES  |     | NULL    |       |
| E_address | varchar(100)  | YES  |     | NULL    |       |
| E_ph_no   | varchar(15)   | YES  |     | NULL    |       |
| Dept_no   | int           | YES  |     | NULL    |       |
| Dept_name | varchar(50)   | YES  |     | NULL    |       |
| Job_id    | char(10)      | YES  |     | NULL    |       |
| Salary    | decimal(10,2) | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> ALTER TABLE EMPLOYEE ADD HIREDATE DATE;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE MODIFY job_id VARCHAR(10);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE RENAME COLUMN Emp_no TO E_no;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE MODIFY Job_id VARCHAR(20);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE ADD CONSTRAINT UQ_E_ph_no UNIQUE(^C
mysql> ALTER TABLE EMPLOYEE ADD CONSTRAINT UQ_E_ph_np UNIQUE(E_ph_no);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE MODIFY E_name VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE ADD CONSTRAINT CHK_Salary CHECK(Salary>0);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO EMPLOYEE (E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(1,'John doe','123 Main St','555-4567',101,'Sales','J1001',50000.00,'20-08-24');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(2,'Jane Smith','456 Oak St',555-1234',102,'Marketing','J1002'
    '> ,60000.00,'04-06-18');
    '> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(2,'Jane Smith','456 Oak St',555-1234',102,'Marketing','J1002'60000.00,'04-06-18');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '',102,'Marketing','J1002'
,60000.00,'04-06-18');
INSERT INTO EMPLOYEE(E_no,E_nam' at line 1
mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(2,'Jane Smith','456 Oak St',555-1234',102,'Marketing','J1002'
,60000.00,'04-06-18');
INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(2,'Jane Smith','456 Oak St','555-1234',102,'Marketing','J1002',60000.00,'04-06-18');
    '> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(2,'Jane Smith','456 Oak St',555-1234',102,'Marketing','J1002'
,60000.00,'04-06-18');
INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(2,'Jane Smith','456 Oak St','555-1234',102,'Marketing','J1002',60000.00,'04-06-18');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '',102,'Marketing','J1002'
,60000.00,'04-06-18');
INSERT INTO EMPLOYEE(E_no,E_nam' at line 1
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine  St',555-9014',103,'HR','J1003',55000.00,'4-07-15');
    '> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine St','555-9014',103,'HR','J1003',55000.00,'4-07-15');
    '> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine St','555-9014',103,'HR','J1003',55000.00,'4-07-15'      -> );
    '> 
    '> 
    '> 
    '> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine St','555-9014',103,'HR','J1003',55000.00,'4-07-15'
);
    '> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine St','555-9014',103,'HR','J1003',55000.00,'4-07-15');
    '> ;
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '',103,'HR','J1003',55000.00,'4-07-15');
INSERT INTO EMPLOYEE(E_no,E_name,E_addre' at line 1
mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine  St',555-9014',103,'HR','J1003',55000.00,'4-07-15');
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '',103,'HR','J1003',55000.00,'4-07-15');
'' at line 1
mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine St','555-9014',103,'HR','J1003',55000.00,'4-07-15');
';
Query OK, 1 row affected (0.01 sec)

    '> ;
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '';
;
'' at line 1
mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(3,'Alice Johnson','789 Pine St','555-9014',103,'HR','J1003',55000.00,'4-07-15');
ERROR 1062 (23000): Duplicate entry '3' for key 'EMPLOYEE.PRIMARY'
mysql> INSERT INTO EMPLOYEE(E_no,E_name,E_address,E_ph_no,Dept_no,Dept_name,Job_id,Salary,HIREDATE)VALUES(4,'Alice bob','112 Apple St','555-1112',104,'ADMIN','J1004',45000.00,'4-03-15');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT*FROM EMPLOYEE;
+------+---------------+--------------+----------+---------+-----------+--------+----------+------------+
| E_no | E_name        | E_address    | E_ph_no  | Dept_no | Dept_name | Job_id | Salary   | HIREDATE   |
+------+---------------+--------------+----------+---------+-----------+--------+----------+------------+
|    1 | John doe      | 123 Main St  | 555-4567 |     101 | Sales     | J1001  | 50000.00 | 2020-08-24 |
|    2 | Jane Smith    | 456 Oak St   | 555-1234 |     102 | Marketing | J1002  | 60000.00 | 2004-06-18 |
|    3 | Alice Johnson | 789 Pine St  | 555-9014 |     103 | HR        | J1003  | 55000.00 | 0004-07-15 |
|    4 | Alice bob     | 112 Apple St | 555-1112 |     104 | ADMIN     | J1004  | 45000.00 | 0004-03-15 |
+------+---------------+--------------+----------+---------+-----------+--------+----------+------------+
4 rows in set (0.00 sec)

mysql> UPDATE EMPLOYEE SET Salary=55000.00 WHERE E_no=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE EMPLOYEE SET Dept_name='Digital Marketing' WHERE Dept_no=102;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT*FORM EMPLOYEE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FORM EMPLOYEE' at line 1
mysql> SELECT*FROM EMPLOYEE;
+------+---------------+--------------+----------+---------+-------------------+--------+----------+------------+
| E_no | E_name        | E_address    | E_ph_no  | Dept_no | Dept_name         | Job_id | Salary   | HIREDATE   |
+------+---------------+--------------+----------+---------+-------------------+--------+----------+------------+
|    1 | John doe      | 123 Main St  | 555-4567 |     101 | Sales             | J1001  | 55000.00 | 2020-08-24 |
|    2 | Jane Smith    | 456 Oak St   | 555-1234 |     102 | Digital Marketing | J1002  | 60000.00 | 2004-06-18 |
|    3 | Alice Johnson | 789 Pine St  | 555-9014 |     103 | HR                | J1003  | 55000.00 | 0004-07-15 |
|    4 | Alice bob     | 112 Apple St | 555-1112 |     104 | ADMIN             | J1004  | 45000.00 | 0004-03-15 |
+------+---------------+--------------+----------+---------+-------------------+--------+----------+------------+
4 rows in set (0.00 sec)

mysql> CREATE DATABASE IF NOT EXISTS university_db;
Query OK, 1 row affected (0.02 sec)


