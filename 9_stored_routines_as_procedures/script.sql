-- Create a procedure to get billing summaries
DELIMITER $$ 
CREATE PROCEDURE GetBillingSummaryReport(IN StartDate DATE, IN EndDate DATE)
BEGIN
    SELECT 
        AccountID, 
        SUM(TotalAmount) AS TotalBillingAmount,
        COUNT(BillID) AS TotalBills
    FROM Billing
    WHERE BillDate BETWEEN StartDate AND EndDate
    GROUP BY AccountID;
END $$ 
DELIMITER ;
