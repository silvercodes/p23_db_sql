---- UNIONS -----

-- UNION ALL	Все строки из А и Б
-- UNION		Все уникальные строки из А и Б
-- EXCEPT		Все уникальные строки А, которые отсутствуют в Б
-- INTERSECT	Уникальные строки, присутствующие и в А и в Б

-- TASK
-- Посчитать кол-во сотрудников, родившихся в разные времена года

SELECT
	'Spring' [Season],
	COUNT(id)  [Count]
FROM employees
WHERE MONTH(birthday) IN (3, 4, 5)

UNION ALL
SELECT
	'Summer' [Season],
	COUNT(id)  [Count]
FROM employees
WHERE MONTH(birthday) IN (6, 7, 8)

UNION ALL
SELECT
	'Fall' [Season],
	COUNT(id)  [Count]
FROM employees
WHERE MONTH(birthday) IN (9, 10, 11)

UNION ALL
SELECT
	'Winter' [Season],
	COUNT(id)  [Count]
FROM employees
WHERE MONTH(birthday) IN (12, 1, 2);

