--CREATE PROCEDURE uspGetUsers
--AS
--BEGIN
--	SELECT id, email
--	FROM users
--	WHERE email LIKE 'a%'
--END

-- EXECUTE uspGetUsers;
-- EXEC uspGetUsers;


-- parameters --
--CREATE PROCEDURE uspSum
--	@a int,
--	@b int,
--	@result int OUTPUT
--AS
--BEGIN
--	SET @result = @a + @b;
--END;

--DECLARE @res int;

--EXECUTE uspSum 
--	@a = 17, 
--	@b = 34, 
--	@result = @res OUTPUT;

--SELECT @res;



--CREATE PROCEDURE uspFindUserIdByEmail
--	@email NVARCHAR(50)
--AS
--BEGIN

--	IF @email IS NOT NULL
--	BEGIN
--		DECLARE @findedId int
--		SELECT @findedId = id FROM users WHERE email = @email
--		RETURN @findedId
--	END
--	ELSE
--		RAISERROR('NULL received!', 0, 1)
--END;

DECLARE @id int
EXECUTE @id = uspFindUserIdByEmail 'gchattertonn@free.fr'
SELECT @id;


