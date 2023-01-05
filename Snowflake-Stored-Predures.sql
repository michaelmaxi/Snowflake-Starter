
-- Set context 
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

-- Create demo database and schema
CREATE DATABASE DEMO_DB;
CREATE SCHEMA DEMO_SCHEMA;

--Set context
USE DATABASE DEMO_DB;
USE SCHEMA DEMO_SCHEMA;



-- Stored procedure JavaScript

-- Create demo tables and insert data to test procedure
CREATE TABLE DEMO_TABLE 
(
NAME STRING, 
AGE INT
);

CREATE TABLE DEMO_TABLE_2 
(
NAME STRING, 
AGE INT
);
    
INSERT INTO DEMO_TABLE VALUES ('Edric',56),('Jayanthi',23),('Chloe',51),('Rowland',50),('Lorna',33),('Satish',19);
INSERT INTO DEMO_TABLE_2 VALUES ('Edric',56),('Jayanthi',23),('Chloe',51),('Rowland',50),('Lorna',33),('Satish',19);

SELECT COUNT(*) FROM DEMO_TABLE;
SELECT COUNT(*) FROM DEMO_TABLE_2;


CREATE OR REPLACE PROCEDURE TRUNCATE_ALL_TABLES_IN_SCHEMA(DATABASE_NAME STRING, SCHEMA_NAME STRING)
    RETURNS STRING
    LANGUAGE JAVASCRIPT
    EXECUTE AS OWNER -- can also be executed as 'caller'
    AS
    $$
    var result = [];
    var namespace = DATABASE_NAME + '.' + SCHEMA_NAME;
    var sql_command = 'SHOW TABLES in ' + namespace ; 
    var result_set = snowflake.execute({sqlText: sql_command});
    while (result_set.next()){
        var table_name = result_set.getColumnValue(2);
        var truncate_result = snowflake.execute({sqlText: 'TRUNCATE TABLE ' + table_name});
        result.push(namespace + '.' + table_name + ' has been sucessfully truncated.');
        
    }
    return result.join("\n"); 
    $$;


-- Calling a stored procedure cannot be used as part of a SQL statement, dissimilar to a UDF. 
CALL TRUNCATE_ALL_TABLES_IN_SCHEMA('DEMO_DB', 'DEMO_SCHEMA');

SELECT COUNT(*) FROM DEMO_TABLE;
SELECT COUNT(*) FROM DEMO_TABLE_2;

-- Clear-down objects
DROP DATABASE DEMO_DB;