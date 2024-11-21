-- Insert dummy data into the Customer table
INSERT INTO Customer (CustomerName, ContactInfo, AccountStatus)
VALUES 
('Teejan Amusala', '0712345678', 'Active'),
('Kishoyian Tiampati', '07648907654', 'Inactive');

-- Insert dummy data into the Account table
INSERT INTO Account (CustomerID, Balance, AccountStatus)
VALUES 
(1, 123.00, 'Active'),
(2, 456.00, 'Inactive');
