-- Create employee_archive table to store deleted employee data
CREATE TABLE employee_archive (
    ArchiveID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Department VARCHAR(50),
    ArchiveDate DATETIME NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
) ENGINE=InnoDB;

-- Trigger to archive employee data before deleting it
DELIMITER //
CREATE TRIGGER TRG_BEFORE_DELETE_ON_employee
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_archive (EmployeeID, Name, Role, Department, ArchiveDate)
    VALUES (OLD.EmployeeID, OLD.Name, OLD.Role, OLD.Department, CURRENT_TIMESTAMP);
END //
DELIMITER ;
