# Snowflake-Starter
Some Snowflake DB fun

CONCEPTS
------------

Zero-Copy / SELECT from cache / Inport JSON as VARIANT column type / VIEWS & Materialized VIEWS / Time-Travel

Tables - Permanent / Tempary / Transient 

Views - Standard / Secure / Materialized

UDF - User Defined Functions / Internal SQL & Java possible / Call External API

Stored Procedure - Using Java to package SQL query's for multiple tasks or jobs and EXECUTE AS OWNER

Sequence - Create a unique incremental numbering system

Tasks - Create objects to schedule SQL commands or Stored Procedures / Each Task can have 100 child tasks / Max Total 1000 child tasks

Streams - Create objects to view & track DML changes INSERT / UPDATE / DELETE

FYI - Snowflake allows you to access your account data with command line using SnowSQL

FYI - SnowPark API allow you to query your data with Python / Scala etc without having to taking your data outside of Snowflake. 

Roles - Setup RBAC Role Based Access Control

MASKING Policy / Masking Column Data vs ROW LEVEL Policy where we can remove row data from query results

SECURE VIEWS - You can easily apply SECURE syntax to CREATE VIEW to hide the underlying tables, however beware that to secure the table some of the execution plan and query optimization is skipped.  Yes SECURE VIEWS & SECURE MATERIALIZED VIEWS are SLOWER and SECURE is discuraged unless absolutley required.
