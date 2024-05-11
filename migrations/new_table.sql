-- Create table
CREATE TABLE RAW_DATALAKE.sample_table (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Insert data
INSERT INTO RAW_DATALAKE.sample_table (id, name, age)
VALUES 
    (1, 'John', 30),
    (2, 'Jane', 25),
    (3, 'Alice', 35),
    (4, 'Bob', 40);
