/*
    Script Name: EC_IT143_6.3_fwf_s5_af.sql
    Purpose: Creates a scalar function to extract the first name from the ContactName field.
    Author: AF
    Course: IT 143
    Date: 2025-06-11
    Notes: Based on the dbo.t_w3_schools_customers table.
*/

Assume you're working with the table:
[dbo].[t_w3_schools_customers]
And a column:
ContactName (e.g., 'Maria Anders')

🔹 EC_IT143_6.3_fwf_s1_af.sql
Question:

“How do I extract the first name from a full name stored in a single string field?”


-- EC_IT143_6.3_fwf_s1_af.sql
-- Q: How do I extract the first name from the ContactName field?

-- Simple focus question
-- Input: 'Maria Anders'
-- Output: 'Maria'
🔹 EC_IT143_6.3_fwf_s2_af.sql
Answer brainstorm:


-- EC_IT143_6.3_fwf_s2_af.sql
-- A: The first name is the part of ContactName before the first space.
-- I will test using CHARINDEX and SUBSTRING functions.
🔹 EC_IT143_6.3_fwf_s3_af.sql
Ad hoc SQL query to extract first name:


-- EC_IT143_6.3_fwf_s3_af.sql

SELECT ContactName,
       SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS FirstName
FROM dbo.t_w3_schools_customers
WHERE CHARINDEX(' ', ContactName) > 0;
🔹 EC_IT143_6.3_fwf_s4_af.sql
Documented test notes + resources you found online.


-- EC_IT143_6.3_fwf_s4_af.sql
-- Resource used: https://learn.microsoft.com/en-us/sql/t-sql/functions/substring-transact-sql
-- Testing SUBSTRING and CHARINDEX to isolate the first name.

SELECT 
    ContactName,
    SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
🔹 EC_IT143_6.3_fwf_s5_af.sql
User-defined scalar function to extract first name:


-- EC_IT143_6.3_fwf_s5_af.sql
-- Script header recommended

CREATE FUNCTION dbo.fn_getFirstName (@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @FirstName NVARCHAR(50);
    
    IF CHARINDEX(' ', @FullName) > 0
        SET @FirstName = SUBSTRING(@FullName, 1, CHARINDEX(' ', @FullName) - 1);
    ELSE
        SET @FirstName = @FullName;
    
    RETURN @FirstName;
END;
🔹 EC_IT143_6.3_fwf_s6_af.sql
Compare ad hoc vs. function results:


-- EC_IT143_6.3_fwf_s6_af.sql

SELECT ContactName,
       dbo.fn_getFirstName(ContactName) AS FunctionResult,
       SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS AdHocResult
FROM dbo.t_w3_schools_customers
WHERE CHARINDEX(' ', ContactName) > 0;
🔹 EC_IT143_6.3_fwf_s7_af.sql
0 results test:


-- EC_IT143_6.3_fwf_s7_af.sql

WITH CTE_Results AS (
    SELECT ContactName,
           dbo.fn_getFirstName(ContactName) AS FunctionResult,
           SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS AdHocResult
    FROM dbo.t_w3_schools_customers
    WHERE CHARINDEX(' ', ContactName) > 0
)
SELECT *
FROM CTE_Results
WHERE FunctionResult <> AdHocResult;
-- Expected: 0 results
🔹 EC_IT143_6.3_fwf_s8_af.sql
New question: Extract last name


-- EC_IT143_6.3_fwf_s8_af.sql
-- Q: How do I extract the last name from the ContactName field?

-- Example input: 'Maria Anders'
-- Expected output: 'Anders'