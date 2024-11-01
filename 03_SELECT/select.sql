--SELECT [DISTINCT][TOP] <список столбцов>
--FROM <источник>
--WHERE <условия>
--ORDER BY <сортировка>

--USE p23_intro_db;

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

--SELECT
--	id,
--	id / 100,
--	CAST(id as float) / 100,
--	CONVERT(float, id) / 100,
--	id / 100.
--FROM users;

--USE p23_company_db;

--SELECT
--	employees.id, employees.email
--FROM employees;

--SELECT
--	e.id, e.email
----FROM employees AS e;
--FROM employees e;

--SELECT id, email, birthday
--FROM employees;

--SELECT
--	--*								-- :-(((
--	id, name, birthday, email		-- :-)))
--FROM employees;


USE p23_company_db;

-------- DISTINCT --------

--SELECT DISTINCT id, department_id
--FROM employees;

--SELECT DISTINCT position_id, department_id
--FROM employees;

-- Какие отделы задействованы в фирме?
--SELECT DISTINCT
--	department_id
--FROM employees;

-- Вывести информацию о том, в каких отделах какие должности фигурируют?
--SELECT DISTINCT department_id, position_id
--FROM employees;

------------ Псевдонимы для столбцов / расчётные столбцы

-- SELECT * FROM employees;

--SELECT
--	last_name + ' ' + first_name AS FULL_NAME,
--	hire_date AS [Дата приёма],
--	salary AS ЗП
--FROM employees;

--SELECT
--	last_name + ' ' + first_name + ' ' + middle_name AS FULL_NAME,
--	hire_date AS [Дата приёма],
--	salary AS ЗП
--FROM employees;

--SELECT
--	last_name + ' ' + first_name + ' ' + middle_name AS full_name_1,
--	ISNULL(last_name, '') + ' ' + ISNULL(first_name, '') + ' ' + ISNULL(middle_name, '') AS full_name_2,
--	CONCAT(last_name, ' ', first_name, ' ', middle_name) AS full_name_3
--FROM employees;

--SELECT
--	id,
--	name,
--	salary / 100 * bonus_percent AS res_1,
--	salary / 100 * ISNULL(bonus_percent, 0) AS res_2,
--	salary / 100 * COALESCE(bonus_percent, 0) AS res_3
--FROM employees;

--SELECT id, name
--FROM employees
--WHERE id % 2 = 0;


-------------- ORDER BY --------------
--SELECT
--	last_name,
--	first_name,
--	salary
--FROM employees
--ORDER BY last_name DESC;

--SELECT
--	last_name,
--	first_name,
--	salary
--FROM employees
--ORDER BY
--	salary ASC,
--	last_name DESC;

--SELECT 
--	last_name, 
--	first_name
--FROM employees
--ORDER BY salary;

-- Выбрать 3-х сотрудников с наибольшей ЗП
-- :-( Неоднозначность результата!!!
--SELECT TOP 3
--	id, last_name, first_name
--FROM employees
--ORDER BY salary DESC;
-- :-) Определённость результата!!!
--SELECT TOP 3
--	id, last_name, first_name
--FROM employees
--ORDER BY 
--	salary DESC,
--	birthday,
--	id DESC;

--SELECT DISTINCT first_name, last_name	-- << DISTINCT
--FROM employees
--ORDER BY salary						-- ERROR!

--SELECT id, name
--FROM employees
--ORDER BY CONCAT(first_name, ' ', last_name);

--SELECT 
--	id, 
--	CONCAT(first_name, ' ', last_name) AS full_name
--FROM employees
--ORDER BY full_name

SELECT
	id,
	name,
	bonus_percent
FROM employees
ORDER BY bonus_percent













