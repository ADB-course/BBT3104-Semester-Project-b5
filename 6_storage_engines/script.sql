-- Create a table using the InnoDB storage engine
CREATE TABLE ExampleTable (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100)
) ENGINE=InnoDB;

-- Create a table using the MyISAM storage engine
CREATE TABLE AnotherExampleTable (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT
) ENGINE=MyISAM;
