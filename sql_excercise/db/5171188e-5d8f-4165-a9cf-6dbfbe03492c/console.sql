CREATE DATABASE School;

USE School;

CREATE TABLE Student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gpa FLOAT
);

INSERT into Student (name, age, gpa)
VALUES ('An', 20, 3.5), ('Bình', 21, 3.2), ('Chi', 20, 3.8);

SELECT * FROM Student;