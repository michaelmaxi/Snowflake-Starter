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

WAREHOUSE Scaling CREATE / DROP / ALTER / AUTO_SUSPEND / AUTO_RESUME

WAREHOUSE Notifications / Monitoring / Metering Credits / Detailed Costing 

WAREHOUSE T-Shirt Size vs Scaling Out / In - You can increase your warehouse T-shirt size at any time.  Be aware decreasing T-shirt size will clear the cache and may severly impact performance.  Scaling out refers to "Scaling Policy".  You have the choice of STANDARD or ECONOMY.  Both will start with MIN_CLUSTER_COUNT.  

WAREHOUSE Scaling Policy - STANDARD will add a cluster immediately when a query is queued.  It will check every 1 minute the load and if load can be redistributed to another for 2 consecutive minutes then it will be marked for shut down / Scaling-In.
WAREHOUSE Scaling Policy - ECONOMY is about conserving credits.  A warehouse will start with MIN_CLUSTER_COUNT.  Scaling-Out, when a query is queued the system will estimate if there is enough query load to keep a new CLUSTER busy for 6 minutes, so it delays starting a new cluster to ensure load is not tempary.  Scaling-In, every minute a check is made to see if load can be redistrubited to another cluster, after 6 consecutive minutes, CLUSTER will be marked for shutdown. 

WAREHOUSE COST - MAX_CLUSTER_COUNT * WAREHOUSE T-SHIRT SIZE (CREDIT NO) / CREATE WAREHOUSE MY_COSTS MIN_CLUSTER_COUNT=1 MAX_CLUSTER_COUNT=3 WAREHOUSE_SIZE='MEDIUM';
COST = 3 X 4 (MEDIUM CREDIT COST) = 12 CREDITS / HOUR @ MAX CLUSTER USAGE.  In practice Scaling Policy would Scale-In when required and you would be charge a reduced amount to Max.

WAREHOUSE CONCURRENCY - DEFAULT 8 QUERY / CREATE WAREHOUSE MY_WAREHOUSE MAX_CONCURRENCY_LEVEL = 99; Specifies max SQL query that can be run before being queued.  Additional settings STATEMENT_QUEUED_TIMEOUT_IN_SECONDS=60; Queued until then aborted / STATEMENT_TIMEOUT_IN_SECONDS=600; SQL run time before aborted.

QUERY PERFORMANCE - 3 PLACES - History Tab / Home->Activity->Query History(QueryDetails) / Home->Activity->Query History(QueryProfile)
