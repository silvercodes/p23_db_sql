--COUNT(*)
--COUNT(<field>)
--COUNT(DISTINCT <field>)
--SUM(<field>)
--AVG(<field>)
--MIN(<field>)
--MAX(<field>)


--SELECT
--	'const value',
--	COUNT(*) [Общее кол-во записей],
--	COUNT(department_id) [Кол-во не NULL значений в department_id],
--	COUNT(DISTINCT department_id) [Кол-во уникальных отделов],
--	COUNT(DISTINCT position_id) [Кол-во уникальных должностей],
--	COUNT(bonus_percent) [Кол-во сотрудников, у которых определён bonus_percent],
--	MAX(bonus_percent),
--	MIN(bonus_percent),
--	SUM(salary / 100 * bonus_percent) [Сумма денег на премии],
--	AVG(salary / 100 * bonus_percent) [Средняя сумма премии],
--	AVG(salary) [Средняя ЗП]
--FROM employees;


--SELECT
--	'const value',
--	COUNT(*) [Общее кол-во записей],
--	COUNT(department_id) [Кол-во не NULL значений в department_id],
--	COUNT(DISTINCT department_id) [Кол-во уникальных отделов],
--	COUNT(DISTINCT position_id) [Кол-во уникальных должностей],
--	COUNT(bonus_percent) [Кол-во сотрудников, у которых определён bonus_percent],
--	MAX(bonus_percent),
--	MIN(bonus_percent),
--	SUM(salary / 100 * bonus_percent) [Сумма денег на премии],
--	AVG(salary / 100 * bonus_percent) [Средняя сумма премии],
--	AVG(salary) [Средняя ЗП]
--FROM employees
--WHERE department_id = 3;



--SELECT
--	SUM(salary),
--	ISNULL(SUM(salary), 0)
--FROM
--	employees
--WHERE
--	department_id = 30