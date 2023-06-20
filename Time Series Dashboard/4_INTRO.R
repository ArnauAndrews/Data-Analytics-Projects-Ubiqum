library(RMySQL)
library(dplyr)
library(lubridate)
library(tidyverse)
library(plotly)
library(ggplot2)
library(ggfortify)
library(fracdiff)
library(plotly)
library(tidyquant)
library(lubridate)
library(forecast)
library(zoo)
library(dplyr)
library(fpp2)
library(shiny)
library(textshaping)
library(inline)
library(pryr)

df<-na.omit(df)


## TIME SERIES

## Create a database connection 

## Create a database connection 
con = dbConnect(MySQL(), user='deepAnalytics', password='Sqltask1234!', dbname='dataanalytics2018', host='data-analytics-2018.cbrosir2cswx.us-east-1.rds.amazonaws.com')

## List the tables contained in the database 
dbListTables(con)

dbListTables(con)

y2007 <- dbGetQuery(con, "SELECT * FROM yr_2007")
y2008 <- dbGetQuery(con, "SELECT * FROM yr_2008")
y2009 <- dbGetQuery(con, "SELECT * FROM yr_2009")

## Investigate each new data frame.

## 2007
str(y2007)
summary(y2007)
head(y2007)
tail(y2007)

## 2008
str(y2008)
summary(y2008)
head(y2008)
tail(y2008)

## 2009
str(y2009)
summary(y2009)
head(y2009)
tail(y2009)

## 2010
str(y2010)
summary(y2010)
head(y2010)
tail(y2010)


## 1. Preprocessing DATA

## Combine all dataframes

df<-(bind_rows(y2007, y2008, y2009))

str(df)
summary(df)
head(df)
tail(df)

## Combine date and time columns using as.POSIXct. Change the order of columns
df$datetime <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")
df <- df[,c(ncol(df), 1:(ncol(df)-1))]

## Analize by year (Lubridate)
df$year <- year(df$datetime)


## This archive contains 2075259 measurements gathered in a house located in 
## Sceaux (7km of Paris, France) between December 2006 and November 2010 (47 months).

## http://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

## Checking for Missing Values

sum(is.na(df))

## Types of variables

str(df)
summary(df)


## Which sub-meter is using the most power? The least? Is there anything to learn from the max and min? 
  
## From the mean of each sub-meter: 
  
## Sub-meter_3 uses the most at 6.458 mean
## Sub_meter_1 uses the least at mean 1.122


## 2. DATA EXPLORATION

## Explore by year, month, day using Lubridate: 

df$year <- year(df$datetime)
df$month <-month(df$datetime)
df$week <-week(df$datetime)
df$day<- day(df$datetime)
df$hour<-hour(df$datetime)
df$minute<-minute(df$datetime)
df$weekday<-weekdays(df$datetime)
df$weekday <- factor(df$weekday, levels= c("lunes", "martes", 
                                         "miércoles", "jueves", "viernes", "sábado", "domingo"))
df$season <- df %>%
  mutate(season = case_when(
    month %in%  9:11 ~ "Fall",
    month %in%  c(12, 1, 2)  ~ "Winter",
    month %in%  3:5  ~ "Spring",
    TRUE ~ "Summer")) 

# Now, let's create a sample dataframe with 1000 rows from the larger dataframe
set.seed(123) # set seed for reproducibility
sample_size <- 1000
sample_indices <- sample(1:nrow(df), sample_size, replace = FALSE)
df_sample <- df[sample_indices, ]

# Print the first few rows of the sample dataframe to check the output
head(df_sample)
## Using mean: 

by_year <- df %>% group_by(year)

by_year %>% summarise(
  Sub_metering_1 = mean(Sub_metering_1),
  Sub_metering_2 = mean(Sub_metering_2),
  Sub_metering_3 = mean(Sub_metering_3)
)

by_month <- df %>% group_by(month)

by_month %>% summarise(
  Sub_metering_1 = mean(Sub_metering_1),
  Sub_metering_2 = mean(Sub_metering_2),
  Sub_metering_3 = mean(Sub_metering_3)
)


by_week<- df %>% group_by(week)

by_week %>% summarise(
  Sub_metering_1 = mean(Sub_metering_1),
  Sub_metering_2 = mean(Sub_metering_2),
  Sub_metering_3 = mean(Sub_metering_3)
)

by_day<- df %>% group_by(day)

by_day %>% summarise(
  Sub_metering_1 = mean(Sub_metering_1),
  Sub_metering_2 = mean(Sub_metering_2),
  Sub_metering_3 = mean(Sub_metering_3)
)

by_hour<- df %>% group_by(day)

by_hour %>% summarise(
  Sub_metering_1 = mean(Sub_metering_1),
  Sub_metering_2 = mean(Sub_metering_2),
  Sub_metering_3 = mean(Sub_metering_3)
)

by_minute<- df %>% group_by(day)

by_minute %>% summarise(
  Sub_metering_1 = mean(Sub_metering_1),
  Sub_metering_2 = mean(Sub_metering_2),
  Sub_metering_3 = mean(Sub_metering_3)
)



## Check for jumps in the data points: (Missing points in the dataset). Group by day 
## and check how many datapoints there are. 

