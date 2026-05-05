CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

DELIMITER //

CREATE PROCEDURE Add_Sale(
    IN p_SaleID INT,
    IN p_ProductName VARCHAR(50),
    IN p_Quantity INT,
    IN p_Price DECIMAL(10,2)
)
BEGIN
    INSERT INTO Sales (SaleID, ProductName, Quantity, Price)
    VALUES (p_SaleID, p_ProductName, p_Quantity, p_Price);
END //

DELIMITER ;

CALL Add_Sale(101, 'Laptop', 2, 50000.00);
CALL Add_Sale(102, 'Mobile', 5, 15000.00);

DELIMITER //

CREATE FUNCTION Get_Total_Sales()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE v_Total DECIMAL(15,2);

    SELECT SUM(Quantity * Price)
    INTO v_Total
    FROM Sales;

    RETURN IFNULL(v_Total, 0);
END //

DELIMITER ;

SELECT Get_Total_Sales() AS TotalSales;
