-- Data Exploration

-- checking for number of null values

SELECT 
    COUNTIF(ride_id IS NULL) AS ride_id_nulls,
    COUNTIF(rideable_type IS NULL) AS rideable_type_nulls,
    COUNTIF(started_at IS NULL) AS started_at_nulls,
    COUNTIF(ended_at IS NULL) AS ended_at_nulls,
    COUNTIF(start_station_name IS NULL) AS start_station_name_nulls,
    COUNTIF(start_station_id IS NULL) AS start_station_id_nulls,
    COUNTIF(end_station_name IS NULL) AS end_station_name_nulls,
    COUNTIF(end_station_id IS NULL) AS end_station_id_nulls,
    COUNTIF(start_lat IS NULL) AS start_lat_nulls,
    COUNTIF(start_lng IS NULL) AS start_lng_nulls,
    COUNTIF(end_lat IS NULL) AS end_lat_nulls,
    COUNTIF(end_lng IS NULL) AS end_lng_nulls,
    COUNTIF(member_casual IS NULL) AS member_casual_nulls
FROM `dotted-forest-437921-f3.Cyclistic.join_data`;

-- checking for duplicate rows

WITH duplicates AS (
    SELECT ride_id, COUNT(*) AS occurrences
    FROM `dotted-forest-437921-f3.Cyclistic.join_data`
    GROUP BY ride_id
    HAVING COUNT(*) > 1
)
SELECT ride_id, occurrences
FROM duplicates
ORDER BY occurrences DESC;

-- the ride_id is consistent with 16 characters

SELECT ride_id
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
WHERE LENGTH(ride_id) <> 16;

-- rideable_type determine the type of bikes 

SELECT rideable_type, COUNT(*) AS trip_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY rideable_type
ORDER BY trip_count DESC;

-- started_at, ended_at ride duration

WITH ride_cats AS (
  SELECT 
    CASE 
      WHEN TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 THEN 'Too Short'
      WHEN TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440 THEN 'Too Long'
      ELSE 'Normal'
    END AS ride_category
  FROM `dotted-forest-437921-f3.Cyclistic.join_data`
)
SELECT ride_category, COUNT(*) AS count
FROM ride_cats
GROUP BY ride_category;

-- name & id of start_station and end_station
SELECT start_station_name, COUNT(*) AS start_station_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY start_station_count DESC
LIMIT 10;

SELECT end_station_name, COUNT(*) AS end_station_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
WHERE end_station_name IS NOT NULL
GROUP BY end_station_name
ORDER BY end_station_count DESC
LIMIT 10;

SELECT DISTINCT start_station_id, end_station_id
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
WHERE start_station_id IS NOT NULL OR
end_station_id IS NOT NULL;

-- latitude & longitude of start and end
SELECT * 
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
WHERE
start_lat IS NULL OR
start_lng IS NULL OR
end_lat IS NULL OR
end_lng IS NULL;

-- member_casual type of membership 
SELECT member_casual, COUNT(*) as membership_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY member_casual;
