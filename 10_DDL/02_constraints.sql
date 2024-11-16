-- ==== PRIMARY KEY =====
-- 1. Допускается 1 PRIMARY KEY на таблицу
-- 2. Обеспечивается кластеризованным индексом

-- Определение при объявлении поля
--CREATE TABLE units (
--	id int PRIMARY KEY,
--	...
--);

-- Определение вне объявления поля
--CREATE TABLE units (
--	id int,
--	title varchar(50),
--	clan varchar(50),
--	-- ....,

--	-- 1 -- PRIMARY KEY (id)			-- одиночный ПК
--	-- 2 -- PRIMARY KEY (title, clan)	-- составной ПК

--	-- 3 -- CONSTRAINT PK_units_id PRIMARY KEY (id)		-- полная форма определения ПК
--);

-- Добавление после создания таблицы
--ALTER TABLE units
--ALTER COLUMN id int NOT NULL;

--ALTER TABLE units
---- ADD PRIMARY KEY (id);
--ADD CONSTRAINT PK_units_id PRIMARY KEY (id);




