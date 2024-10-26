--SELECT [DISTINCT][TOP] <список столбцов>
--FROM <источник>
--WHERE <условия>
--ORDER BY <сортировка>

USE p23_intro_db;

--SELECT *
--FROM products;

--SELECT
--	550 / 100 * 10,
--	SYSDATETIME(),
--	SIN(0) + COS(0);

--SELECT
--	123 / 10,
--	123.0 / 10,
--	123./10,
--	123/10.;

SELECT
	id,
	id / 100,
	CAST(id as float) / 100,
	CONVERT(float, id) / 100,
	id / 100.
FROM users;
