SELECT A_FNAME, A_LNAME, A_ADDR FROM Authors
JOIN dbo.Titles
ON Titles.A_ID = Authors.A_ID
JOIN dbo.Books
ON Books.B_CONTRACT = Titles.B_ID
WHERE B_Price = (SELECT MAX(B_Price) FROM Books)
---------------------------------------------------------
SELECT E_FNAME, E_LNAME FROM Employees
WHERE E_POST= (SELECT P_ID FROM Posts WHERE P_POST = 'программист');
---------------------------------------------------------
SELECT A_LNAME FROM Authors
WHERE Authors.A_ID in (SELECT A_ID FROM Titles GROUP BY A_ID HAVING COUNT(*) > 1);
---------------------------------------------------------
SELECT A_FNAME, A_LNAME FROM Authors
JOIN dbo.Titles
ON Titles.A_ID = Authors.A_ID
JOIN dbo.Books
ON Books.B_CONTRACT = Titles.B_ID
WHERE B_CIRCUL = (SELECT MIN(B_CIRCUL) FROM Books);
----------------------------------------------------------
SELECT E_FNAME, E_LNAME, E_ADDR FROM Editors
JOIN dbo.Employees
ON Editors.E_ID = Employees.E_ID
JOIN dbo.Books
ON Editors.B_ID = Books.B_CONTRACT
WHERE B_CIRCUL = (SELECT MAX(B_CIRCUL) FROM Books);
----------------------------------------------------------
SELECT A_FNAME, A_LNAME
FROM Authors
JOIN dbo.Titles
ON Titles.A_ID = Authors.A_ID
JOIN dbo.Books
ON Books.B_CONTRACT = Titles.B_ID
WHERE B_CIRCUL<=
(SELECT B_CIRCUl Books WHERE B_CONTRACT in(SELECT B_ID From Titles WHERE A_ID in (SELECT A_ID FROM Authors WHERE A_FNAME = 'Яковлев')));
---------------------------------------------------------------------------------------------------------------------------------------

SELECT B_TITLE
FROM Books
JOIN Titles
ON Titles.B_ID = Books.B_CONTRACT

JOIN Authors
On Authors.A_ID = Titles.A_ID

WHERE Authors.A_ID = (SELECT A_ID FROM Titles 
					  WHERE B_ID = (SELECT B_CONTRACT 
								    FROM Books
									WHERE B_TITLE ='«Вторая»	                               '));
