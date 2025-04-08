-- Data Cleaning

-- remove rows with null values 
-- delete duplicates and rows from columns started_at, ended_at ride duration which are less one minute and more than one day
-- create the columns 'month and' 'day_of week' where 1 represents Sunday, 7 represents Monday 
-- determine the ride length in minutes 

CREATE TABLE `dotted-forest-437921-f3.Cyclistic.cleaned_data` AS (
  SELECT ride_id, rideable_type, started_at, ended_at, ride_length_in_mins, FORMAT_TIMESTAMP('%B', started_at) AS month, FORMAT_TIMESTAMP('%A', started_at) AS day_of_week, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM `dotted-forest-437921-f3.Cyclistic.join_data` AS t1
JOIN 
  (SELECT ride_id, TIMESTAMP_DIFF(
      ended_at, started_at, MINUTE) AS ride_length_in_mins
  FROM `dotted-forest-437921-f3.Cyclistic.join_data`) AS t2
USING(ride_id)
WHERE ride_length_in_mins > 1 AND ride_length_in_mins < 1440 AND
  start_station_name IS NOT NULL AND
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  start_lat IS NOT NULL AND
  start_lng IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL
GROUP BY ride_id, rideable_type, started_at, ended_at, ride_length_in_mins, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
HAVING COUNT(ride_id) = 1
);
