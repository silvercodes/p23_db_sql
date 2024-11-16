---------- INSERT ----------

-- INSERT [INTO] <table> [(<fields...>)] VALUES (<values>)
-- INSERT [INTO] <table> [(<fields...>)] SELECT .....


--INSERT INTO albums (title, creation_date, user_id, rate) VALUES ('vasias album', GETDATE(), 1, 10);


--INSERT INTO albums (title, creation_date, user_id, rate) 
--VALUES 
--	('vasias album 2', GETDATE(), 1, 10),
--	('vasias album 3', GETDATE(), 1, 8),
--	('vasias album 4', GETDATE(), 1, 7),
--	('vasias album 5', GETDATE(), 1, 5);


-- Вставка в автоинкрементируемое поле
--SET IDENTITY_INSERT albums ON;

--INSERT INTO albums (id, title, creation_date, user_id, rate) 
--VALUES (1111, 'vasias album1111', GETDATE(), 1, 10);

--SET IDENTITY_INSERT albums OFF;

-- INSERT INTO albums (title, creation_date, user_id, rate) VALUES ('vasias album next', GETDATE(), 1, 10);


-- Вернуть при вставке значение идентификатора
--INSERT INTO albums (title, creation_date, user_id, rate) 
--OUTPUT inserted.id
--VALUES ('vasias hohoho', GETDATE(), 1, 10);


-- Вставка на основе выборки
--INSERT INTO customers
--SELECT nickname, email
--FROM users;



---------- UPDATE ----------
--UPDATE albums
--SET rate = 50
--WHERE rate = 12;

--UPDATE albums
--SET deleted_at = GETDATE()
--WHERE id = 3;


---------- DELETE ----------
-- удаление всех записей (без сброса счетчика)
-- DELETE FROM customers;

-- удаление всех записей (со сбросом счетчика)
-- TRUNCATE TABLE customers;

--DELETE FROM customers
--WHERE nickname = 'xxxx';

--DELETE TOP(50) PERCENT
--FROM customers;






