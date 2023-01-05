

-- Set context 
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

-- Create demo database & schema 
CREATE DATABASE DEMO_DB;
CREATE SCHEMA DEMO_SCHEMA;

USE DATABASE DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- Describe table schema
SHOW VIEWS;


-- Create three table types
CREATE TABLE PERMANENT_TABLE 
(
  NAME STRING,
  AGE INT
  );



-- Create three views - one of each type
CREATE VIEW STANDARD_VIEW AS
SELECT * FROM PERMANENT_TABLE;

CREATE SECURE VIEW SECURE_VIEW AS
SELECT * FROM PERMANENT_TABLE;

CREATE MATERIALIZED VIEW MATERIALIZED_VIEW AS
SELECT * FROM PERMANENT_TABLE;

SHOW VIEWS LIKE '%VIEW';

SELECT "name", "database_name", "schema_name", "is_secure", "is_materialized" FROM TABLE(result_scan(last_query_id()));

-- Secure view functionality

GRANT USAGE ON DATABASE DEMO_DB TO ROLE SYSADMIN;
GRANT USAGE ON SCHEMA DEMO_SCHEMA TO ROLE SYSADMIN;
GRANT SELECT, REFERENCES ON TABLE STANDARD_VIEW TO ROLE SYSADMIN;
GRANT SELECT, REFERENCES ON TABLE SECURE_VIEW TO ROLE SYSADMIN;

-- DDL returned from secure view as role that owns secure view
SELECT get_ddl('view', 'SECURE_VIEW');

-- Set context
USE ROLE SYSADMIN;

-- Will not work with SYSADMIN role as only ownership role can view DDL
SELECT get_ddl('view', 'SECURE_VIEW');

-- Will work with SYSADMIN role as view not desginated as SECURE  
SELECT get_ddl('view', 'STANDARD_VIEW');

-- Set context
USE ROLE ACCOUNTADMIN;

-- Clear down database
DROP DATABASE DEMO_DB;