-- TASK
-- Посчитать кол-во сотрудников по должностям

--SELECT
--	pos.title,
--	COUNT(emp.id) [Count]
--FROM positions pos
--	LEFT JOIN employees emp ON emp.position_id = pos.id
--GROUP BY pos.id, pos.title;

--SELECT
--	pos.title,
--	(
--		SELECT COUNT(emp.id)
--		FROM employees emp
--		WHERE emp.position_id = pos.id
--	) [Count]
--FROM positions pos;


----- EXISTS / NOT EXISTS -----

-- TASK
-- Показать пользователей, которые создавали альбомы

--SELECT DISTINCT usr.nickname
--FROM albums alb
--	LEFT JOIN users usr ON alb.user_id = usr.id

--SELECT usr.nickname
--FROM albums alb
--	LEFT JOIN users usr ON alb.user_id = usr.id
--GROUP BY usr.id, usr.nickname

--SELECT usr.nickname
--FROM users usr
--WHERE EXISTS (
--	SELECT id
--	FROM albums alb
--	WHERE alb.user_id = usr.id
--)

-- TASK
-- Показать пользователей, которые не создавали альбомы

--SELECT usr.nickname
--FROM users usr
--WHERE NOT EXISTS (
--	SELECT id
--	FROM albums alb
--	WHERE alb.user_id = usr.id
--)


-- TASK
-- Показать пользователей, у которых более 1 альбома (2 и более)

--SELECT usr.nickname
--FROM users usr
--WHERE 
--	(
--		SELECT COUNT(id)
--		FROM albums alb
--		WHERE alb.user_id = usr.id
--	) > 1;


--SELECT usr.nickname
--FROM users usr
--WHERE EXISTS 
--	(
--		SELECT alb.user_id
--		FROM albums alb
--		WHERE alb.user_id = usr.id
--		GROUP BY alb.user_id
--		HAVING COUNT(alb.user_id) > 1
--	);


--SELECT usr.nickname
--FROM users usr
--WHERE usr.id IN
--	(
--		SELECT alb.user_id
--		FROM albums alb
--		WHERE alb.user_id = usr.id
--		GROUP BY alb.user_id
--		HAVING COUNT(alb.user_id) > 1
--	);



----- ALL / ANY -----
-- TASK
-- Вывести пользователей, у которых есть альбомы с рейтингом 5

--SELECT id, email
--FROM users
--WHERE id = ANY 
--	(
--		SELECT user_id
--		FROM albums
--		WHERE rate = 5
--	);

--SELECT id, email
--FROM users
--WHERE id IN
--	(
--		SELECT user_id
--		FROM albums
--		WHERE rate = 5
--	);

--SELECT id, email
--FROM users u
--WHERE EXISTS 
--	(
--		SELECT a.id
--		FROM albums a
--		WHERE a.user_id = u.id AND a.rate = 5
--	);


-- TASK
-- Выбрать пользователей, у которых альбомы имеют максимальный рейтинг

--SELECT u.email
--FROM albums a LEFT JOIN users u ON a.user_id = u.id
--WHERE ISNULL(a.rate, 0) = (
--	SELECT MAX(rate)
--	FROM albums
--);


SELECT email
FROM users
WHERE id IN (
	SELECT user_id
	FROM albums
	WHERE rate = (
		SELECT MAX(rate)
		FROM albums
	)
);
















