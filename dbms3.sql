USE college_db;

SELECT Name, Age
FROM Student
WHERE Age > 19;

SELECT Course.CourseName, Course.Credits
FROM Course
JOIN Instructor ON Course.InstructorID = Instructor.InstructorID
WHERE Instructor.Name = 'Dr. Alan Turing';

SELECT Name, Email
FROM Student
ORDER BY Name ASC;

SELECT CourseName, Credits
FROM Course
ORDER BY Credits DESC;

SELECT AVG(Age) AS Average_Student_Age
FROM Student;

SELECT Course.CourseName, COUNT(Enrollment.StudentID) AS Total_Students
FROM Enrollment
JOIN Course ON Enrollment.CourseID = Course.CourseID
GROUP BY Course.CourseName;

SELECT Name, Age
FROM Student
WHERE Age > (SELECT AVG(Age) FROM Student);
