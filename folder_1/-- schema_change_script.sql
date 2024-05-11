-- Example schema change script for Snowflake

-- Drop existing table if it exists
DROP TABLE IF EXISTS my_table;

-- Create a new table
CREATE TABLE my_table (
    id INT,
    name VARCHAR(100),
    age INT
);

-- Add some sample data
INSERT INTO my_table (id, name, age) VALUES (1, 'John', 30);
INSERT INTO my_table (id, name, age) VALUES (2, 'Jane', 25);
