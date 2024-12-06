CREATE PROCEDURE uspInsertUser
	@email nvarchar(50),
	@nickname nvarchar(50),
	@password nvarchar(50),
	@birthday date
AS
BEGIN
	INSERT INTO users (email, nickname, password, birthday)
	VALUES (@email, @nickname, @password, @birthday)
END