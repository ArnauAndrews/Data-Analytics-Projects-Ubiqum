
# 5. PLOTS

#LEGEND: 
#SUB_METER 1-> KITCHEN
#SUB_METER_2-> LAUNDRY ROOM
#SUB_METER_3-> WATER HEATER & AC

# 5.1. WATER HEATER & AC WEEKLY TIMESERIES

weekly_water <- ts(mean_per_week_water$mean, frequency=52.25, start=c(2007,1))
weekly_water<-(weekly_water)
autoplot(weekly_water) + xlab("Week") + ylab("Mean") +
  ggtitle("Water Heater & AC")

boxplot(mean_per_week_water ~ week, 
        data=total, 
        main="Water & AC",
        ylab="Mean", xlab="week")

class(total)

# 5.1.1. WATER HEATER & AC WEEKLDAY TIMESERIES


weekday_water<-ts(mean_per_weekday_water$mean, frequency=7, start=c(2007, 1))
plot(weekday_water)

autoplot(weekday_water) + xlab("Day of the Week") + ylab("Mean") +
  ggtitle("Water Heater & AC")



# 5.2. KITCHEN WEEKLY TIMESERIES

weekly_kitchen <- ts(mean_per_week_kitchen$mean, frequency=52.25, start=c(2007,1))

plot(weekly_kitchen)
autoplot(weekly_kitchen) + xlab("Week") + ylab("Mean") +
  ggtitle("Kitchen")

# 5.3. LAUNDRY ROOM TIMESERIES

weekly_laundry<- ts(mean_per_week_laundry$mean, frequency=52.25, start=c(2007,1))

plot(weekly_laundry)
autoplot(weekly_laundry) + xlab("Week") + ylab("Mean") +
  ggtitle("Laundry Room")

# 5.4. TOTAL WEEKLY TIMESERIES

weekly_total<- ts(mean_per_week_total$mean, frequency=52.25, start=c(2007,1))
plot(weekly_total)
autoplot(weekly_total) + xlab("Week") + ylab("Mean") +
  ggtitle("Total")
abline(h=c(1, 2, 0.25))

# 5.5. TOTAL POWER CONSUMPTION BY YEAR

