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
I will use Cyclistic’s historical trip data from September 2023 till August 2024 to analyze and identify trends. The dataset consists of 12 files, each following the naming format YYYYMM-divvy-tripdata. Each file contains data for one month and includes details such as the ride ID, bike type, start and end times, start and end stations, start and end locations, and whether the rider is a member or not. The corresponding column names are: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual.

## Process
BigQuery is used to merge the different datasets into a single dataset and to perform data cleaning. Microsoft Excel has a row limit of 1,048,576, which makes it unsuitable for handling large datasets. Since the Cyclistic dataset contains over 5.6 million rows, a platform like BigQuery, which can manage vast amounts of data, is necessary.

### Joining the data
12 CSV files are uploaded as tables into the 'Cyclistic' dataset. A new table named "join_data" is then created, containing 5,699,639 rows of data representing the entire year.
 [SQL Query: Join](https://github.com/OlhaMatvieieva/Cyclistic-project/blob/main/SQL%20Query%3A%20JOIN) 
## Analyze
## Share
## Act
