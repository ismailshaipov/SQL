--SELECT Покупатель.F_purchaser, Покупатель.I_purchaser, Покупатель.O_purchaser, Поставщик.Name_company
--FROM Покупки
--JOIN Покупатель ON Покупки.ID_purchaser = Покупатель.ID_purchaser
--JOIN Поставщик ON Покупки.ID_delivery = Поставщик.ID_delivery;

--SELECT Покупки.*
--FROM Покупки
--JOIN Состав_Покупки ON Покупки.ID_purchase = Состав_Покупки.ID_purchase
--JOIN Товар ON Состав_Покупки.ID_product = Товар.ID_product
--WHERE Товар.Cost = (
--    SELECT MIN(Cost)
--    FROM Товар
--)

--UPDATE Покупатель
--SET rating = rating * 0.92
--WHERE ID_purchaser NOT IN (
--    SELECT ID_purchaser
--    FROM Покупки
--    WHERE Type = 'оптовая' 
--);

--SELECT Date, AVG(Cost) AS Среднее
--FROM Покупки
--GROUP BY Date;

--SELECT F_purchaser, I_purchaser, O_purchaser
--FROM Покупатель
--WHERE ID_purchaser IN (
--    SELECT ID_purchaser
--    FROM Покупки
--    WHERE Cost > 1700
--);

--CREATE VIEW PurchasersWithHighRating AS
--SELECT F_purchaser, I_purchaser, O_purchaser
--FROM Покупатель
--WHERE F_purchaser LIKE 'В%' AND rating > (
--    SELECT AVG(rating)
--    FROM Покупатель
--);

--CREATE PROCEDURE GetPurchasersCountWithRating
--AS
--BEGIN
--    DECLARE @rating INT;
--    SET @rating = 123; -- задайте желаемый рейтинг здесь
    
--    DECLARE @purchaserCount INT;
    
--    SELECT @purchaserCount = COUNT(*)
--    FROM Покупатель
--    WHERE rating = @rating;
    
--    SELECT @purchaserCount AS PurchasersCount;
--END;

--CREATE TRIGGER check_post
--ON dbo.Поставщик AFTER INSERT, UPDATE
--AS
--BEGIN
--    IF (SELECT COUNT(*) FROM inserted WHERE Поставщик.Comis > 0.15) > 0
--    BEGIN
--        PRINT('Не должно быть больше 0.15 при модификации таблицы "Поставщик')
--        ROLLBACK TRANSACTION
--    END
--END

