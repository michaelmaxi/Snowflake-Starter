

-- Set context 
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;


-- Create demo database & schema 
CREATE DATABASE DEMO_DB;
CREATE SCHEMA DEMO_SCHEMA;

USE DATABASE DEMO_DB;
USE SCHEMA DEMO_SCHEMA;

-- Create three table types
CREATE TABLE PERMANENT_TABLE 
(
  NAME STRING,
  AGE INT
  );

CREATE TEMPORARY TABLE TEMPORARY_TABLE
(
  NAME STRING,
  AGE INT
  );

CREATE TRANSIENT TABLE TRANSIENT_TABLE 
(
  NAME STRING,
  AGE INT
  );

SHOW TABLES;

SHOW TABLES LIKE 'TEMP%';

SHOW TABLES;
SELECT "name", "database_name", "schema_name", "kind", "is_external" FROM TABLE(result_scan(last_query_id()));

-- Describe table schema
DESC TABLE TEMPORARY_TABLE;


-- Successful 
ALTER TABLE PERMANENT_TABLE SET DATA_RETENTION_TIME_IN_DAYS = 90;

-- Invalid values 90 / 2 etc.  VALID Days = 0 OR 1 
ALTER TABLE TRANSIENT_TABLE SET DATA_RETENTION_TIME_IN_DAYS = 0;

-- Create external table 
CREATE EXTERNAL TABLE EXT_TABLE
(
 	
  col1 varchar as (value:col1::varchar),
  col2 varchar as (value:col2::int),
  col3 varchar as (value:col3::varchar)

)
LOCATION=@s1/logs/
FILE_FORMAT = (type = parquet);


-- Refresh external table metadata so it reflects latest changes in external cloud storage
ALTER EXTERNAL TABLE EXT_TABLE REFRESH;

-- Clear down database
DROP DATABASE DEMO_DB;