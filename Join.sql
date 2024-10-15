CREATE TABLE IF NOT EXISTS `Cyclistic.join_data` AS (
  SELECT * FROM `Cyclistic.202309-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202310-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202311-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202312-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202401-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202402-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202403-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202404-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202405-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202406-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202407-divvy-tripdata`
  UNION ALL
  SELECT * FROM `Cyclistic.202408-divvy-tripdata`
);

-- checking number of rows which are 5699639

SELECT COUNT(*)
FROM `Cyclistic.join_data`;