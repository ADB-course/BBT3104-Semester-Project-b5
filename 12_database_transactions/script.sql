-- Create a procedure to process payments as a transaction
DELIMITER $$

CREATE PROCEDURE ProcessPayment(
    IN p_AccountID INT,
    IN p_PaymentAmount DECIMAL(10, 2),
    IN p_PaymentDate DATE
)
BEGIN
    DECLARE v_previous_balance DECIMAL(10, 2);
    DECLARE v_new_balance DECIMAL(10, 2);

    START TRANSACTION;

    SELECT Balance INTO v_previous_balance
    FROM Account
    WHERE AccountID = p_AccountID;

    IF v_previous_balance < p_PaymentAmount THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance for the payment';
        LEAVE;
    END IF;

    SET v_new_balance = v_previous_balance - p_PaymentAmount;

    UPDATE Account SET Balance = v_new_balance WHERE AccountID = p_AccountID;

    INSERT INTO Payment (AccountID, PaymentAmount, PaymentDate)
    VALUES (p_AccountID, p_PaymentAmount, p_PaymentDate);

    COMMIT;
END $$ 

DELIMITER ;
