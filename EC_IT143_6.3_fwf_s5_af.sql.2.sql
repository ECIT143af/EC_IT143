/*
    Script Name: EC_IT143_6.3_fwf_s5_af.sql
    Purpose: Creates a scalar function to extract the first name from the ContactName field.
    Author: AF
    Course: IT 143
    Date: 2025-06-11
    Notes: Based on the dbo.t_w3_schools_customers table.
*/

PART 2: Fun with Triggers Scripts — Track Last Modified By and Date
Make sure your table has the following two columns added (if not already):


ALTER TABLE dbo.t_w3_schools_customers
ADD LastModifiedDate DATETIME NULL,
    LastModifiedBy NVARCHAR(100) NULL;
🔹 EC_IT143_6.3_fwt_s1_af.sql
Question:

“How can I automatically record the date when a row was updated?”

🔹 EC_IT143_6.3_fwt_s2_af.sql
Answer brainstorming:


-- EC_IT143_6.3_fwt_s2_af.sql
-- A: Use an AFTER UPDATE trigger to set LastModifiedDate and LastModifiedBy using GETDATE() and SUSER_NAME().
🔹 EC_IT143_6.3_fwt_s3_af.sql
Research test script


-- EC_IT143_6.3_fwt_s3_af.sql
-- Testing manual update to simulate last modified behavior

UPDATE dbo.t_w3_schools_customers
SET LastModifiedDate = GETDATE(),
    LastModifiedBy = SUSER_NAME()
WHERE CustomerID = 1;
🔹 EC_IT143_6.3_fwt_s4_af.sql
Trigger definition


-- EC_IT143_6.3_fwt_s4_af.sql

CREATE TRIGGER trg_UpdateModifiedFields
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET LastModifiedDate = GETDATE(),
        LastModifiedBy = SUSER_NAME()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
🔹 EC_IT143_6.3_fwt_s5_af.sql
Test the trigger


-- EC_IT143_6.3_fwt_s5_af.sql

UPDATE dbo.t_w3_schools_customers
SET City = 'New York'
WHERE CustomerID = 1;

SELECT ContactName, LastModifiedDate, LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
🔹 EC_IT143_6.3_fwt_s6_af.sql
New question:

“How do I ensure this tracking only happens when fields are updated?”


-- EC_IT143_6.3_fwt_s6_af.sql
-- Q: How can I refine the trigger to detect specific changes or prevent unnecessary updates?