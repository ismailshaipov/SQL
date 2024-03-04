--CREATE TRIGGER check_salary 
--ON Posts AFTER INSERT, UPDATE
--AS
--BEGIN
--    IF (SELECT COUNT(*) FROM inserted WHERE P_SAL < 10000) > 0
--    BEGIN
--        PRINT('Значение оклада должно быть не менее 10000.')
--        ROLLBACK TRANSACTION
--    END
--END

--CREATE TRIGGER items_check
--ON Items AFTER INSERT
--AS
--BEGIN
--    IF (SELECT B_CIRCUL from Books WHERE B_CONTRACT = (SELECT B_ID FROM inserted)) < (SELECt B_COUNT from inserted)
--    BEGIN
--        PRINT('Количество отпускаемых книг не должно превышать количество тиража.')
--        ROLLBACK TRANSACTION
--    END
--END

--CREATE TRIGGER cost_check
--ON Customers for delete
--AS
--BEGIN
--    IF (SELECT O_COMPANY from Orders) = (SELECT C_ID FROM deleted)
--    BEGIN
--        PRINT('Запрещено удалять запись из таблицы «Заказчики», если с ней связаны записи из других таблиц.')
--        ROLLBACK TRANSACTION
--    END
--END

CREATE TRIGGER check_pricebook
ON Books AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE B_PRICE > 600) > 0
    BEGIN
        PRINT('Значение цены книги не должно быть больше 600.')
        ROLLBACK TRANSACTION
    END
END

CREATE TRIGGER check_addrauthors
ON Authors AFTER INSERT, UPDATE
AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted WHERE A_ADDR = 'Москва') > 0
    BEGIN
        PRINT('Автор не должен быть из Моксвы.')
        ROLLBACK TRANSACTION
    END
END