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












