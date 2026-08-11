mysql> CREATE DATABASE CYBERDB;
Query OK, 1 row affected (0.02 sec)

mysql> USE CYBERDB;
Database changed
mysql> CREATE TABLE Users(UserID INT PRIMARY KEY, FirstName VARCHAR(50),LastName VARCHAR(50),Email VARCHAR(100),DateOfBirth DATE);
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Enrollments(EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,CourseTitle VARCHAR(50),Trainer VARCHAR(50),UserID INT,FOREIGN KEY(UserID) REFERENCES Users(UserID));
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO Users VALUES(101,'Suzil','Walker','suzil.walker@gmail.com','2003-06-01'),(102,'Selva','Smith','selva.smith@gmail.com','2004-07-15'),(103,'Sujee','Brown','sujee.brown@gmail.com','2005-08-21'),(104,'Ragul','Lee','ragul.lee@gmail.com','2002-09-30'),(105,'Julia','White','julia.white@gmail.com','2001-10-31');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Enrollments (CourseTitle,Trainer,UserID)VALUES('Cyber Security Basics','Dr. Kevin Mitnick',101),('Advanced Hacking','Dr.Ada Lovelace',102),('Digital Forensics','Dr.Grace Hopper',103),('Cryptography','Dr.Alan Turing',104),('AI in Security','Dr.Linus Torvalds',105);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT COUNT(*) AS UsersAfter2004 FROM Users WHERE DateOfBirth>'2004-01-01';
+----------------+
| UsersAfter2004 |
+----------------+
|              2 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(EnrollmentID)AS AvgEnrollmentID FROM Enrollments WHERE Trainer ='Dr.Alan Turing';
+-----------------+
| AvgEnrollmentID |
+-----------------+
|          4.0000 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(EnrollmentID)AS TotalEnrollmentID FROM Enrollments WHERE Trainer ='Dr.Grace Hopper';
+-------------------+
| TotalEnrollmentID |
+-------------------+
|                 3 |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT UserID,COUNT(*) AS CourseCount FROM Enrollments GROUP BY UserID;
+--------+-------------+
| UserID | CourseCount |
+--------+-------------+
|    101 |           1 |
|    102 |           1 |
|    103 |           1 |
|    104 |           1 |
|    105 |           1 |
+--------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT MIN(DateOFBirth)AS EarliesDOB FROM Users WHERE LastName='Smith';
+------------+
| EarliesDOB |
+------------+
| 2004-07-15 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) AS TotalCourses FROM Enrollments WHERE UserID IN (SELECT UserID FROM Users WHERE DateOfBirth<'2005-01-01');
+--------------+
| TotalCourses |
+--------------+
|            4 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(UserID)AS AvgUserID FROM Enrollments WHERE CourseTitle='Cyber Security Basics';
+-----------+
| AvgUserID |
+-----------+
|  101.0000 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT Trainer,COUNT(*)AS CouresTaught FROM Enrollments WHERE Users IN(SELECT UserID FROM Users WHERE DateOfBirth>'2003-01-01');
ERROR 1054 (42S22): Unknown column 'Users' in 'IN/ALL/ANY subquery'
mysql> SELECT Trainer,COUNT(*)AS CouresTaught FROM Enrollments WHERE Users IN(SELECT UserID FROM Users WHERE DateOfBirth>'2003-01-01')
    -> ;
ERROR 1054 (42S22): Unknown column 'Users' in 'IN/ALL/ANY subquery'
mysql> SELECT Trainer,COUNT(*)AS CouresTaught FROM Enrollments WHERE Users IN (SELECT UserID FROM Users WHERE DateOfBirth>'2003-01-01')
    -> ;
ERROR 1054 (42S22): Unknown column 'Users' in 'IN/ALL/ANY subquery'
mysql> SELECT Trainer,COUNT(*)AS CouresTaught FROM Enrollments WHERE Users IN (SELECT UserID FROM Users WHERE DateOfBirth>'2003-01-01');
ERROR 1054 (42S22): Unknown column 'Users' in 'IN/ALL/ANY subquery'
mysql> SELECT*FROM Users;
+--------+-----------+----------+------------------------+-------------+
| UserID | FirstName | LastName | Email                  | DateOfBirth |
+--------+-----------+----------+------------------------+-------------+
|    101 | Suzil     | Walker   | suzil.walker@gmail.com | 2003-06-01  |
|    102 | Selva     | Smith    | selva.smith@gmail.com  | 2004-07-15  |
|    103 | Sujee     | Brown    | sujee.brown@gmail.com  | 2005-08-21  |
|    104 | Ragul     | Lee      | ragul.lee@gmail.com    | 2002-09-30  |
|    105 | Julia     | White    | julia.white@gmail.com  | 2001-10-31  |
+--------+-----------+----------+------------------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT Trainer,COUNT(*)AS CouresTaught FROM Enrollments WHERE Users IN (SELECT UserID FROM Users WHERE DateOfBirth>'2003-01-01') GROUP BY Trainer;
ERROR 1054 (42S22): Unknown column 'Users' in 'IN/ALL/ANY subquery'
mysql> SELECT Trainer,COUNT(*)AS CouresTaught FROM Enrollments WHERE UserID IN (SELECT UserID FROM Users WHERE DateOfBirth>'2003-01-01') GROUP BY Trainer;
+-------------------+--------------+
| Trainer           | CouresTaught |
+-------------------+--------------+
| Dr. Kevin Mitnick |            1 |
| Dr.Ada Lovelace   |            1 |
| Dr.Grace Hopper   |            1 |
+-------------------+--------------+
3 rows in set (0.01 sec)

mysql> SELECT MAX(UserID)AS MaxUserID FROM Enrollments WHERE Trainer='Dr.Kevin Mitnick';
+-----------+
| MaxUserID |
+-----------+
|      NULL |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT SUM(EnrollmentID)AS TotalFromJ FROM Enrollments WHERE UserID IN(SELECT UserID FROM Users WHERE FirstName LIKE'J%');
+------------+
| TotalFromJ |
+------------+
|          5 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT CONCAT(UPPER(FirstName),'',UPPER(LastName))AS FullNameUpper,DATEDIFF(NOW(),DateOfBirth) DIV 365 AS Age FROM Users;
+---------------+------+
| FullNameUpper | Age  |
+---------------+------+
| SUZILWALKER   |   23 |
| SELVASMITH    |   22 |
| SUJEEBROWN    |   20 |
| RAGULLEE      |   23 |
| JULIAWHITE    |   24 |
+---------------+------+
5 rows in set (0.01 sec)

