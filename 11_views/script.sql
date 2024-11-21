-- Create a view to show account summaries
CREATE VIEW AccountSummaryView AS
SELECT a.AccountID, 
       a.CustomerID, 
       c.CustomerName, 
       c.ContactInfo, 
       a.Balance, 
       a.AccountStatus
FROM Account a
INNER JOIN Customer c ON a.CustomerID = c.CustomerID;
