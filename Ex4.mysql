CREATE DATABASE LibraryDB;
ERROR 1007 (HY000): Can't create database 'LibraryDB'; database exists
mysql> USE LibraryDB;
Database changed
mysql> 
mysql> CREATE TABLE Authors (
    ->     AuthorID INT PRIMARY KEY,
    ->     Name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> 
mysql> CREATE TABLE Books (
    ->     BookID INT PRIMARY KEY,
    ->     Title VARCHAR(150),
    ->     AuthorID INT,
    ->     FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> 
mysql> CREATE TABLE Borrowers (
    ->     BorrowerID INT PRIMARY KEY,
    ->     Name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> CREATE TABLE BookBorrowing (
    ->     BookID INT,
    ->     BorrowerID INT,
    ->     BorrowedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (BookID) REFERENCES Books(BookID),
    ->     FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> 
mysql> INSERT INTO Authors (AuthorID, Name) VALUES
    -> (1, 'J.K. Rowling'),
    -> (2, 'George Orwell'),
    -> (3, 'J.R.R. Tolkien');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Books (BookID, Title, AuthorID) VALUES
    -> (101, 'Harry Potter and the Philosopher\'s Stone', 1),
    -> (102, '1984', 2),
    -> (103, 'The Hobbit', 3),
    -> (104, 'Harry Potter and the Chamber of Secrets', 1);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Borrowers (BorrowerID, Name) VALUES
    -> (1, 'John Doe'),
    -> (2, 'Jane Smith'),
    -> (3, 'Alice Johnson');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO BookBorrowing (BookID, BorrowerID) VALUES
    -> (101, 1),
    -> (102, 2),
    -> (103, 3),
    -> (104, 1);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- 1. Display all authors
mysql> SELECT * FROM Authors;
+----------+----------------+
| AuthorID | Name           |
+----------+----------------+
|        1 | J.K. Rowling   |
|        2 | George Orwell  |
|        3 | J.R.R. Tolkien |
+----------+----------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- 2. Display all books
mysql> SELECT * FROM Books;
+--------+------------------------------------------+----------+
| BookID | Title                                    | AuthorID |
+--------+------------------------------------------+----------+
|    101 | Harry Potter and the Philosopher's Stone |        1 |
|    102 | 1984                                     |        2 |
|    103 | The Hobbit                               |        3 |
|    104 | Harry Potter and the Chamber of Secrets  |        1 |
+--------+------------------------------------------+----------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- 3. Display all borrowers
mysql> SELECT * FROM Borrowers;
+------------+---------------+
| BorrowerID | Name          |
+------------+---------------+
|          1 | John Doe      |
|          2 | Jane Smith    |
|          3 | Alice Johnson |
+------------+---------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- 4. Display all borrowing details
mysql> SELECT * FROM BookBorrowing;
+--------+------------+---------------------+
| BookID | BorrowerID | BorrowedDate        |
+--------+------------+---------------------+
|    101 |          1 | 2026-08-10 15:31:39 |
|    102 |          2 | 2026-08-10 15:31:39 |
|    103 |          3 | 2026-08-10 15:31:39 |
|    104 |          1 | 2026-08-10 15:31:39 |
+--------+------------+---------------------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- 5. INNER JOIN: Display books with their authors
mysql> SELECT
    ->     b.BookID,
    ->     b.Title,
    ->     a.Name AS AuthorName
    -> FROM Books b
    -> INNER JOIN Authors a
    -> ON b.AuthorID = a.AuthorID;
+--------+------------------------------------------+----------------+
| BookID | Title                                    | AuthorName     |
+--------+------------------------------------------+----------------+
|    101 | Harry Potter and the Philosopher's Stone | J.K. Rowling   |
|    104 | Harry Potter and the Chamber of Secrets  | J.K. Rowling   |
|    102 | 1984                                     | George Orwell  |
|    103 | The Hobbit                               | J.R.R. Tolkien |
+--------+------------------------------------------+----------------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- 6. INNER JOIN: Display books and borrowers
mysql> SELECT
    ->     b.Title,
    ->     br.Name AS BorrowerName
    -> FROM Books b
    -> INNER JOIN BookBorrowing bb
    -> ON b.BookID = bb.BookID
    -> INNER JOIN Borrowers br
    -> ON bb.BorrowerID = br.BorrowerID;
+------------------------------------------+---------------+
| Title                                    | BorrowerName  |
+------------------------------------------+---------------+
| Harry Potter and the Philosopher's Stone | John Doe      |
| Harry Potter and the Chamber of Secrets  | John Doe      |
| 1984                                     | Jane Smith    |
| The Hobbit                               | Alice Johnson |
+------------------------------------------+---------------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- 7. LEFT JOIN: Display all books and borrowers
mysql> SELECT
    ->     b.Title,
    ->     COALESCE(br.Name, 'Not Borrowed') AS BorrowerName
    -> FROM Books b
    -> LEFT JOIN BookBorrowing bb
    -> ON b.BookID = bb.BookID
    -> LEFT JOIN Borrowers br
    -> ON bb.BorrowerID = br.BorrowerID;
+------------------------------------------+---------------+
| Title                                    | BorrowerName  |
+------------------------------------------+---------------+
| Harry Potter and the Philosopher's Stone | John Doe      |
| 1984                                     | Jane Smith    |
| The Hobbit                               | Alice Johnson |
| Harry Potter and the Chamber of Secrets  | John Doe      |
+------------------------------------------+---------------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- 8. Subquery: Find books written by J.K. Rowling
mysql> SELECT Title
    -> FROM Books
    -> WHERE AuthorID = (
    ->     SELECT AuthorID
    ->     FROM Authors
    ->     WHERE Name = 'J.K. Rowling'
    -> );
+------------------------------------------+
| Title                                    |
+------------------------------------------+
| Harry Potter and the Philosopher's Stone |
| Harry Potter and the Chamber of Secrets  |
+------------------------------------------+
2 rows in set (0.00 sec)

mysql> 
mysql> -- 9. Subquery: Find borrowers who borrowed a book
mysql> SELECT DISTINCT Name
    -> FROM Borrowers
    -> WHERE BorrowerID IN (
    ->     SELECT BorrowerID
    ->     FROM BookBorrowing
    -> );
+---------------+
| Name          |
+---------------+
| John Doe      |
| Jane Smith    |
| Alice Johnson |
+---------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- 10. Display borrowed date
mysql> SELECT
    ->     b.Title,
    ->     br.Name AS BorrowerName,
    ->     bb.BorrowedDate
    -> FROM Books b
    -> JOIN BookBorrowing bb
    -> ON b.BookID = bb.BookID
    -> JOIN Borrowers br
    -> ON bb.BorrowerID = br.BorrowerID;
+------------------------------------------+---------------+---------------------+
| Title                                    | BorrowerName  | BorrowedDate        |
+------------------------------------------+---------------+---------------------+
| Harry Potter and the Philosopher's Stone | John Doe      | 2026-08-10 15:31:39 |
| Harry Potter and the Chamber of Secrets  | John Doe      | 2026-08-10 15:31:39 |
| 1984                                     | Jane Smith    | 2026-08-10 15:31:39 |
| The Hobbit                               | Alice Johnson | 2026-08-10 15:31:39 |
+------------------------------------------+---------------+---------------------+
4 rows in set (0.00 sec)

