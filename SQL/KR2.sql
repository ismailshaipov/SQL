SELECT Ïîêóïàòåëü.F_purchaser, Ïîêóïàòåëü.I_purchaser, Ïîêóïàòåëü.O_purchaser, Ïîñòàâùèê.Name_company
FROM Ïîêóïêè
JOIN Ïîêóïàòåëü ON Ïîêóïêè.ID_purchaser = Ïîêóïàòåëü.ID_purchaser
JOIN Ïîñòàâùèê ON Ïîêóïêè.ID_delivery = Ïîñòàâùèê.ID_delivery;

SELECT Ïîêóïêè.*
FROM Ïîêóïêè
JOIN Ñîñòàâ_Ïîêóïêè ON Ïîêóïêè.ID_purchase = Ñîñòàâ_Ïîêóïêè.ID_purchase
JOIN Òîâàð ON Ñîñòàâ_Ïîêóïêè.ID_product = Òîâàð.ID_product
WHERE Òîâàð.Cost = (
   SELECT MIN(Cost)
   FROM Òîâàð
)

UPDATE Ïîêóïàòåëü
SET rating = rating * 0.92
WHERE ID_purchaser NOT IN (
   SELECT ID_purchaser
   FROM Ïîêóïêè
   WHERE Type = 'îïòîâàÿ' 
);

SELECT Date, AVG(Cost) AS Ñðåäíåå
FROM Ïîêóïêè
GROUP BY Date;

SELECT F_purchaser, I_purchaser, O_purchaser
FROM Ïîêóïàòåëü
WHERE ID_purchaser IN (
   SELECT ID_purchaser
   FROM Ïîêóïêè
   WHERE Cost > 1700
);

CREATE VIEW PurchasersWithHighRating AS
SELECT F_purchaser, I_purchaser, O_purchaser
FROM Ïîêóïàòåëü
WHERE F_purchaser LIKE 'Â%' AND rating > (
   SELECT AVG(rating)
   FROM Ïîêóïàòåëü
);

CREATE PROCEDURE GetPurchasersCountWithRating
AS
BEGIN
   DECLARE @rating INT;
   SET @rating = 123; -- çàäàéòå æåëàåìûé ðåéòèíã çäåñü
    
   DECLARE @purchaserCount INT;
    
   SELECT @purchaserCount = COUNT(*)
   FROM Ïîêóïàòåëü
   WHERE rating = @rating;
    
   SELECT @purchaserCount AS PurchasersCount;
END;

CREATE TRIGGER check_post
ON dbo.Ïîñòàâùèê AFTER INSERT, UPDATE
AS
BEGIN
   IF (SELECT COUNT(*) FROM inserted WHERE Ïîñòàâùèê.Comis > 0.15) > 0
   BEGIN
       PRINT('Íå äîëæíî áûòü áîëüøå 0.15 ïðè ìîäèôèêàöèè òàáëèöû "Ïîñòàâùèê')
       ROLLBACK TRANSACTION
   END
END

