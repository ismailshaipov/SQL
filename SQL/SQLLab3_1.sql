SELECT B_TITLE, B_PRICE, B_CIRCUL
FROM Books;

SELECT A_FNAME,A_LNAME,A_ADDR
FROM Authors;


SELECT E_FNAME,E_LNAME,E_BORN
FROM Employees;

SELECT E_FNAME,E_LNAME
FROM Employees
WHERE E_SEX LIKE '�';

SELECT E_FNAME,E_LNAME
FROM Employees
WHERE E_BORN BETWEEN '1988-05-01' AND '2010-05-31'

SELECT E_FNAME,E_LNAME
FROM Employees
WHERE E_ADDR NOT LIKE '%������%' AND E_ROOM LIKE '3';

--8 ���������

SELECT A_FNAME,A_LNAME
FROM Authors
WHERE A_LNAME BETWEEN '�%' AND '�%';


--8 done
SELECT E_BORN
FROM Employees
WHERE DATEPART(YY,E_BORN) = 2010 AND DATEPART(MM,E_BORN) = 5;

--12
SELECT O_ID, COUNT(B_ID)
FROM Items
GROUP BY O_ID;

SELECT B_CIRCUL
FROM Books
WHERE B_TITLE LIKE '%������%';

SELECT A_FNAME
FROM Authors
WHERE A_ADDR = '������'