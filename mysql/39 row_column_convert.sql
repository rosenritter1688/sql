-- CREATE DATABASE unidb;
-- USE unidb;

CREATE TABLE students (
id INT PRIMARY KEY,
name varchar(50) NOT NULL,
department VARCHAR(15) NOT NULL);

CREATE TABLE courses (
course_id VARCHAR(20) PRIMARY KEY,
name varchar(50) NOT NULL,
credit SMALLINT NOT NULL);

CREATE TABLE result(
std_id INT NOT NULL,
course_id VARCHAR(20) NOT NULL,
mark_type VARCHAR(20) NOT NULL,
marks SMALLINT NOT NULL);
FOREIGN KEY (std_id) REFERENCES students(id),
FOREIGN KEY (course_id) REFERENCES courses(course_id),
PRIMARY KEY (std_id, course_id, mark_type));


INSERT INTO students VALUES
( '1937463', 'Harper Lee', 'CSE'),
( '1937464', 'Garcia Marquez', 'CSE'),
( '1937465', 'Forster, E.M.', 'CSE'),
( '1937466', 'Ralph Ellison', 'CSE');

INSERT INTO courses VALUES
( 'CSE-401', 'Object Oriented programming', 3),
( 'CSE-403', 'Data Structure', 2),
( 'CSE-407', 'Unix programming', 2);

INSERT INTO result VALUES
( '1937463', 'CSE-401','Internal Exam' ,15),
( '1937463', 'CSE-401','Mid Term Exam' ,20),
( '1937463', 'CSE-401','Final Exam', 35),
( '1937464', 'CSE-403','Internal Exam' ,17),
( '1937464', 'CSE-403','Mid Term Exam' ,15),
( '1937464', 'CSE-403','Final Exam', 30),
( '1937465', 'CSE-401','Internal Exam' ,18),
( '1937465', 'CSE-401','Mid Term Exam' ,23),
( '1937465', 'CSE-401','Final Exam', 38),
( '1937466', 'CSE-407','Internal Exam' ,20),
( '1937466', 'CSE-407','Mid Term Exam' ,22),
( '1937466', 'CSE-407','Final Exam', 40);




use sql_fr_ai;
select * from students;
show tables;