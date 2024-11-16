CREATE TABLE users (
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	age tinyint NULL
);

CREATE TABLE images (
	id				int				PRIMARY KEY IDENTITY(1,1) NOT NULL,
	title			varchar(50)		NULL,
	description		nvarchar(250)	NULL,
	publish_date	smalldatetime	NOT NULL,
	link			varchar(128)	NOT NULL,
	user_id			int				NOT NULL
);