CREATE PROCEDURE RemainderOfTheRun(@contract int, @rest int)
AS
UPDATE Books
SET B_REST = B_REST - @rest
WHERE B_CONTRACT = @contract

CREATE PROCEDURE IncreasingBooksInOrder(@title NVARCHAR(20) , @countbooks int)
AS
UPDATE Items
SET B_COUNT = B_COUNT + @countbooks
FROM Items
JOIN Books ON Books.B_CONTRACT = Items.B_ID
Where B_TITLE = @title

CREATE PROCEDURE AuthorsName(@a_id int)
AS
SELECT A_FNAME, A_LNAME FROM Authors
WHERE A_ID = @a_id

CREATE PROCEDURE AuthorsAndBooksName(@title NVARCHAR(20))
AS
SELECT A_FNAME, A_LNAME, B_TITLE FROM dbo.Books
JOIN dbo.Titles
ON Books.B_CONTRACT = Titles.B_ID
JOIN dbo.Authors
ON Titles.A_ID = Authors.A_ID
WHERE B_TITLE = @title

CREATE PROCEDURE BooksNameAndCountOrders(@c_addr NVARCHAR(20))
AS
SELECT COUNT(B_COUNT), B_TITLE FROM [dbo].[Items]
JOIN dbo.Books ON Items.B_ID = Books.B_CONTRACT
JOIN dbo.Orders ON Items.O_ID = Orders.O_ID
JOIN dbo.Customers ON Orders.O_COMPANY = Customers.C_ID
WHERE C_ADDR = @c_addr
GROUP BY B_TITLE


--CREATE PROCEDURE AuthorsBooks(@a_fname NVARCHAR(20))
--AS
--SELECT B_TITLE FROM Books
--JOIN Titles ON Books.B_CONTRACT = Titles.B_ID
--JOIN Authors ON Titles.A_ID = Authors.A_ID
--WHERE A_FNAME = @a_fname 
