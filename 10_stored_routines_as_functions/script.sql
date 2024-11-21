-- Create a function to get the total balance of accounts with a specific status
DELIMITER $$ 
CREATE FUNCTION GetTotalAccountBalance(account_status VARCHAR(50)) 
RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total_balance DECIMAL(10, 2) DEFAULT 0;
    SELECT SUM(Balance) INTO total_balance
    FROM Account
    WHERE AccountStatus = account_status;
    RETURN total_balance;
END $$ 
DELIMITER ;
