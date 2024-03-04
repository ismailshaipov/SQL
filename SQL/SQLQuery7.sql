CREATE VIEW employees_in_room_3 AS
SELECT *
FROM Employees
WHERE E_ROOM = '3';

CREATE VIEW authors_city AS
SELECT A_ADDR,COUNT(DISTINCT A_ID) as author_count
FROM Authors
GROUP BY A_ADDR;

CREATE VIEW books_ordered_on_date AS
SELECT B_TITLE, COUNT(B_TITLE) AS num_ordered
FROM Books
JOIN Items ON Items.B_ID = Books.B_CONTRACT
JOIN Orders ON Orders.O_ID = Items.O_ID
WHERE O_DATE = '2020-10-11'
GROUP BY O_DATE,B_TITLE;

CREATE VIEW total_books_order 
AS
SELECT Orders.O_ID, SUM(B_Count) AS "Кол-во книг"
FROM Items
JOIN Orders ON Orders.O_ID = Items.O_ID
GROUP BY Orders.O_ID;


CREATE VIEW orders_city AS
SELECT O_COMPANY, COUNT(O_ID) as NumOrders
FROM Customers
JOIN Orders ON Customers.C_ID = Orders.O_COMPANY
GROUP BY C_ADDR,O_COMPANY;

CREATE VIEW edited_books AS
SELECT B_TITLE
FROM Books
JOIN Editors ON Books.B_EDIT = Editors.B_ID
JOIN Employees  ON Editors.E_ID = Employees.E_ID
WHERE E_FNAME = 'Арбенин             ';
