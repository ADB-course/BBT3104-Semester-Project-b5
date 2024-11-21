-- Create an index on the CustomerName column
CREATE INDEX idx_customer_name ON Customer(CustomerName);

-- Create a composite index on AccountID and Balance
CREATE INDEX idx_account_balance ON Account(AccountID, Balance);
