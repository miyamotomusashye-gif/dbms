CREATE TABLE Employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

CREATE TABLE Employee_Audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action VARCHAR(10),
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER emp_insert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(emp_id, action)
    VALUES (NEW.emp_id, 'INSERT');
END $$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER emp_update
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(emp_id, action)
    VALUES (NEW.emp_id, 'UPDATE');
END $$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER emp_delete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(emp_id, action)
    VALUES (OLD.emp_id, 'DELETE');
END $$

DELIMITER ;
INSERT INTO Employees(name, salary) VALUES ('Alex', 50000);
UPDATE Employees SET salary = 60000 WHERE emp_id = 1;
DELETE FROM Employees WHERE emp_id = 1;

SELECT * FROM Employee_Audit;
