CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

DELIMITER $$

CREATE PROCEDURE inc_salary()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE id INT;
    DECLARE dept VARCHAR(50);
    DECLARE sal INT;

    DECLARE cur CURSOR FOR 
        SELECT emp_id, department, salary FROM Employees;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    LOOP1: LOOP
        FETCH cur INTO id, dept, sal;

        IF done THEN 
            LEAVE LOOP1;
        END IF;

        IF dept = 'IT' THEN
            UPDATE Employees 
            SET salary = sal * 1.10 
            WHERE emp_id = id;
        END IF;

    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;
CALL inc_salary();
