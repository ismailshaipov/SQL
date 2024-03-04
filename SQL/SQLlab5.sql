--UPDATE Posts
--SET P_SAL = P_SAL * 1.05
--WHERE P_POST = 'Программист';
-------------------------------------------------------

--INSERT INTO Customers(C_NAME, C_ADDR)
--VALUES ('Шестой', 'Ростов');

-------------------------------------------------------

--INSERT INTO Orders(O_COMPANY, O_DATE)
--SELECT C_ID, '24.03.2023'
--FROM Customers
--WHERE C_ADDR = 'Ростов';

--INSERT INTO Items(O_ID,B_ID , B_COUNT)
--VALUES 
--(10, 1, 50),
--(10, 3, 70);

---------------------------------------------------------

--UPDATE Items
--SET B_COUNT = B_COUNT + 10
--WHERE O_ID = 10 AND B_ID = 1;

------------------------------------------------------------

DELETE FROM Items
WHERE O_ID IN (
  SELECT O_ID
  FROM Orders
  WHERE O_COMPANY = (
    SELECT C_ID
    FROM Customers
    WHERE C_ADDR = 'Ростов'));

DELETE FROM Orders
WHERE O_ID IN (
  SELECT O_ID
  FROM Orders
  WHERE O_COMPANY = (
    SELECT C_ID
    FROM Customers
    WHERE C_ADDR = 'Ростов'));

DELETE FROM Customers
WHERE C_ID = (
  SELECT C_ID
  FROM Customers
  WHERE C_ADDR = 'Ростов'
);
------------------------------------------------------------
UPDATE Orders
SET O_COMPANY = 5
WHERE O_COMPANY = 2

SELECT * from Orders;
-------------------------------------------------------------
CREATE TABLE Table_1(
	book_name varchar(50) NOT NULL,
	count int NOT NULL)

INSERT INTO Table_1
SELECT B_TITLE, B_CIRCUL
FROM Books
WHERE B_CIRCUL < 1000;

SELECT * from Table_1;
