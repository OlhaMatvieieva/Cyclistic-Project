# Cyclistic Analysis (bike-share program) 🚴
## Project Overview
This project is part of the Google Data Analytics Professional Certificate capstone and focuses on analyzing data from Cyclistic, a fictional bike-share company in Chicago. The goal is to explore how casual riders and annual members use the bike-share system differently, in order to help the company design a marketing strategy to convert casual riders into annual members.

## Business Task
The director of marketing at Cyclistic has identified that maximizing the number of annual memberships is critical to the company’s future growth. The key objective is to understand the differences in bike usage patterns between casual riders (those who purchase single-ride or full-day passes) and annual members. Insights from this analysis will inform strategies aimed at encouraging casual riders to become annual members.

## Key Objectives
### Analyze User Behavior
Identify how casual riders and annual members use Cyclistic bikes differently.
### Support Marketing Strategy
Use the findings to design targeted marketing campaigns that encourage casual riders to become members.
### Deliver Data-Backed Recommendations
Ensure that the marketing strategies are backed by solid data and visualizations for executive approval.
## Data Source
The analysis uses 12 months of historical trip data from Cyclistic, which includes information on trip duration, start and end times, bike types, and user categories (casual or member). The data is anonymized to protect rider privacy and was provided under a license from Motivate International Inc..

## Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

The director of marketing has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes
differently?

## Prepare
[Data Source: divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

I will use Cyclistic’s historical trip data from September 2023 till August 2024 to analyze and identify trends. The dataset consists of 12 files, each following the naming format YYYYMM-divvy-tripdata. Each file contains data for one month and includes details such as the ride ID, bike type, start and end times, start and end stations, start and end locations, and whether the rider is a member or not. The corresponding column names are: *ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual*.

## Process
BigQuery is used to merge the different datasets into a single dataset and to perform data cleaning. Microsoft Excel has a row limit of 1,048,576, which makes it unsuitable for handling large datasets. Since the Cyclistic dataset contains over 5.6 million rows, a platform like BigQuery, which can manage vast amounts of data, is necessary.

1.[Data Combining](https://github.com/OlhaMatvieieva/Cyclistic-project/blob/main/JOIN.sql)

2.[Data Exploration](https://github.com/OlhaMatvieieva/Cyclistic-SQL-Project/blob/main/Data%20Exploration.sql)

### Data Combining
12 CSV files are uploaded as tables into the 'Cyclistic' dataset. A new table named "join_data" is then created, containing 5,699,639 rows of data representing the entire year.
 

### Data Exploration

1. Checking null values in all columns. Here was missing values in *start/end station names, start/end station id, end latitude, end longitude*
2. Checking for duplicate rows *ride_id* column, as a primary key it has to be unique. It has 211 duplicate rows which needs to be removed
3. The *ride_id* is consistent with 16 characters and no need to be cleaned
4. There are two unique types of bike: electric bike and classic bike
5. Checking *started_at, ended_at* ride duration which are less one minute and more than one day, there are 244250 rows which has to be remowed
6. Null rows from columns *start_station_name,	start_station_id,	end_station_name,	end_station_id, end_lat,	end_lng*, in total 1,982,356 were determined and has to be removed. The columns *start_station_id* and *end_station_id* should be removed, as they do not contribute to the analysis of our current problem. While the longitude and latitude columns may not be directly relevant for analysis, they can be useful for map visualization
7. *member_casual* column has two unique values as member or casual rider
## Analyze
## Share
## Act
