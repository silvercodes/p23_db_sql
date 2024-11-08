--SELECT 
--	id, first_name, last_name, department_id, salary
--FROM employees
--WHERE department_id = 3
--ORDER BY last_name, first_name;

-- ORDER BY		3
-- TOP			4
-- DISTINCT		2
-- WHERE		1

-- Определеить максимальную ЗП в отделе 3
--SELECT DISTINCT TOP 1
--	salary
--FROM employees
--WHERE department_id = 3
--ORDER BY salary DESC;

-- Выбрать пользователей у которых не указан отдел
--SELECT *
--FROM employees
---- WHERE department_id = NULL;			-- :-(((
--WHERE department_id IS NULL;				-- :-)))

-- Выбрать пользователей у которых есть начальник
--SELECT *
--FROM employees
--WHERE manager_id IS NOT NULL;

-- Посчитать бонусы всех сотрудников у которых определён bonus_percent
--SELECT
--	id,
--	name,
--	email,
--	ISNULL(salary, 0) / 100 * bonus_percent AS bonus
--FROM employees
---- WHERE bonus_percent IS NOT NULL AND bonus_percent > 0
---- WHERE NOT(bonus_percent <= 0 OR bonus_percent IS NULL)
--WHERE ISNULL(bonus_percent, 0) <> 0 AND bonus_percent > 0;


--------------- BETWEEN / IN ------------

--SELECT id, name, salary, department_id
--FROM employees

-- continue...

-- WHERE salary >= 2000 AND salary <= 3000;
-- WHERE salary BETWEEN 2000 AND 3000;

-- WHERE salary < 2000 OR salary > 3000;
-- WHERE NOT(salary >= 2000 AND salary <= 3000);
-- WHERE salary NOT BETWEEN 2000 AND 3000;

--WHERE salary BETWEEN 2000 AND 3000
--	AND department_id = 3;

-- WHERE department_id = 3 OR department_id = 4;
-- WHERE department_id IN (3, 4);

-- WHERE department_id NOT IN (3, 4);

-- WHERE department_id IN (3, 4, NULL);			-- NULL в IN ПЛОХО!!!!!
--WHERE department_id IN (3, 4)
--	OR department_id IS NULL					-- :-)))
-- WHERE ISNULL(department_id, -1) IN (3, 4, -1);	-- :-)))

-- Выбрать всех сотрудников кроме тех у которых отдел = 1 или не определён
--SELECT *
--FROM employees
---- WHERE department_id IS NOT NULL AND department_id NOT IN (1);
--WHERE ISNULL(department_id, -1) NOT IN (1, -1);

----------------- LIKE ---------------
--		_		любой одиночный символ
--		%		любые символы в любом кол-ве
--		[abc]	перечень символов			N'с[оа]бака'
--		[a-f]	диапазон
--		[^abc]	перечень исключённых значений


--SELECT *
--FROM employees

-- WHERE name LIKE N'Пет%';
-- WHERE last_name LIKE N'%ов';
-- WHERE last_name LIKE N'%ре%';
-- WHERE email LIKE '%.net';
-- WHERE email LIKE 'b%';
-- WHERE email LIKE '%.c__';
-- WHERE email LIKE '%.[cbd]om';

-- WHERE email LIKE '%.!%__' ESCAPE '!';
-- WHERE email LIKE '%!_%' ESCAPE '!';

-- WHERE LOWER(email) LIKE '%.com';			-- :-)))


---------- Дата / время ------------
--SELECT *
--FROM employees
--WHERE birthday BETWEEN '19800101' AND '19891231'
--ORDER BY birthday;

--SELECT *
--FROM employees
--WHERE YEAR(birthday) = 1982;

-- Выбрать пользователей, у которых сегодня ДР
--SELECT *
--FROM employees
--WHERE MONTH(birthday) = MONTH(GETDATE()) AND DAY(birthday) = DAY(GETDATE())

-- DECLARE @d date = '20001223';

-- SELECT DATEDIFF(year, @d, GETDATE());

--DECLARE @d datetime = DATEFROMPARTS(2000, 12, 23);
--SELECT @d;

SELECT CONVERT(DATE, '20001223', 104);




