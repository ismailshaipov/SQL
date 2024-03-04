SELECT E_FNAME, E_LNAME
FROM Employees
WHERE E_ID IN (SELECT B_EDIT FROM Books);
---------------------------------------------------
SELECT E_ROOM
FROM Employees
WHERE E_POST IN (SELECT P_ID FROM Posts WHERE P_POST = 'Верстальщик');
---------------------------------------------------
SELECT A_FNAME, A_LNAME
FROM Authors
WHERE A_ID IN (SELECT A_ID FROM Titles);
---------------------------------------------------
SELECT A_ID, COUNT(B_ID)
FROM Titles
GROUP BY A_ID
---------------------------------------------------
SELECT B_TITLE
FROM [dbo].[Books]
WHERE B_CONTRACT IN (SELECT B_ID FROM [dbo].[Items])
---------------------------------------------------
SELECT COUNT(E_ID) 
FROM Employees
WHERE E_Pdate > '01.01.2000' And E_SEX = 'М';
----------------------------------------------------
SELECT B_TITLE, (B_CIRCUL * B_PRICE)
FROM Books;
----------------------------------------------------
SELECT B_TITLE
FROM Books
WHERE B_CONTRACT IN (SELECT B_ID FROM Items 
WHERE O_ID IN (SELECT O_ID FROM Orders WHERE MONTH(O_DATE) = 9 AND YEAR(O_DATE) = 2020));
---------------------------------------------------
SELECT SUM(B_CIRCUL)
FROM Books
WHERE B_CONTRACT IN (SELECT A_ID FROM Authors WHERE A_ADDR = 'Казань');
---------------------------------------------------
SELECT Authors.A_FNAME, Authors2.A_FNAME, Authors.A_ADDR
FROM Authors LEFT JOIN Authors AS Authors2
ON Authors.A_ADDR = Authors2.A_ADDR
WHERE Authors.A_ID<Authors2.A_ID
-----------------------------------------------------
SELECT B_TITLE
FROM Books
WHERE B_CONTRACT IN (SELECT B_ID FROM Titles WHERE A_ID = (SELECT A_ID FROM Authors WHERE A_FNAME = 'Андреев'));
