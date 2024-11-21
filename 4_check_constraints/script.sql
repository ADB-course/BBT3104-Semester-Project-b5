-- Create SalesOrder table with a check constraint
CREATE TABLE SalesOrder (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    CHECK (TotalAmount > 0),  -- Ensure that the total amount is greater than 0
    INDEX (CustomerID)
) ENGINE=InnoDB;

-- Create ProductionBatch table with check constraints
CREATE TABLE ProductionBatch (
    BatchID INT AUTO_INCREMENT PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Volume DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    CHECK (EndDate >= StartDate),  -- Ensure EndDate is after or equal to StartDate
    INDEX (StartDate),
    INDEX (Status)
) ENGINE=InnoDB;
