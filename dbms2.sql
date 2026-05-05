USE college_db;

CREATE VIEW StudentCourseReport AS
SELECT
    Student.Name AS Student_Name,
    Course.CourseName,
    Instructor.Name AS Instructor_Name
FROM Enrollment
JOIN Student ON Enrollment.StudentID = Student.StudentID
JOIN Course ON Enrollment.CourseID = Course.CourseID
JOIN Instructor ON Course.InstructorID = Instructor.InstructorID;

CREATE VIEW StudentDirectory AS
SELECT
    StudentID,
    Name,
    Email,
    Age
FROM Student;

UPDATE StudentDirectory
SET Age = 22
WHERE Name = 'Alex Chen';

DELETE FROM StudentDirectory
WHERE Name = 'John Doe';

CREATE INDEX idx_student_name
ON Student(Name);

EXPLAIN SELECT*FROM Student WHERE Name = 'Kenji Sato';
