--- ZERO-COPY CLONE
--- Rather than Copy a complete large database, CLONE is copy of Metadata & log changes of source data.  
SELECT COUNT(*) FROM trips;

CREATE TABLE trips_dev CLONE trips;

SELECT COUNT(*) FROM trips_dev;


