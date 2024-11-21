-- Create PaymentHistory table to store payment changes
CREATE TABLE PaymentHistory (
    PaymentHistoryID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PreviousBalance DECIMAL(10, 2) NOT NULL,
    NewBalance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
) ENGINE=InnoDB;

-- Trigger to log payment changes
DELIMITER //
CREATE TRIGGER TRG_AFTER_PAYMENT_INSERT
AFTER INSERT ON Payment
FOR EACH ROW
BEGIN
    DECLARE previous_balance DECIMAL(10, 2);
    DECLARE new_balance DECIMAL(10, 2);
    
    SELECT Balance INTO previous_balance FROM Account WHERE AccountID = NEW.AccountID;
    SET new_balance = previous_balance + NEW.PaymentAmount;
    
    INSERT INTO PaymentHistory (AccountID, PaymentAmount, PaymentDate, PreviousBalance, NewBalance)
    VALUES (NEW.AccountID, NEW.PaymentAmount, NEW.PaymentDate, previous_balance, new_balance);
    
    UPDATE Account SET Balance = new_balance WHERE AccountID = NEW.AccountID;
END //
DELIMITER ;
