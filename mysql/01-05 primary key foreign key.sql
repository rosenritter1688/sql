CREATE TABLE student (
id INT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
city_id INT FOREIGN KEY REFERENCES city(id)
);


-- bigquery
CREATE TABLE `data-sci-acad-learn-sql.TW14_N10.students` (
id INT ,
name string(50) NOT NULL,
department string(15) NOT NULL);