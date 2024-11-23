-- Один-ко-многим --

--CREATE TABLE roles (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title varchar(50) NOT NULL
--);

--CREATE TABLE users (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	email varchar(50) UNIQUE NOT NULL,
--	role_id int NOT NULL,

--	CONSTRAINT FK_users_roles FOREIGN KEY (role_id) REFERENCES roles(id)
--);


-- Один-к-одному --
-- profiles (avatar, address, phone....)
-- clients (email, pass, age)

--CREATE TABLE profiles (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	photo_path varchar(100) NULL
--);

--CREATE TABLE clients (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	email varchar(50) UNIQUE NOT NULL,
--	profile_id int UNIQUE,

--	CONSTRAINT FK_clients_profile FOREIGN KEY (profile_id) REFERENCES profiles(id)
--);


--CREATE TABLE profiles (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	photo_path varchar(100) NULL
--);

--CREATE TABLE clients (
--	id int PRIMARY KEY NOT NULL,
--	email varchar(50) UNIQUE NOT NULL,

--	CONSTRAINT FK_clients_profile FOREIGN KEY (id) REFERENCES profiles(id)
--);



--CREATE TABLE clients (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	email varchar(50) UNIQUE NOT NULL,
--);

--CREATE TABLE profiles (
--	id int PRIMARY KEY NOT NULL,
--	photo_path varchar(100) NULL,

--	CONSTRAINT FK_profiles_client FOREIGN KEY (id) REFERENCES clients(id)
--);




--======  Многие-ко-многим =======--

--class Teacher
--{
--	List<Group> groups;
--}

--class Group
--{
--	List<Teacher> teachers;
--}


--CREATE TABLE teachers (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	full_name nvarchar(50) NOT NULL
--);

--CREATE TABLE groups (
--	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
--	title nvarchar(50) NOT NULL
--);

--CREATE TABLE groups_teachers (
--	teacher_id int NOT NULL,
--	group_id int NOT NULL,

--	CONSTRAINT PK_groups_teachers PRIMARY KEY (teacher_id, group_id),
--	CONSTRAINT FK_groups_teachers_teachers FOREIGN KEY (teacher_id) REFERENCES teachers(id),
--	CONSTRAINT FK_groups_teachers_groups FOREIGN KEY (group_id) REFERENCES groups(id)
--);

--INSERT INTO teachers (full_name)
--VALUES ('vasia'), ('petya'), ('dima');

--INSERT INTO groups (title)
--VALUES ('gr_101'), ('gr_102'), ('gr_103')

--drop table groups_teachers;
--drop table teachers;
--drop table groups;







CREATE TABLE teachers (
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	full_name nvarchar(50) NOT NULL
);

CREATE TABLE groups (
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	title nvarchar(50) NOT NULL
);

CREATE TABLE groups_teachers (
	id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	teacher_id int NOT NULL,
	group_id int NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NULL,
	status tinyint NOT NULL DEFAULT(0),

	CONSTRAINT UQ_teacher_id_group_id UNIQUE(teacher_id, group_id),
	CONSTRAINT FK_groups_teachers_teachers FOREIGN KEY (teacher_id) REFERENCES teachers(id),
	CONSTRAINT FK_groups_teachers_groups FOREIGN KEY (group_id) REFERENCES groups(id)
);

INSERT INTO teachers (full_name)
VALUES ('vasia'), ('petya'), ('dima');

INSERT INTO groups (title)
VALUES ('gr_101'), ('gr_102'), ('gr_103')

drop table groups_teachers;
drop table teachers;
drop table groups;



