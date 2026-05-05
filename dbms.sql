CREATE DATABASE college_db;
USE college_db;

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT,
    Address VARCHAR(50)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Instructor (Name, Email, Department)
VALUES
('Dr. Alan Turing', 'alan@college.edu', 'Artificial Intelligence'),
('Prof. Ada Lovelace', 'ada@college.edu', 'Software Engineering'),
('Sensei Tanaka', 'tanaka@college.edu', 'Foreign Languages');

INSERT INTO Student (Name, Email, Age, Address)
VALUES
('Alex Chen', 'alex@student.edu', 20, '123 Tech Lane'),
('Maya Patel', 'maya@student.edu', 19, '456 Logic Blvd'),
('Kenji Sato', 'kenji@student.edu', 19, '453 Dev Valley');

INSERT INTO Course (CourseName, Credits, InstructorID)
VALUES
('Neural Networks & Deep Learning', 4, 1),
('Full-Stack Python', 3, 2),
('Japanese N5 Preparation', 2, 3);

INSERT INTO Enrollment (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, '2026-08-15'),
(1, 2, '2026-08-15'),
(2, 2, '2026-08-16'),
(3, 1, '2026-08-17'),
(3, 3, '2026-08-17');

UPDATE Student
SET Email = 'alex_new@student.edu'
WHERE StudentID = 1;

DELETE FROM Course
WHERE CourseID = 3;

SELECT s.Name, c.CourseName
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID;

SELECT c.CourseName, i.Name AS Instructor
FROM Course c
JOIN Instructor i ON c.InstructorID = i.InstructorID;

SELECT c.CourseName, COUNT(e.StudentID) AS TotalStudents
FROM Course c
JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

SELECT i.Name, COUNT(c.CourseID) AS CoursesTaught
FROM Instructor i
JOIN Course c ON i.InstructorID = c.InstructorID
GROUP BY i.Name;
