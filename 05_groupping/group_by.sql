
--SELECT
--	'department 1',
--	COUNT(*),
--	COUNT(position_id),
--	COUNT(DISTINCT position_id)
--FROM
--	employees
--WHERE
--	department_id = 1;

--SELECT
--	'department 2',
--	COUNT(*),
--	COUNT(position_id),
--	COUNT(DISTINCT position_id)
--FROM
--	employees
--WHERE
--	department_id = 2;

--SELECT
--	'department 3',
--	COUNT(*),
--	COUNT(position_id),
--	COUNT(DISTINCT position_id)
--FROM
--	employees
--WHERE
--	department_id = 3;



--SELECT
--	department_id,
--	-- email,			-- ERROR
--	COUNT(*),
--	COUNT(position_id),
--	COUNT(DISTINCT position_id)
--FROM
--	employees
--GROUP BY department_id;


-- Сгруппировать сотрудников (кол-во) по году рождения
--SELECT
--	YEAR(birthday) AS year,
--	COUNT(id) AS count
--FROM employees
--GROUP BY YEAR(birthday)


-- Вывести кол-во сотрудников по годам по каждому отделу
--SELECT 
--	department_id,
--	CONCAT(N'Год рождения: ', YEAR(birthday)) AS YearOfBirthday,
--	COUNT(id) AS EmployeesCount
--FROM employees
--WHERE department_id IS NOT NULL
--GROUP BY YEAR(birthday), department_id;



--SELECT 
--	CASE department_id
--		WHEN 1 THEN 'administration'
--		WHEN 2 THEN 'accounting'
--		WHEN 3 THEN 'it'
--		ELSE 'Extra'
--	END AS DepartmentName,
--	CONCAT(N'Год рождения: ', YEAR(birthday)) AS YearOfBirthday,
--	COUNT(id) AS EmployeesCount
--FROM employees
--WHERE department_id IS NOT NULL
--GROUP BY YEAR(birthday), department_id;




-- TASK *
-- Получить сводную таблицу в разрезе отделов,
-- посчитать суммарную ЗП в разбивке по должностям

--SELECT
--	CASE department_id
--		WHEN 1 THEN 'Administration'
--		WHEN 2 THEN 'Accounting'
--		WHEN 3 THEN 'IT'
--		ELSE 'Extra'
--	END AS DepartmentName,
--	ISNULL(SUM(CASE WHEN position_id = 1 THEN salary END), 0) AS Bookers,
--	ISNULL(SUM(CASE WHEN position_id = 2 THEN salary END), 0) AS Directors,
--	ISNULL(SUM(CASE WHEN position_id = 3 THEN salary END), 0) AS Developers,
--	ISNULL(SUM(CASE WHEN position_id = 4 THEN salary END), 0) AS Teamleads,
--	ISNULL(SUM(CASE WHEN position_id = 5 THEN salary END), 0) AS Маркетологи,
--	ISNULL(SUM(CASE WHEN position_id = 6 THEN salary END), 0) AS Логиста,
--	ISNULL(SUM(CASE WHEN position_id = 7 THEN salary END), 0) AS Кладовщики,
--	ISNULL(SUM(salary), 0) AS SalarySum
--FROM employees
--GROUP BY department_id



--CREATE VIEW EmplInfoView
--AS
--	SELECT 
--		emp.*,
--		dep.title AS DepTitle,
--		pos.title AS PosTitle
--	FROM
--		employees emp LEFT JOIN departments dep ON emp.department_id = dep.id
--		LEFT JOIN positions pos ON emp.position_id = pos.id;

--SELECT *
--FROM EmplInfoView;

--SELECT
--	PosTitle,
--	SUM(salary)
--FROM EmplInfoView
--GROUP BY PosTitle




----- ========= HAVING ======== ------

--SELECT
--	department_id,
--	SUM(salary) AS sum_of_salary
--FROM employees
--GROUP BY department_id
--HAVING SUM(salary) > 6000;

--SELECT
--	department_id,
--	SUM(salary) AS sum_of_salary
--FROM employees
--GROUP BY department_id
--HAVING SUM(salary) > 6000 AND COUNT(id) > 1;


-- :-(((
--SELECT
--	department_id,
--	SUM(salary) AS sum_of_salary
--FROM employees
--GROUP BY department_id
--HAVING department_id = 1;

-- :-)))
--SELECT
--	department_id,
--	SUM(salary) AS sum_of_salary
--FROM employees
--WHERE department_id = 1
--GROUP BY department_id;


-- ...DISTINCT	5
-- ...TOP		7
-- SELECT		4
-- FROM			0
-- WHERE		1		<-- !!! первоначальная фильтрация
-- GROUP BY		2
-- HAVING		3		<-- !!! особое внимание
-- ORDER BY		6