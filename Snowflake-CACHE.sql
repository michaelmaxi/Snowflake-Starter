--- CACHE Performance set=24 hour

--- Run SELECT & Consume Compute.  Data is stored in CACHE set to 24 hours.
--- 1.3G Approx 1.7 seconds
SELECT monthname(starttime) AS "month",
    count(*) AS "num trips"
FROM trips
GROUP BY 1 
ORDER BY 2 DESC;

--- Run it again, Query from Cache, any user who has access gets the cache
--- 1.3G Cache 48 milli-seconds
SELECT monthname(starttime) AS "month",
    count(*) AS "num trips"
FROM trips
GROUP BY 1 
ORDER BY 2 DESC;

