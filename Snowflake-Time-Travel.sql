--- Time Travel / UNDROP 
USE ROLE sysadmin;
USE WAREHOUSE compute_wh;
USE DATABASE weather;
USE SCHEMA public;

DROP TABLE json_weather_data;

SELECT * FROM json_weather_data LIMIT 10;

UNDROP TABLE json_weather_data;

SELECT * FROM json_weather_data limit 10;
--- Time Travel / UNDROP


--- Time Travel / ROLL BACK
USE ROLE sysadmin;
USE WAREHOUSE compute_wh;
USE DATABASE citibike;
USE SCHEMA public;

SELECT start_station_name as "station", count(*) as "rides" 
FROM trips
GROUP BY 1
ORDER BY 2 desc
LIMIT 20;

UPDATE trips SET start_station_name = 'oops';

--- Rather then scramble for a backup / In Snowflake get last UPDATE Query_Id 
--- 1ST WAY -> Home -> Activity -> Query History -> 01a91559-0000-8ec1-0000-00007001f059
--- 2ND WAY -> Query for it
SET query_id =
(SELECT query_id FROM TABLE(information_schema.query_history_by_session (result_limit=>5))
WHERE query_text LIKE 'update%' ORDER BY start_time DESC LIMIT 1);

SELECT $query_id FROM trips LIMIT 1;

create or replace table trips as
(select * from trips before (statement => $query_id));

select
start_station_name as "station",
count(*) as "rides"
from trips
group by 1
order by 2 desc
limit 20;
--- Time Travel / ROLL BACK

