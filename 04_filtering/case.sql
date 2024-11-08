-- -- 1 FORM
-- CASE
--     WHEN <condition_1> THEN <value_1>
--     ...
--     WHEN <condition_n> THEN <value_n>
--     ...
--     [ELSE value_default]
-- END

-- -- 2 FORM
-- CASE <value>
--     WHEN <case_value_1> THEN <value_1>
--     ...
--     WHEN <case_value_n> THEN <value_n>
--     ...
--     [ELSE value_default]
-- END

-- -- 3 FORM (синтаксический сахар, аналог тернарного оператора)
-- IIF(<condition>, <value_if_true>, <value_if_false>)


USE p23_company_db;

--SELECT
--	id, 
--	name, 
--	salary,
--	CASE
--		WHEN salary >= 3000 THEN 'Salary >= 3000'
--		WHEN salary >= 2000 THEN 'Salary >= 2000'
--		ELSE 'Salary < 2000'
--	END AS Comment
--FROM employees;

-- Расчитать размер премии по принципу: it (30%), accounting(10%), other (5%)
-- id, name, salary, department_id, bonus_percent, bonus

--SELECT
--	id, 
--	name, 
--	salary, 
--	department_id,

--	CASE department_id
--		WHEN 3 THEN '30%'
--		WHEN 2 THEN '20%'
--		ELSE '5%'
--	END AS bonus_percent,

--	salary / 100 *
--		CASE department_id
--			WHEN 3 THEN 30
--			WHEN 2 THEN 30
--			ELSE 5
--		END AS bonus
		
--FROM employees;


-- Отсортировать пользователей по приоритету получения ЗП
-- сначала те, у которых <= 2500, затем все остальные
-- в рамках каждой "группы" отсортировать по name

SELECT
	id, name, salary
FROM
	employees
ORDER BY
	-- CASE WHEN salary <= 2500 THEN 'B' ELSE 'A' END,
	IIF(salary <= 2500, 'B', 'A'),
	name;
