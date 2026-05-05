-- Create Database
CREATE DATABASE college_db;
USE college_db;

-- Instructor Table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(50)
);

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT,
    Address VARCHAR(50)
);

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Enrollment Table (FIXED spelling + constraints)
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE,
    UNIQUE (StudentID, CourseID)
);

-- Instructor Data
INSERT INTO Instructor (Name, Email, Department)
VALUES
('Dr. Alan Turing', 'alan@college.edu', 'Artificial Intelligence'),
('Prof. Ada Lovelace', 'ada@college.edu', 'Software Engineering'),
('Sensei Tanaka', 'tanaka@college.edu', 'Foreign Languages');

-- Student Data
INSERT INTO Student (Name, Email, Age, Address)
VALUES
('Alex Chen', 'alex@student.edu', 20, '123 Tech Lane'),
('Maya Patel', 'maya@student.edu', 19, '456 Logic Blvd'),
('Kenji Sato', 'kenji@student.edu', 19, '453 Dev Valley');

-- Course Data
INSERT INTO Course (CourseName, Credits, InstructorID)
VALUES
('Neural Networks & Deep Learning', 4, 1),
('Full-Stack Python', 3, 2),
('Japanese N5 Preparation', 2, 3);

-- Enrollment Data
INSERT INTO Enrollment (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, '2026-08-15'),
(1, 2, '2026-08-15'),
(2, 2, '2026-08-16'),
(3, 1, '2026-08-17'),
(3, 3, '2026-08-17');
