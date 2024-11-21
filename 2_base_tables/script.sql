-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(200),
    AccountStatus VARCHAR(50),
    INDEX (CustomerName)
) ENGINE=InnoDB;

-- Create Account table
CREATE TABLE Account (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL,
    AccountStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    INDEX (Balance)
) ENGINE=InnoDB;

-- Create Payment table
CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    INDEX (PaymentDate)
) ENGINE=InnoDB;

-- Create Billing table
CREATE TABLE Billing (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    BillDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    DueDate DATE NOT NULL,
    BillStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    INDEX (BillDate)
) ENGINE=InnoDB;
