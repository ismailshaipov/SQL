--SELECT ����������.F_purchaser, ����������.I_purchaser, ����������.O_purchaser, ���������.Name_company
--FROM �������
--JOIN ���������� ON �������.ID_purchaser = ����������.ID_purchaser
--JOIN ��������� ON �������.ID_delivery = ���������.ID_delivery;

--SELECT �������.*
--FROM �������
--JOIN ������_������� ON �������.ID_purchase = ������_�������.ID_purchase
--JOIN ����� ON ������_�������.ID_product = �����.ID_product
--WHERE �����.Cost = (
--    SELECT MIN(Cost)
--    FROM �����
--)

--UPDATE ����������
--SET rating = rating * 0.92
--WHERE ID_purchaser NOT IN (
--    SELECT ID_purchaser
--    FROM �������
--    WHERE Type = '�������' 
--);

--SELECT Date, AVG(Cost) AS �������
--FROM �������
--GROUP BY Date;

--SELECT F_purchaser, I_purchaser, O_purchaser
--FROM ����������
--WHERE ID_purchaser IN (
--    SELECT ID_purchaser
--    FROM �������
--    WHERE Cost > 1700
--);

--CREATE VIEW PurchasersWithHighRating AS
--SELECT F_purchaser, I_purchaser, O_purchaser
--FROM ����������
--WHERE F_purchaser LIKE '�%' AND rating > (
--    SELECT AVG(rating)
--    FROM ����������
--);

--CREATE PROCEDURE GetPurchasersCountWithRating
--AS
--BEGIN
--    DECLARE @rating INT;
--    SET @rating = 123; -- ������� �������� ������� �����
    
--    DECLARE @purchaserCount INT;
    
--    SELECT @purchaserCount = COUNT(*)
--    FROM ����������
--    WHERE rating = @rating;
    
--    SELECT @purchaserCount AS PurchasersCount;
--END;

--CREATE TRIGGER check_post
--ON dbo.��������� AFTER INSERT, UPDATE
--AS
--BEGIN
--    IF (SELECT COUNT(*) FROM inserted WHERE ���������.Comis > 0.15) > 0
--    BEGIN
--        PRINT('�� ������ ���� ������ 0.15 ��� ����������� ������� "���������')
--        ROLLBACK TRANSACTION
--    END
--END

