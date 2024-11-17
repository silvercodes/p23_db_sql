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



-- ====== FOREIGN KEY =======

--CREATE TABLE roles (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(50) NOT NULL
--);

--CREATE TABLE users (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	email varchar(50) UNIQUE NOT NULL,
--	role_id int NOT NULL,

--	CONSTRAINT FK_users_roles FOREIGN KEY (role_id) REFERENCES roles(id)
--);

--INSERT INTO roles (title)
--VALUES
--	('admin'),
--	('guest'),
--	('author');

--INSERT INTO users (email, role_id)
--VALUES
--	('vasia1@mail.com', 1),
--	('vasia2@mail.com', 2),
--	('vasia3@mail.com', 2);

--INSERT INTO users (email, role_id)
--VALUES ('vasia4@mail.com', 10);






--CREATE TABLE roles (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(50) NOT NULL
--);

--CREATE TABLE users (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	email varchar(50) UNIQUE NOT NULL,
--	role_id int NOT NULL DEFAULT(4),

--	CONSTRAINT FK_users_roles FOREIGN KEY (role_id) REFERENCES roles(id)
--		-- ON DELETE NO ACTION			-- по-умолчанию
--		-- ON DELETE CASCADE			-- каскадное удаление (ОСТОРОЖНО!!!)
--		-- ON DELETE SET NULL			-- установить NULL для поля внешнего ключа
--		ON DELETE SET DEFAULT			-- установить значение по-умолчанию

--		-- ON UPDATE NO ACTION			-- по-умолчанию
--		-- ON UPDATE CASCADE			-- каскадное удаление (ОСТОРОЖНО!!!)
--		-- ON UPDATE SET NULL			-- установить NULL для поля внешнего ключа
--		-- ON UPDATE SET DEFAULT		-- установить значение по-умолчанию
--);

--INSERT INTO roles (title)
--VALUES
--	('admin'),
--	('guest'),
--	('author'),
--	('default');

--INSERT INTO users (email, role_id)
--VALUES
--	('vasia1@mail.com', 1),
--	('vasia2@mail.com', 2),
--	('vasia3@mail.com', 2);

--DELETE FROM roles WHERE id = 1;

--DROP TABLE users;
--DROP TABLE roles;




-- ====== NOT NULL =======
--CREATE TABLE permissions (
--	id int PRIMARY KEY IDENTITY(1,1)		NOT NULL,
--	title varchar(50)						NOT NULL,
--	description varchar(256)				NULL
--);

--INSERT INTO permissions(title, description)
--VALUES
--	('read', 'read the data'),
--	('write', NULL);

--UPDATE permissions
--SET description = 'no_description'
--WHERE description IS NULL;

---- добавление
--ALTER TABLE permissions
--ALTER COLUMN description varchar(256) NOT NULL

---- удаление
--ALTER TABLE permissions
--ALTER COLUMN description varchar(256) NULL

--DROP TABLE permissions;




-- ====== UNIQUE =======

--CREATE TABLE roles (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(50) NOT NULL
--);

--CREATE TABLE users (
--	id int IDENTITY(1,1)	NOT NULL,
--	email varchar(50)		NOT NULL,
--	username varchar(50)	NOT NULL,
--	role_id int				NOT NULL,

--	CONSTRAINT PK_users_id PRIMARY KEY(id),
--	CONSTRAINT UQ_users_email UNIQUE(email),
--	CONSTRAINT FK_users_role FOREIGN KEY (role_id) REFERENCES roles(id)
--);

---- добавление
--ALTER TABLE users
--ADD CONSTRAINT UQ_users_username UNIQUE(username)

---- удаление
--ALTER TABLE users
--DROP CONSTRAINT UQ_users_username;





-- ====== CHECK =======
--CREATE TABLE products (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(100) NOT NULL,

--	-- price decimal(10, 2) CHECK(price > 0)

--	price decimal(10, 2),
--	CONSTRAINT CK_products_price CHECK (price > 0)
--);


--CREATE TABLE products (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(100) NOT NULL,

--	price decimal(10, 2) CHECK(price > 0),
--	discount_price decimal(10, 2) CHECK (discount_price > 0),

--	CONSTRAINT CK_products_price_discount_price CHECK (discount_price < price)
--);


--CREATE TABLE products (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(100) NOT NULL,

--	price decimal(10, 2) NOT NULL,
--	discount_price decimal(10, 2) NOT NULL,

--	CONSTRAINT CK_products_price
--		CHECK (price > 0),

--	CONSTRAINT CK_products_discount_price
--		CHECK (discount_price > 0 AND discount_price < price)
--);

--ALTER TABLE products
--ADD CONSTRAINT CK_products_title_length CHECK(LEN(title) > 10)





