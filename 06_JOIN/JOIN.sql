--- Типы JOIN'ов ---
--JOIN (INNER JOIN)
--LEFT JOIN (LEFT OUTER JOIN)
--RIGHT JOIN (RIGHT OUTER JOIN)
--FULL JOIN (FULL OUTER JOIN)
--CROSS JOIN (CROSS OUTER JOIN)


--SELECT *
--FROM employees, departments;

---- JOIN -----
--SELECT *
--FROM employees emp INNER JOIN departments dep ON emp.department_id = dep.id;

--SELECT *
--FROM departments dep INNER JOIN employees emp ON emp.department_id = dep.id;

---- LEFT JOIN ----
--SELECT *
--FROM employees emp LEFT JOIN departments dep ON emp.department_id = dep.id;

--SELECT *
--FROM departments dep LEFT JOIN employees emp ON emp.department_id = dep.id;


----- RIGHT JOIN -----
--SELECT *
--FROM departments dep RIGHT JOIN employees emp ON emp.department_id = dep.id;

---- FULL JOIN ------
--SELECT *
--FROM employees emp FULL JOIN departments dep ON emp.department_id = dep.id;

---- CROSS JOIN -----
--SELECT *
--FROM employees emp CROSS JOIN departments dep;


-- TASK
-- Вернуть кол-во сотрудников по должностям (Должность|Количество)

--SELECT
--	position_id,
--	COUNT(id)
--FROM employees
--GROUP BY position_id

--SELECT
--	pos.title [Должность],
--	COUNT(emp.id) [Количество]
--FROM positions pos LEFT JOIN employees emp ON pos.id = emp.position_id
--GROUP BY pos.id, pos.title;



-- TASK
-- Вывести сотрудников, которые родились в 1982 году с информацией об их должности и отделе
-- (....что-то о сотруднике|Название_должности|Название_отдела)

--SELECT
--	emp.id,
--	emp.email,
--	emp.name,
--	pos.title AS [Должность],
--	dep.title AS [Отдел]
--FROM employees emp
--	LEFT JOIN positions pos ON emp.position_id = pos.id
--	LEFT JOIN departments dep ON emp.department_id = dep.id
--WHERE
--	YEAR(birthday) = 1982;


-- TASK
-- Для каждого отдела вывести последнего нанятого сотрудника

--SELECT
--	dep.title [Отдел],
--	MAX(hire_date)
--FROM departments dep
--	LEFT JOIN employees emp ON dep.id = emp.department_id
--GROUP BY dep.id, dep.title

--SELECT *
--FROM departments dep LEFT JOIN 
--	(
--		SELECT
--			emp.department_id,
--			MAX(hire_date) AS [hire_date]
--		FROM employees emp
--		WHERE department_id IS NOT NULL
--		GROUP BY department_id

--	) lastEmp ON dep.id = lastEmp.department_id

--SELECT 
--	dep.title,
--	emp.name,
--	emp.hire_date
--FROM departments dep 
--	LEFT JOIN employees emp ON dep.id = emp.department_id
--	JOIN
--	(
--		SELECT 
--			MAX(id) [maxEmpId]
--		FROM employees
--		GROUP BY department_id
--	) lastEmp ON emp.id = lastEmp.maxEmpId



-- TASK
-- Посчитать кол-во пользователей по каждому отделу для каждой должности
-- (department | position | count)

--SELECT 
--	dep.title [Department],
--	pos.title [Position],
--	COUNT(emp.id) [Count]
--FROM departments dep
--	CROSS JOIN positions pos
--	LEFT JOIN employees emp ON emp.department_id = dep.id AND emp.position_id = pos.id
--GROUP BY dep.id, dep.title, pos.id, pos.title

SELECT
	dep.title [Department],
	pos.title [Position],
	ISNULL(e.users_count, 0) [Count]
FROM departments dep
	CROSS JOIN positions pos
	LEFT JOIN
	(
		SELECT 
			department_id, 
			position_id, 
			COUNT(id) [users_count]
		FROM employees
		GROUP BY department_id, position_id
	) e ON e.department_id = dep.id AND e.position_id = pos.id
ORDER BY dep.title, pos.title;