by_year<-plot_ly(total_year, x = ~total_year$weekday, y = ~total_year$"2007", 
        name = '2007', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~total_year$"2008" , name = '2008', mode = 'lines') %>%
  add_trace(y = ~total_year$"2009", name = '2009', mode = 'lines') %>%
  layout(title = "Total Power Consumption by Year",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.6. 2007 CONSUMPTION BY SUBMETER weekday

weekdayy_2007 <- filter(total_weekday, (year == 2007))
weekday_2007<-plot_ly(weekdayy_2007, x = ~weekdayy_2007$weekday, y = ~weekdayy_2007$"mean_per_weekday_water", 
         name = 'mean_per_weekday_water ', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~weekdayy_2007$"mean_per_weekday_kitchen" , name = 'mean_per_weekday_kitchen ', mode = 'lines') %>%
  add_trace(y = ~weekdayy_2007$"mean_per_weekday_laundry", name = 'mean_per_weekday_laundry ', mode = 'lines') %>%
  layout(title = "Power Consumption by Sub-meter 2007",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.6. 2008 CONSUMPTION BY SUBMETER weekday

weekdayy_2008 <- filter(total_weekday, (year == 2008))
weekday_2008<-plot_ly(weekdayy_2008, x = ~weekdayy_2008$weekday, y = ~weekdayy_2008$"mean_per_weekday_water", 
                      name = 'mean_per_weekday_water ', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~weekdayy_2008$"mean_per_weekday_kitchen" , name = 'mean_per_weekday_kitchen ', mode = 'lines') %>%
  add_trace(y = ~weekdayy_2008$"mean_per_weekday_laundry", name = 'mean_per_weekday_laundry ', mode = 'lines') %>%
  layout(title = "Power Consumption by Sub-meter 2008",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))


# 5.6. 2009 CONSUMPTION BY SUBMETER weekday

weekdayy_2009 <- filter(total_weekday, (year == 2009))
weekday_2009<-plot_ly(weekdayy_2009, x = ~weekdayy_2009$weekday, y = ~weekdayy_2009$"mean_per_weekday_water", 
                      name = 'mean_per_weekday_water ', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~weekdayy_2009$"mean_per_weekday_kitchen" , name = 'mean_per_weekday_kitchen ', mode = 'lines') %>%
  add_trace(y = ~weekdayy_2009$"mean_per_weekday_laundry", name = 'mean_per_weekday_laundry ', mode = 'lines') %>%
  layout(title = "Power Consumption by Sub-meter 2009",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.6. PLOT BY SEASON (HUE), SUB_METER1, YEAR


kitchen_season <- filter(seasonal_kitchen, (year == 2007))
kitchen_season_2007<-plot_ly(kitchen_season, x = ~kitchen_season$weekday, y = ~kitchen_season$"mean_per_kitchen_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~kitchen_season$"mean_per_kitchen_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~kitchen_season$"mean_per_kitchen_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~kitchen_season$"mean_per_kitchen_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption kitchen 2007",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

kitchen_seasonn <- filter(seasonal_kitchen, (year == 2008))
kitchen_season_2008<-plot_ly(kitchen_seasonn, x = ~kitchen_seasonn$weekday, y = ~kitchen_seasonn$"mean_per_kitchen_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~kitchen_seasonn$"mean_per_kitchen_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~kitchen_seasonn$"mean_per_kitchen_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~kitchen_seasonn$"mean_per_kitchen_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption kitchen 2008",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

kitchen_seasonnn <- filter(seasonal_kitchen, (year == 2009))
kitchen_season_2009<-plot_ly(kitchen_seasonnn, x = ~kitchen_seasonnn$weekday, y = ~kitchen_seasonnn$"mean_per_kitchen_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~kitchen_seasonnn$"mean_per_kitchen_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~kitchen_seasonnn$"mean_per_kitchen_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~kitchen_seasonnn$"mean_per_kitchen_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption kitchen 2009",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.6. PLOT BY SEASON (HUE), SUB_METER2, YEAR

laundry_season <- filter(seasonal_laundry, (year == 2007))
laundry_season_2007<-plot_ly(laundry_season, x = ~laundry_season$weekday, y = ~laundry_season$"mean_per_laundry_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~laundry_season$"mean_per_laundry_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~laundry_season$"mean_per_laundry_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~laundry_season$"mean_per_laundry_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption LAUNDRY 2007",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

laundry_seasonn <- filter(seasonal_laundry, (year == 2008))
laundry_season_2008<-plot_ly(laundry_seasonn, x = ~laundry_seasonn$weekday, y = ~laundry_seasonn$"mean_per_laundry_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~laundry_seasonn$"mean_per_laundry_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~laundry_seasonn$"mean_per_laundry_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~laundry_seasonn$"mean_per_laundry_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption LAUNDRY 2008",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

laundry_seasonnn <- filter(seasonal_laundry, (year == 2009))
laundry_season_2009<-plot_ly(laundry_seasonnn, x = ~laundry_seasonnn$weekday, y = ~laundry_seasonnn$"mean_per_laundry_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~laundry_seasonnn$"mean_per_laundry_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~laundry_seasonnn$"mean_per_laundry_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~laundry_seasonnn$"mean_per_laundry_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption LAUNDRY 2009",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))



# 5.7. PLOT BY SEASON (HUE), SUB_METER3, YEAR

water_season <- filter(seasonal_water, (year == 2007))
water_season_2007<-plot_ly(water_season, x = ~water_season$weekday, y = ~water_season$"mean_per_water_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~water_season$"mean_per_water_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~water_season$"mean_per_water_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~water_season$"mean_per_water_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption WATER 2007",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

water_seasonn <- filter(seasonal_water, (year == 2008))
water_season_2008<-plot_ly(water_seasonn, x = ~water_seasonn$weekday, y = ~water_seasonn$"mean_per_water_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~water_seasonn$"mean_per_water_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~water_seasonn$"mean_per_water_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~water_seasonn$"mean_per_water_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption WATER 2008",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))

water_seasonnn <- filter(seasonal_water, (year == 2009))
water_season_2009<-plot_ly(water_seasonnn, x = ~water_seasonnn$weekday, y = ~water_seasonnn$"mean_per_water_winter", 
                             name = 'WINTER', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~water_seasonnn$"mean_per_water_spring" , name = 'SPRING', mode = 'lines') %>%
  add_trace(y = ~water_seasonnn$"mean_per_water_summer", name = 'SUMMER', mode = 'lines') %>%
  add_trace(y = ~water_seasonnn$"mean_per_water_fall", name = 'FALL', mode = 'lines') %>%
  layout(title = "Power Consumption WATER 2009",
         xaxis = list(title = "Weekday"),
         yaxis = list (title = "Power (watt-hours)"))


#6. PLOT BY HOUR

hour_207 <- filter(total_hour, (year == 2007))
hour_2007<-plot_ly(hour_207, x = ~hour_207$hour, y = ~hour_207$"mean_per_hour_kitchen", 
                           name = 'KITCHEN', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hour_207$"mean_per_hour_laundry" , name = 'LAUNDRY', mode = 'lines') %>%
  add_trace(y = ~hour_207$"mean_per_hour_water", name = 'WATER', mode = 'lines') %>%
  layout(title = "Power Consumption WATER by hour 2007",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hour_208 <- filter(total_hour, (year == 2008))
hour_2008<-plot_ly(hour_208, x = ~hour_208$hour, y = ~hour_208$"mean_per_hour_kitchen", 
                   name = 'KITCHEN', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hour_208$"mean_per_hour_laundry" , name = 'LAUNDRY', mode = 'lines') %>%
  add_trace(y = ~hour_208$"mean_per_hour_water", name = 'WATER', mode = 'lines') %>%
  layout(title = "Power Consumption by hour 2008",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hour_209 <- filter(total_hour, (year == 2009))
hour_2009<-plot_ly(hour_209, x = ~hour_209$hour, y = ~hour_209$"mean_per_hour_kitchen", 
                   name = 'KITCHEN', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hour_209$"mean_per_hour_laundry" , name = 'LAUNDRY', mode = 'lines') %>%
  add_trace(y = ~hour_209$"mean_per_hour_water", name = 'WATER', mode = 'lines') %>%
  layout(title = "Power Consumption by hour 2009",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.6. PLOT BY HOUR (HUE), SUB_METER1, YEAR

hourly_kitchen <- filter(hour_kitchen, (year == 2007))
ly_2007<-plot_ly(hourly_kitchen, x = ~hourly_kitchen$weekday, y = ~hourly_kitchen$"morning_kitchen", 
                   name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourly_kitchen$"midday_kitchen" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourly_kitchen$"afternoon_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourly_kitchen$"noon_kitchen", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourly_kitchen$"night_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2007",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hourlyy_kitchen <- filter(hour_kitchen, (year == 2008))
ly_2008<-plot_ly(hourlyy_kitchen, x = ~hourlyy_kitchen$weekday, y = ~hourlyy_kitchen$"morning_kitchen", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourlyy_kitchen$"midday_kitchen" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourlyy_kitchen$"afternoon_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourlyy_kitchen$"noon_kitchen", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourlyy_kitchen$"night_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2008",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hourlyyy_kitchen <- filter(hour_kitchen, (year == 2009))
ly_2009<-plot_ly(hourlyyy_kitchen, x = ~hourlyyy_kitchen$weekday, y = ~hourlyyy_kitchen$"morning_kitchen", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_kitchen$"midday_kitchen" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_kitchen$"afternoon_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_kitchen$"noon_kitchen", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_kitchen$"night_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2009",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.7. PLOT BY HOUR (HUE), SUB_METER2, YEAR

hourly_laundry <- filter(hour_laundry, (year == 2007))
lyy_2007<-plot_ly(hourly_laundry, x = ~hourly_laundry$weekday, y = ~hourly_laundry$"morning_laundry", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourly_laundry$"midday_laundry" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourly_laundry$"afternoon_laundry", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourly_laundry$"noon_laundry", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourly_laundry$"night_laundry", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Laundry Room 2007",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hourlyy_laundry <- filter(hour_laundry, (year == 2008))
lyy_2008<-plot_ly(hourlyy_laundry, x = ~hourlyy_laundry$weekday, y = ~hourlyy_laundry$"morning_laundry", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourlyy_laundry$"midday_laundry" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourlyy_laundry$"afternoon_laundry", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourlyy_laundry$"noon_laundry", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourlyy_laundry$"night_laundry", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Laundry Room 2008",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hourlyyy_laundry <- filter(hour_laundry, (year == 2009))
lyy_2009<-plot_ly(hourlyyy_laundry, x = ~hourlyyy_laundry$weekday, y = ~hourlyyy_laundry$"morning_laundry", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_laundry$"midday_laundry" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_laundry$"afternoon_laundry", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_laundry$"noon_laundry", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_laundry$"night_laundry", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Laundry Room 2009",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.7. PLOT BY HOUR (HUE), SUB_METER3, YEAR


hourly_water <- filter(hour_water, (year == 2007))
lyyy_2007<-plot_ly(hourly_water, x = ~hourly_water$weekday, y = ~hourly_water$"morning_water", 
                  name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourly_water$"midday_water" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourly_water$"afternoon_water", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourly_water$"noon_water", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourly_water$"night_water", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Water Heater & AC 2007",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hourlyy_water <- filter(hour_water, (year == 2008))
lyyy_2008<-plot_ly(hourlyy_water, x = ~hourlyy_water$weekday, y = ~hourlyy_water$"morning_water", 
                  name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourlyy_water$"midday_water" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourlyy_water$"afternoon_water", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourlyy_water$"noon_water", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourlyy_water$"night_water", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Water Heater & AC 2008",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

hourlyyy_water <- filter(hour_water, (year == 2009))
lyyy_2009<-plot_ly(hourlyyy_water, x = ~hourlyyy_water$weekday, y = ~hourlyyy_water$"morning_water", 
                  name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_water$"midday_water" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_water$"afternoon_water", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_water$"noon_water", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourlyyy_water$"night_water", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Water Heater & AC 2009",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.8. PLOT BY HOUR (HUE), SUB_METER1, MONTH 

monthly_kitchen <- filter(month_kitchen, (year == 2007))
thly_2007<-plot_ly(monthly_kitchen , x = ~monthly_kitchen$month, y = ~monthly_kitchen$"morning_kitchen", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"afternoon_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"dusk_kitchen", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"night_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2007",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

monthly_kitchen <- filter(month_kitchen, (year == 2008))
thly_2008<-plot_ly(monthly_kitchen , x = ~monthly_kitchen$month, y = ~monthly_kitchen$"morning_kitchen", 
                   name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"afternoon_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"dusk_kitchen", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"night_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2008",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

monthly_kitchen <- filter(month_kitchen, (year == 2009))
thly_2009<-plot_ly(monthly_kitchen , x = ~monthly_kitchen$month, y = ~monthly_kitchen$"morning_kitchen", 
                   name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"afternoon_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"dusk_kitchen", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_kitchen$"night_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2009",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.8. PLOT BY HOUR (HUE), SUB_METER2, MONTH 

monthly_laundry <- filter(month_laundry, (year == 2007))
thlyy_2007<-plot_ly(monthly_laundry , x = ~monthly_laundry$month, y = ~monthly_laundry$"morning_laundry", 
                   name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"afternoon_laundry", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"dusk_laundry", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"night_laundry", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour laundry 2007",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

monthly_laundry <- filter(month_laundry, (year == 2008))
thlyy_2008<-plot_ly(monthly_laundry , x = ~monthly_laundry$month, y = ~monthly_laundry$"morning_laundry", 
                    name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"afternoon_laundry", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"dusk_laundry", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"night_laundry", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour laundry 2008",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

monthly_laundry <- filter(month_laundry, (year == 2009))
thlyy_2009<-plot_ly(monthly_laundry , x = ~monthly_laundry$month, y = ~monthly_laundry$"morning_laundry", 
                    name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"afternoon_laundry", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"dusk_laundry", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_laundry$"night_laundry", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour laundry 2009",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

# 5.8. PLOT BY HOUR (HUE), SUB_METER3, MONTH 

monthly_water <- filter(month_water, (year == 2007))
thlyyy_2007<-plot_ly(monthly_water , x = ~monthly_water$month, y = ~monthly_water$"morning_water", 
                    name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"afternoon_water", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"dusk_water", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"night_water", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour water 2007",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

monthly_water <- filter(month_water, (year == 2008))
thlyyy_2008<-plot_ly(monthly_water , x = ~monthly_water$month, y = ~monthly_water$"morning_water", 
                    name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"afternoon_water", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"dusk_water", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"night_water", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour water 2008",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))

monthly_water <- filter(month_water, (year == 2009))
thlyyy_2009<-plot_ly(monthly_water , x = ~monthly_water$month, y = ~monthly_water$"morning_water", 
                    name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"afternoon_water", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"dusk_water", name = 'Dusk', mode = 'lines') %>%
  add_trace(y = ~monthly_water$"night_water", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour water 2009",
         xaxis = list(title = "Month"),
         yaxis = list (title = "Power (watt-hours)"))




# 5.7. HOUR BY WEEK


hourly_week_kitchen <- filter(hour_week_kitchen, (year == 2007))
ly_week_2007<-plot_ly(hourly_week_kitchen, x = ~hourly_week_kitchen$week, y = ~hourly_week_kitchen$"morning_week_kitchen", 
                 name = 'Morning', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~hourly_week_kitchen$"midday_weeK_kitchen" , name = 'MidDay', mode = 'lines') %>%
  add_trace(y = ~hourly_week_kitchen$"afternoon_week_kitchen", name = 'Afternoon', mode = 'lines') %>%
  add_trace(y = ~hourly_week_kitchen$"noon_week_kitchen", name = 'Noon', mode = 'lines') %>%
  add_trace(y = ~hourly_week_kitchen$"night_week_kitchen", name = 'Night', mode = 'lines') %>%
  layout(title = "Power Consumption by hour Kitchen 2007",
         xaxis = list(title = "hour"),
         yaxis = list (title = "Power (watt-hours)"))



# 5.5. PLOTLY (PLOTS OF THREE SUB-METERS AND TOTAL TOGETHER)

# Plot all of three sub-meters year 2007

## 2007 - PER WEEK
all_2007 <- filter(total, (year == 2007))
## Plot sub-meter 1, 2 and 3 with title, legend and labels 
year_2007<-plot_ly(all_2007, x = ~all_2007$week, y = ~all_2007$mean_per_week_water, name = 'Water Heater & AC', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~all_2007$mean_per_week_kitchen , name = 'Kitchen', mode = 'lines') %>%
  add_trace(y = ~all_2007$mean_per_week_laundry, name = 'Laundry RoomC', mode = 'lines') %>%
  layout(title = "Power Consumption 2007",
         xaxis = list(title = "Week"),
         yaxis = list (title = "Power (watt-hours)"))


## 2008 - PER WEEK
all_2008 <- filter(total, (year == 2008))
## Plot sub-meter 1, 2 and 3 with title, legend and labels 
year_2008<-plot_ly(all_2008, x = ~all_2008$week, y = ~all_2008$mean_per_week_water, name = 'Water Heater & AC', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~all_2008$mean_per_week_kitchen , name = 'Kitchen', mode = 'lines') %>%
  add_trace(y = ~all_2008$mean_per_week_laundry, name = 'Laundry Room', mode = 'lines') %>%
  layout(title = "Power Consumption 2008",
         xaxis = list(title = "Week"),
         yaxis = list (title = "Power (watt-hours)"))

## 2009 - PER WEEK
all_2009 <- filter(total, (year == 2009))
## Plot sub-meter 1, 2 and 3 with title, legend and labels 
year_2009<-plot_ly(all_2009, x = ~all_2009$week, y = ~all_2009$mean_per_week_water, name = 'Water Heater & AC', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~all_2009$mean_per_week_kitchen , name = 'Kitchen', mode = 'lines') %>%
  add_trace(y = ~all_2009$mean_per_week_laundry, name = 'Laundry Room', mode = 'lines') %>%
  layout(title = "Power Consumption 2009",
         xaxis = list(title = "Week"),
         yaxis = list (title = "Power (watt-hours)"))











