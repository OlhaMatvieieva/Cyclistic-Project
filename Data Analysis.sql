-- Data Analysis

-- types of bike
SELECT member_casual
  ,rideable_type
  ,COUNT(*) AS total_rides
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;
-- total rides for member with classic bike is the highest (1777999) while lowest (492148) for casual with electric_bike. 

-- nmb of rides per month
SELECT member_casual
  ,month
  ,COUNT(*) AS total_rides_per_month
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
GROUP BY member_casual, month
ORDER BY member_casual;

-- nmb of rides per day of week 
SELECT member_casual
  ,day_of_week
  ,COUNT(*) AS total_rides_per_week
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
GROUP BY member_casual,day_of_week
ORDER BY member_casual;

-- nmb of trips per hour
SELECT member_casual
  ,EXTRACT(HOUR FROM started_at) AS hour_of_day
  ,COUNT(*) AS total_trips
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
GROUP BY member_casual,hour_of_day
ORDER BY member_casual;

-- average ride length per day of week
SELECT member_casual
  ,day_of_week
  ,AVG(ride_length_in_mins) AS avg_ride_length
  ,AVG(AVG(ride_length_in_mins)) OVER(PARTITION BY member_casual) AS combined_avg_ride_length
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
GROUP BY member_casual, day_of_week
ORDER BY member_casual;

-- starting location for member
SELECT member_casual
  ,start_station_name
  ,AVG(start_lat) AS start_lat
  ,AVG(start_lng) AS start_lng
  ,COUNT(*) AS total_rides
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_name;

-- ending location for member
SELECT member_casual
  ,end_station_name
  ,AVG(end_lat) AS end_lat
  ,AVG(end_lng) AS end_lng
  ,COUNT(*) AS total_rides
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
WHERE member_casual = 'member'
GROUP BY member_casual, end_station_name;

-- starting location for casual
SELECT member_casual
  ,start_station_name
  ,AVG(start_lat) AS start_lat
  ,AVG(start_lng) AS start_lng
  ,COUNT(*) AS total_rides
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_name;

-- ending location for casual 
SELECT member_casual
  ,end_station_name
  ,AVG(end_lat) AS end_lat
  ,AVG(end_lng) AS end_lng
  ,COUNT(*) AS total_rides
FROM `dotted-forest-437921-f3.Cyclistic.cleaned_data`
WHERE member_casual = 'member'
GROUP BY member_casual, end_station_name;