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

1.[Data Combining](https://github.com/OlhaMatvieieva/Cyclistic-Project/blob/main/Data%20Combining.sql)

2.[Data Exploration](https://github.com/OlhaMatvieieva/Cyclistic-SQL-Project/blob/main/Data%20Exploration.sql)

3.[Data Cleaning](https://github.com/OlhaMatvieieva/Cyclistic-Project/blob/main/Data%20Cleaning.sql)

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

### Data Cleaning

After data exploration I have to clean the dataset from:
1. Null values in columns *start_station_name,	start_station_id,	end_station_name,	end_station_id, end_lat,	end_lng*
2. Duplicates from *ride_id*
3. Rows from columns *started_at, ended_at* ride duration which are less one minute and more than one day
4. 3 more columns ride_length for duration of the trip, day_of_week and month are added

In total, 4,070,022 rows were returned, which means 1,629,617 rows were removed
## Analyze

[Data Analysis](https://github.com/OlhaMatvieieva/Cyclistic-Project/blob/main/Data%20Analysis.sql)

[Data Visualization]()

The main question for analysis is: *How do annual members and casual riders use Cyclistic bikes differently?*

The data has been properly stored and is now ready for analysis. I queried several relevant tables and created visualizations in Power BI

### Total rides in 2024
![image](https://github.com/user-attachments/assets/8efdc446-10cb-4c0f-984d-d445609a1f7b)

The figure shows the total number of rides in 2024. Members (64%) shows us more activity instead from casual riders (36%)

### Types of bikes
![image](https://github.com/user-attachments/assets/d08a8b6f-7d39-4c48-963a-c6c7f7d88cbd)

There are two types of bicycles: classic and electric bikes. On the chart displayed how members and casual riders used bikes. Members and casual riders more often uses classic bikes 2.736.095 rides when on electic bikes only 1.333.927 rides

### Total rides by period
![image](https://github.com/user-attachments/assets/5c03b321-f24b-4cb6-a6ee-89f49c96b789)

Next the number of trips distributed by the months, days of the week and hours of the day are examined.

Months: Monthly trip patterns for casual riders and members are quite similar, with both groups taking more trips during the spring and summer months and fewer in the winter. The difference in trip numbers between the two groups narrows most significantly in July, during the summer.

Days of the Week: Casual riders tend to take more trips on weekends, while members show a contrasting pattern, with fewer trips on weekends compared to weekdays.

Hours of the Day: Members display two distinct peaks in their trip activity: one in the early morning between 6 AM and 8 AM, and another in the evening from 4 PM to 8 PM. In contrast, trips by casual riders steadily increase throughout the day, peaking in the evening before declining later at night.

Based on these observations, it can be inferred that members likely use bikes primarily for commuting to and from work on weekdays, while casual riders tend to use bikes throughout the day, especially on weekends, likely for leisure activities. Both groups show peak activity during the spring and summer seasons.

### Average ride duration by period
![image](https://github.com/user-attachments/assets/1a94a58f-8ffc-4de1-985a-d4aeca9cab51)

Casual riders generally cycle for longer durations compared to members, with the average trip length for members remaining consistent throughout the year, week, and day. In contrast, casual riders display notable variability in their trip lengths. They tend to ride longer distances during spring and summer, especially on weekends and between 10 AM and 2 PM, likely for recreational purposes. Conversely, their trips are shorter during early morning hours (5–8 AM), aligning with potential commuting behavior.

These observations suggest that casual riders travel less frequently but for significantly longer durations, approximately twice as long as members on average. The extended trips during non-commuting hours, weekends, and warmer months reinforce the idea that casual riders primarily use bikes for leisure rather than daily transportation.
## Share
![image](https://github.com/user-attachments/assets/7c929073-c9dd-4496-8ede-a5ed2321dd96)
[View dashboard](https://app.powerbi.com/view?r=eyJrIjoiMjM0NjgxNzktODNlNS00YzgxLWI0MzItYzVkNWFjZDVmZDkzIiwidCI6ImFmNDAxOTMwLTYyZWUtNDIwMC05NDYxLTcyMmZkMmMxN2I0NCIsImMiOjh9&embedImagePlaceholder=true&pageName=11e0fdef3acdca11509a)

The similarities and differences between Cyclistic members and casual riders are summarized as follows based on the dashboard analysis:

### Similarities:
Seasonal Preferences: Both groups favor riding bicycles during spring and summer (May to September). However, ride numbers decline starting in September, likely due to colder temperatures making rides less comfortable

Bike Type Preference: Both groups prefer classic bicycles over electric ones
Weekend Rides: Average ride durations are higher on weekends for both groups compared to weekdays

### Differences:
Frequency of Rides: Cyclistic members take significantly more rides compared to casual riders

Trip Length: Members have a shorter average ride duration (12.46 minutes) compared to casual riders (23.50 minutes), suggesting that members often use bicycles for short, practical trips, such as commuting or running errands

Activity Patterns: Members show consistent ride activity throughout the week, indicating routine usage. In contrast, casual riders are most active on weekends and less active on weekdays, implying that their rides are more recreational or leisure-oriented

These findings highlight the distinct usage patterns between the two groups, helping tailor strategies to meet their specific needs and preferences
## Act
To convert casual riders into Cyclistic members:

1. Flexible Membership Plans: Offer annual, monthly, and daily options (e.g., $365/year, $45/month, $3/day) to cater to diverse user needs
2. Group Discounts: Provide deals for families, students, and friends to promote group memberships
3. Loyalty Program: Reward frequent rides with points redeemable for discounts or free rides to encourage regular use
4. Exclusive Events: Host members-only activities like group rides or themed challenges to build community and attract casual riders
5. Seasonal Promotions: Launch spring and summer campaigns offering discounts or extended ride times to drive membership sign-ups
6. Social Media Engagement: Highlight member benefits, testimonials, and cycling experiences to inspire casual riders to join

In a conclusions Cyclistic can successfully increase memberships and foster loyalty by tailoring strategies to user behaviors and preferences
