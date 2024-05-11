-- Create a new table in the RAW_DATALAKE database
CREATE TABLE RAW_DATALAKE.new_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    email VARCHAR(255)
);
