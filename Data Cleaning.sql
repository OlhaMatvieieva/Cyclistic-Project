-- Data Cleaning

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

-- Remove duplicates from column ride_id

SELECT DISTINCT(ride_id)
FROM `dotted-forest-437921-f3.Cyclistic.join_data`
ORDER BY ride_id;




























