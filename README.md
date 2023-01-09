# Snowflake Starter FUN

Snowflake Certification [CLICK for Certificate](https://github.com/michaelmaxi/Snowflake-Starter/blob/main/Snowflake-Certificate.jpg)

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

SNOWPIPE CONTINUOUS DATA INGESTION SERVICE - Loads data at near real time from stages

WAREHOUSE Notifications / Monitoring / Metering Credits / Detailed Costing 

WAREHOUSE T-Shirt Size vs Scaling Out / In - You can increase your warehouse T-shirt size at any time.  Be aware decreasing T-shirt size will clear the cache and may severly impact performance.  Scaling out refers to "Scaling Policy".  You have the choice of STANDARD or ECONOMY.  Both will start with MIN_CLUSTER_COUNT.  

WAREHOUSE Scaling Policy - STANDARD will add a cluster immediately when a query is queued.  It will check every 1 minute the load and if load can be redistributed to another for 2 consecutive minutes then it will be marked for shut down / Scaling-In.
WAREHOUSE Scaling Policy - ECONOMY is about conserving credits.  A warehouse will start with MIN_CLUSTER_COUNT.  Scaling-Out, when a query is queued the system will estimate if there is enough query load to keep a new CLUSTER busy for 6 minutes, so it delays starting a new cluster to ensure load is not tempary.  Scaling-In, every minute a check is made to see if load can be redistrubited to another cluster, after 6 consecutive minutes, CLUSTER will be marked for shutdown. 

WAREHOUSE COST - MAX_CLUSTER_COUNT * WAREHOUSE T-SHIRT SIZE (CREDIT NO) / CREATE WAREHOUSE MY_COSTS MIN_CLUSTER_COUNT=1 MAX_CLUSTER_COUNT=3 WAREHOUSE_SIZE='MEDIUM';
COST = 3 X 4 (MEDIUM CREDIT COST) = 12 CREDITS / HOUR @ MAX CLUSTER USAGE.  In practice Scaling Policy would Scale-In when required and you would be charge a reduced amount to Max.

WAREHOUSE CONCURRENCY - DEFAULT 8 QUERY / CREATE WAREHOUSE MY_WAREHOUSE MAX_CONCURRENCY_LEVEL = 99; Specifies max SQL query that can be run before being queued.  Additional settings STATEMENT_QUEUED_TIMEOUT_IN_SECONDS=60; Queued until then aborted / STATEMENT_TIMEOUT_IN_SECONDS=600; SQL run time before aborted.

QUERY PERFORMANCE UI (14 Days) - History Tab / Home->Activity->Query History(QueryDetails) / Home->Activity->Query History(QueryProfile) *LOOK FOR SPILLING in query profile

QUERY PERFORMANCE SQL (12 MONTHS) - eg. USE DATABASE SNOWFLAKE.ACCOUNT_USAGE / SELECT * FROM QUERY_HISTORY WHERE WAREHOUSE_SIZE IS NOT NULL LIMIT 100; (NOTE:Upto 45min delay on any recent querys)

QUERY PERFORMANCE - ORDER OF EXECUTION -> ROWS(FROM+JOIN+WHERE) -> GROUPS(GROUP BY+HAVING) -> RESULT(SELECT+DISTINCT+ORDER BY+LIMIT) Hence why you should prioritize the WHERE clause as it is executes+limits data in next stages.  LIMIT is only applied at the end and can significatnly assist if ORDER BY and DISTINCT are called also.

CLUSTERING into micro partitions happens when copy into new table / AUTO CLUSTERING allows you to assign columns so that the micro partitions are holding data in the most effiecient retrieval config.  Auto Clustering will happen in the background but comes at a cost.  Large tables which are querried regular would benifit more than tables which change with insert often due to the costs involved.  The costs could outway the benifits

DATA LOADING STAGES - User Stage - given to all users by default (add files with PUT) / Table Stage (Only used for given TABLE) / Named Stage (You can create & share)

DATA LAODING STAGES - Via PUT & PowerShell 'PS C:\Users\Admin>snowsql' / USE ROLE SYSADMIN; / USE DATABASE FILMS_DB / USE SCHEMA FILMS_SCHEMA; / PUT FILE://c:\\FOLDER\\MY_DATA.CSV @~ auto_compress=false;

DATA LOADING STAGES - For Programatic Uploads 'COPY INTO <table>' when performed by user it is called BULK LOADING. Load history stored in metadata for 64 days

DATA RETENTION / TIME-TRAVEL DEFAULT DATA_RETENTION_TIME_IN_DAYS=1 (0 TURNS OFF TIME-TRAVEL) / STANDARD MAX 1 DAYS / ENTERPRISE MAX 90 DAYS (FAIL-SAVE is 7 days Availble by contacting support)

DATA CLONE - You can CLONE DATABASES, SCHEMAS, TABLES and more.  When you CLONE you CLONE the object by default without GRANTS.  If you need all permissions then include the GRANT syntax in CLONE.  You can also CLONE and object from a point in time using TIME TRAVEL.  *NOTE WHEN YOU CLONE A DATABASE you clone all the OBJECTS in it, TABLES, SCHEMAS etc.    
