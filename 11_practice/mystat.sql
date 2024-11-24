-- student
-- teacher
--> homework
--> --> pair
-- subject
-- group

CREATE TABLE subjects (
    id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    title nvarchar(128) NOT NULL,
    deleted_at datetime NULL
);

CREATE TABLE groups (
    id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    title nvarchar(128) NOT NULL,
    status tinyint DEFAULT(1) NOT NULL
);

CREATE TABLE teachers (
    id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    first_name nvarchar(50) NOT NULL,
    last_name nvarchar(50) NOT NULL,
    email varchar(50) UNIQUE NOT NULL
);

CREATE TABLE classrooms (
    id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    number smallint NOT NULL,
    title nvarchar(50) NULL
);

CREATE TABLE schedule_items (
    id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    number tinyint NOT NULL,
    item_start time NOT NULL,
    item_end time NOT NULL,
    status tinyint DEFAULT(1) NOT NULL
);

CREATE TABLE pairs (
    id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    pair_date date NOT NULL,
    is_online bit DEFAULT(1) NOT NULL,
    schedule_item_id int NOT NULL,
    subject_id int NOT NULL,
    group_id int NOT NULL,
    teacher_id int NOT NULL,
    classroom_id int NULL,

    CONSTRAINT FK_pairs_schedule_item FOREIGN KEY (schedule_item_id) REFERENCES schedule_items (id),
    CONSTRAINT FK_pairs_subject FOREIGN KEY (subject_id) REFERENCES subjects (id),
    CONSTRAINT FK_pairs_group FOREIGN KEY (group_id) REFERENCES groups (id),
    CONSTRAINT FK_pairs_teacher FOREIGN KEY (teacher_id) REFERENCES teachers (id),
    CONSTRAINT FK_pairs_classroom FOREIGN KEY (classroom_id) REFERENCES classrooms (id)
);

--DROP TABLE pairs;
--DROP TABLE subjects;
--DROP TABLE groups;
--DROP TABLE teachers;
--DROP TABLE classrooms;
--DROP TABLE schedule_items;


-- TASK
-- Связать преподавателей и предметы (преподаватель может читать только определенные предметы)

CREATE TABLE subjects_teachers (
    subject_id int NOT NULL,
    teacher_id int NOT NULL,

    CONSTRAINT PK_subjects_teachers PRIMARY KEY (subject_id, teacher_id),

    CONSTRAINT FK_subjects_teachers_subject FOREIGN KEY (subject_id) REFERENCES subjects(id),
    CONSTRAINT FK_subjects_teachers_teacher FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);






