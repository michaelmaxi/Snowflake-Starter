--- IMPORT WEATEHR JSON FILE 
USE ROLE sysadmin;
USE WAREHOUSE compute_wh;

CREATE DATABASE weather;
USE DATABASE weather;
USE SCHEMA public;

--- Snowflake special column data type called Variant.  Allows storing JSON object as a single row.
CREATE TABLE json_weather_data (v variant);

--- Create Stage for data inport
CREATE STAGE nyc_weather url = 's3://snowflake-workshop-lab/zero-weather-nyc';

LIST @nyc_weather;

COPY INTO json_weather_data from @nyc_weather file_format = (type = json strip_outer_array = true);

SELECT * FROM json_weather_data limit 10;

CREATE OR REPLACE VIEW json_weather_data_view AS
SELECT
    v:obsTime::timestamp as observation_time,
    v:station::string as station_id,
    v:name::string as city_name,
    v:country::string as country,
    v:latitude::float as city_lat,
    v:longitude::float as city_lon,
    v:weatherCondition::string as weather_conditions,
    v:coco::int as weather_conditions_code,
    v:temp::float as temp,
    v:prcp::float as rain,
    v:tsun::float as tsun,
    v:wdir::float as wind_dir,
    v:wspd::float as wind_speed,
    v:dwpt::float as dew_point,
    v:rhum::float as relative_humidity,
    v:pres::float as pressure
FROM
    json_weather_data
WHERE
    station_id = '72502';
    
--- NOW SELECT JSON DATA
SELECT *
FROM JSON_WEATHER_DATA_VIEW
LIMIT 10;

SELECT * FROM json_weather_data_view
WHERE date_trunc('month',observation_time) = '2018-01-01'
limit 20;

SELECT weather_conditions AS conditions,
    count(*) AS num_trips
FROM citibike.public.trips
LEFT OUTER JOIN json_weather_data_view ON date_trunc('hour', observation_time) = date_trunc('hour', starttime)
WHERE conditions IS NOT null
GROUP BY 1 ORDER BY 2 DESC;
