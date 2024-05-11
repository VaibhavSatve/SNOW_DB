-- Fetch data from the existing table in RAW_DATALAKE and insert into the new_table
INSERT INTO RAW_DATALAKE.new_table (name, age, email)
SELECT name, age, email
FROM existing_table; -- Replace existing_table with the name of the table you are fetching data from
