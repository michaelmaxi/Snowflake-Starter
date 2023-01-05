--- TASKS an object used to schedule SQL command or a stored procedure
--- TASK time limit of 60 minutes before termination as safeguard against non terminating tasks.

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
USE DATABASE DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

SHOW TABLES;

SELECT *
FROM DEMO_TABLE;

INSERT INTO DEMO_TABLE (NAME) VALUES ('MAXI');

CREATE TASK MYTASK 
    WAREHOUSE=COMPUTE_WH 
    SCHEDULE='30 MINUTE'
AS 
    INSERT INTO DEMO_TABLE (NAME) VALUES ('MAXI');
    

SHOW TASKS;DEMO_DB.DEMO_SCHEMA.DAY_NAME_ON

