-- Data Exploration

-- checking for number of null values

SELECT COUNT(*) - COUNT(ride_id) ride_id
  ,COUNT(*) - COUNT(rideable_type) rideable_type
  ,COUNT(*) - COUNT(started_at) started_at
  ,COUNT(*) - COUNT(ended_at) ended_at
  ,COUNT(*) - COUNT(start_station_name) start_station_name
  ,COUNT(*) - COUNT(start_station_id) start_station_id
  ,COUNT(*) - COUNT(end_station_name) end_station_name
  ,COUNT(*) - COUNT(end_station_id) end_station_id
  ,COUNT(*) - COUNT(start_lat) start_lat
  ,COUNT(*) - COUNT(start_lng) start_lng
  ,COUNT(*) - COUNT(end_lat) end_lat
  ,COUNT(*) - COUNT(end_lng) end_lng
  ,COUNT(*) - COUNT(member_casual) member_casual
FROM `dotted-forest-437921-f3.Cyclistic.join_data`;

-- checking for duplicate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `dotted-forest-437921-f3.Cyclistic.join_data`;

-- the ride_id is consistent with 16 characters

SELECT LENGTH(ride_id) AS length_ride_id
  ,COUNT(ride_id) AS nmb_of_rows
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY length_ride_id;

-- rideable_type determine the type of bikes 

SELECT DISTINCT rideable_type
  ,COUNT(rideable_type) AS nmb_of_trips
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY rideable_type;

-- started_at, ended_at ride duration

SELECT ride_id
  ,started_at
  ,ended_at
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
WHERE 
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

-- name & id of start_station and end_station
SELECT DISTINCT start_station_name
  ,COUNT(*) AS start_station_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY start_station_name;

SELECT DISTINCT end_station_name
  ,COUNT(*) AS end_station_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY end_station_name;

SELECT DISTINCT start_station_id
  ,end_station_id
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
SELECT member_casual
  ,COUNT(*) as membership_count
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
GROUP BY member_casual;