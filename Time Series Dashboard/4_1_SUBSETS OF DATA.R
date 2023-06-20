#LEGEND: 
#SUB_METER 1-> KITCHEN
#SUB_METER_2-> LAUNDRY ROOM
#SUB_METER_3-> WATER HEATER & AC

#1. SUM ALL 3 SUBMETERS

df$total_sub_meter<-df$Sub_metering_1 + df$Sub_metering_2 + df$Sub_metering_3


#2.WEEKLY SUB_METER_MEANS

#2.1 WEEKLY/WEEKDAY/MONTHLY/HOURLY MEAN SUB_METER_1 KITCHEN for 2007 & 2008 & 2009

mean_per_week_kitchen <-df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, week) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, week)

mean_per_weekday_kitchen <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, weekday) 

mean_per_month_kitchen <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, month, week, day, weekday) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, month, week, day, weekday) 

mean_per_hour_kitchen <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, hour) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, hour) 


# 2.2. WEEKLY/WEEKDAY/MONTHLY MEAN SUB_METER_2 LAUNDRY ROOM for 2007 & 2008 & 2009

mean_per_week_laundry <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, week) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year)

mean_per_weekday_laundry<- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year, weekday) 

mean_per_month_laundry <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, month, week, day, weekday) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year, month, week, day, weekday) 

mean_per_hour_laundry <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, hour) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year, hour) 

# 2.3. WEEKLY/WEEKDAY/MONTHLY MEAN SUB_METER_3 ('Water Heater & AC) for 2007, 2008 & 2009, decomposed

mean_per_week_water <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, week) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, week)

mean_per_weekday_water <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, weekday) 

mean_per_month_water <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, month, week, day, weekday) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, month, week, day, weekday) 

mean_per_water <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, weekday, hour) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, weekday, hour) 

mean_per_hour_water <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, hour) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, hour) 

# 2.4. TOTAL SUB_METER MEAN PER DAY

mean_per_week_total <-df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, week) %>%
  summarise(mean = mean(total_sub_meter)) %>%
  arrange(year, week)

mean_per_weekday_total <- df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(Sub_metering_1+Sub_metering_2+Sub_metering_3)) %>%
  arrange(year, weekday) 

mean_per_month_total <-df %>%
  filter(year %in% c(2007, 2008, 2009)) %>%
  group_by(year, month, week, day, weekday) %>%
  summarise(mean = mean(total_sub_meter)) %>%
  arrange(year, month, week, day, weekday)


# 2.5. TOTAL SUB_METER MEAN PER YEAR

mean_2007 <- df %>%
  filter(year %in% c(2007)) %>%
  group_by(weekday) %>%
  summarise('2007' = mean(total_sub_meter)) %>%
  arrange(weekday) 

mean_2008 <- df %>%
  filter(year %in% c(2008)) %>%
  group_by(weekday) %>%
  summarise('2008' = mean(total_sub_meter)) %>%
  arrange(weekday) 

mean_2009 <- df %>%
  filter(year %in% c(2009)) %>%
  group_by(year, weekday) %>%
  summarise('2009' = mean(total_sub_meter)) %>%
  arrange(year, weekday) 

#3. PER SEASON and SUB-METER AND WEEKDAY

#3.1. SUB-METER 1 - KITCHEN


season_1 <-df %>%
  group_by(year, month, weekday) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, month) 

season_1<- season_1 %>%
  mutate(season = case_when(
    month %in%  9:11 ~ "Fall",
    month %in%  c(12, 1, 2)  ~ "Winter",
    month %in%  3:5  ~ "Spring",
    TRUE ~ "Summer")) 

season_1 <- subset(season_1, select = - c(month))   
season_1 

season_1_1 <-season_1 %>%
  filter(season %in% c("Winter")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_1_2 <-season_1 %>%
  filter(season %in% c("Spring")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_1_3 <-season_1 %>%
  filter(season %in% c("Summer")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_1_4 <-season_1 %>%
  filter(season %in% c("Fall")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_kitchen<-season_1_1 %>% 
  left_join(season_1_2, by = c("year","weekday")) %>%
  left_join(season_1_3, by = c("year","weekday")) %>%
  left_join(season_1_4, by = c("year","weekday"))

seasonal_kitchen <- season_kitchen %>%
  rename(mean_per_kitchen_winter = mean.x,
         mean_per_kitchen_spring = mean.y,
         mean_per_kitchen_summer = mean.x.x,
         mean_per_kitchen_fall = mean.y.y)

  
#3.1. SUB-METER 2 - LAUNDRY


season_2 <-df %>%
  group_by(year, month, weekday) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year, month) 


season_2<- season_2 %>%
  mutate(season = case_when(
    month %in%  9:11 ~ "Fall",
    month %in%  c(12, 1, 2)  ~ "Winter",
    month %in%  3:5  ~ "Spring",
    TRUE ~ "Summer")) 

season_2 <- subset(season_2, select = - c(month))   
season_2 

season_2_1 <-season_2 %>%
  filter(season %in% c("Winter")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_2_2 <-season_2 %>%
  filter(season %in% c("Spring")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_2_3 <-season_2 %>%
  filter(season %in% c("Summer")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_2_4 <-season_2 %>%
  filter(season %in% c("Fall")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_laundry<-season_2_1 %>% 
  left_join(season_2_2, by = c("year","weekday")) %>%
  left_join(season_2_3, by = c("year","weekday")) %>%
  left_join(season_2_4, by = c("year","weekday"))

seasonal_laundry <- season_laundry %>%
  rename(mean_per_laundry_winter = mean.x,
         mean_per_laundry_spring = mean.y,
         mean_per_laundry_summer = mean.x.x,
         mean_per_laundry_fall = mean.y.y)

#3.3. SUB-METER 3 - WATER


season_3 <-df %>%
  group_by(year, month, weekday) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, month) 


season_3<- season_3 %>%
  mutate(season = case_when(
    month %in%  9:11 ~ "Fall",
    month %in%  c(12, 1, 2)  ~ "Winter",
    month %in%  3:5  ~ "Spring",
    TRUE ~ "Summer")) 

season_3 <- subset(season_3, select = - c(month))   
season_3 

season_3_1 <-season_3 %>%
  filter(season %in% c("Winter")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_3_2 <-season_3 %>%
  filter(season %in% c("Spring")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_3_3 <-season_3 %>%
  filter(season %in% c("Summer")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_3_4 <-season_3 %>%
  filter(season %in% c("Fall")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

season_water<-season_3_1 %>% 
  left_join(season_3_2, by = c("year","weekday")) %>%
  left_join(season_3_3, by = c("year","weekday")) %>%
  left_join(season_3_4, by = c("year","weekday"))

seasonal_water <- season_water %>%
  rename(mean_per_water_winter = mean.x,
         mean_per_water_spring = mean.y,
         mean_per_water_summer = mean.x.x,
         mean_per_water_fall = mean.y.y)

#3. PER HOUR and SUB-METER AND WEEKDAY

#3.1. SUB-METER 1 - KITCHEN


hour_kitchen <-df %>%
  group_by(year, weekday, hour) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, weekday, hour) 

hour_kitchen<- hour_kitchen %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:15  ~ "MidDay",
    hour %in%  15:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Noon",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

hour_morning_kitchen <-hour_kitchen %>%
  filter(timezone%in% c("Morning")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_midday_kitchen <-hour_kitchen %>%
  filter(timezone %in% c("MidDay")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_afternoon_kitchen <-hour_kitchen %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_noon_kitchen <-hour_kitchen %>%
  filter(timezone %in% c("Noon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_night_kitchen <-hour_kitchen %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_kitchen<-hour_morning_kitchen %>% 
  left_join(hour_midday_kitchen, by = c("year","weekday")) %>%
  left_join(hour_afternoon_kitchen, by = c("year","weekday")) %>%
  left_join(hour_noon_kitchen, by = c("year","weekday")) %>%
  left_join(hour_night_kitchen, by = c("year","weekday"))
  
hour_kitchen <- hour_kitchen %>%
  rename(morning_kitchen = mean.x,
         midday_kitchen = mean.y,
         afternoon_kitchen = mean.x.x,
         noon_kitchen = mean.y.y,
         night_kitchen = mean)


#3.2. SUB-METER 2 - LAUNDRY


hour_laundry <-df %>%
  group_by(year, weekday, hour) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year, weekday, hour) 

hour_laundry<- hour_laundry %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:15  ~ "MidDay",
    hour %in%  15:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Noon",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

hour_morning_laundry <-hour_laundry %>%
  filter(timezone%in% c("Morning")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_midday_laundry <-hour_laundry %>%
  filter(timezone %in% c("MidDay")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_afternoon_laundry <-hour_laundry %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_noon_laundry <-hour_laundry %>%
  filter(timezone %in% c("Noon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_night_laundry <-hour_laundry %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_laundry<-hour_morning_laundry %>% 
  left_join(hour_midday_laundry, by = c("year","weekday")) %>%
  left_join(hour_afternoon_laundry, by = c("year","weekday")) %>%
  left_join(hour_noon_laundry, by = c("year","weekday")) %>%
  left_join(hour_night_laundry, by = c("year","weekday"))

hour_laundry <- hour_laundry %>%
  rename(morning_laundry = mean.x,
         midday_laundry = mean.y,
         afternoon_laundry = mean.x.x,
         noon_laundry = mean.y.y,
         night_laundry = mean)

#3.3. SUB-METER 3 - WATER

hour_water <-df %>%
  group_by(year, weekday, hour) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, weekday, hour) 

hour_water<- hour_water %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:15  ~ "MidDay",
    hour %in%  15:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Noon",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

hour_morning_water <-hour_water %>%
  filter(timezone%in% c("Morning")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_midday_water <-hour_water %>%
  filter(timezone %in% c("MidDay")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_afternoon_water <-hour_water %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_noon_water <-hour_water %>%
  filter(timezone %in% c("Noon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_night_water <-hour_water %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_water<-hour_morning_water %>% 
  left_join(hour_midday_water, by = c("year","weekday")) %>%
  left_join(hour_afternoon_water, by = c("year","weekday")) %>%
  left_join(hour_noon_water, by = c("year","weekday")) %>%
  left_join(hour_night_water, by = c("year","weekday"))

hour_water <- hour_water %>%
  rename(morning_water = mean.x,
         midday_water = mean.y,
         afternoon_water = mean.x.x,
         noon_water = mean.y.y,
         night_water = mean)



#3.1. SUB-METER 1 - KITCHEN

hour_week_kitchen <-df %>%
  group_by(year, week, hour) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, week, hour) 

hour_week_kitchen<- hour_week_kitchen %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:15  ~ "MidDay",
    hour %in%  15:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Noon",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

hour_morning_week_kitchen <-hour_week_kitchen %>%
  filter(timezone%in% c("Morning")) %>%
  group_by(year, week) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, week) 

hour_midday_week_kitchen <-hour_week_kitchen %>%
  filter(timezone %in% c("MidDay")) %>%
  group_by(year, week) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, week) 

hour_afternoon_week_kitchen <-hour_week_kitchen %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, week) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, week) 

hour_noon_week_kitchen <-hour_week_kitchen %>%
  filter(timezone %in% c("Noon")) %>%
  group_by(year, week) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, week) 

hour_night_week_kitchen<-kitchen <-hour_week_kitchen %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, week) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, week) 

hour_week_kitchen<-hour_morning_week_kitchen %>% 
  left_join(hour_midday_week_kitchen, by = c("year","week")) %>%
  left_join(hour_afternoon_week_kitchen, by = c("year","week")) %>%
  left_join(hour_noon_week_kitchen, by = c("year","week")) %>%
  left_join(hour_night_week_kitchen, by = c("year","week"))

hour_week_kitchen <- hour_week_kitchen %>%
  rename(morning_week_kitchen = mean.x,
         midday_weeK_kitchen = mean.y,
         afternoon_week_kitchen = mean.x.x,
         noon_week_kitchen = mean.y.y,
         night_week_kitchen = mean)


#3.2. SUB-METER 2 - LAUNDRY


hour_laundry <-df %>%
  group_by(year, weekday, hour) %>%
  summarise(mean = mean(Sub_metering_2)) %>%
  arrange(year, weekday, hour) 

hour_laundry<- hour_laundry %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:15  ~ "MidDay",
    hour %in%  15:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Noon",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

hour_morning_laundry <-hour_laundry %>%
  filter(timezone%in% c("Morning")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_midday_laundry <-hour_laundry %>%
  filter(timezone %in% c("MidDay")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_afternoon_laundry <-hour_laundry %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_noon_laundry <-hour_laundry %>%
  filter(timezone %in% c("Noon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_night_laundry <-hour_laundry %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_laundry<-hour_morning_laundry %>% 
  left_join(hour_midday_laundry, by = c("year","weekday")) %>%
  left_join(hour_afternoon_laundry, by = c("year","weekday")) %>%
  left_join(hour_noon_laundry, by = c("year","weekday")) %>%
  left_join(hour_night_laundry, by = c("year","weekday"))

hour_laundry <- hour_laundry %>%
  rename(morning_laundry = mean.x,
         midday_laundry = mean.y,
         afternoon_laundry = mean.x.x,
         noon_laundry = mean.y.y,
         night_laundry = mean)

#3.3. SUB-METER 3 - WATER

hour_water <-df %>%
  group_by(year, weekday, hour) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(year, weekday, hour) 

hour_water<- hour_water %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:15  ~ "MidDay",
    hour %in%  15:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Noon",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

hour_morning_water <-hour_water %>%
  filter(timezone%in% c("Morning")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_midday_water <-hour_water %>%
  filter(timezone %in% c("MidDay")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_afternoon_water <-hour_water %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_noon_water <-hour_water %>%
  filter(timezone %in% c("Noon")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_night_water <-hour_water %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, weekday) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, weekday) 

hour_water<-hour_morning_water %>% 
  left_join(hour_midday_water, by = c("year","weekday")) %>%
  left_join(hour_afternoon_water, by = c("year","weekday")) %>%
  left_join(hour_noon_water, by = c("year","weekday")) %>%
  left_join(hour_night_water, by = c("year","weekday"))

hour_water <- hour_water %>%
  rename(morning_water = mean.x,
         midday_water = mean.y,
         afternoon_water = mean.x.x,
         noon_water = mean.y.y,
         night_water = mean)


#4.1. SUB-METER 1 - KITCHEN BY HOUR AND MONTH

month_kitchen <-df %>%
  group_by(year, month, hour) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, month, hour) 

month_kitchen<- month_kitchen %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Dusk",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

month_kitchen<- month_kitchen %>%
  mutate(season = case_when(
                month %in%  9:11 ~ "Fall",
                month %in%  c(12, 1, 2)  ~ "Winter",
                month %in%  3:5  ~ "Spring",
                TRUE ~ "Summer")) 

month_morning_kitchen <-month_kitchen %>%
  filter(timezone %in% c("Morning")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_afternoon_kitchen <-month_kitchen %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_noon_kitchen <-month_kitchen %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_dusk_kitchen <-month_kitchen %>%
  filter(timezone %in% c("Dusk")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_night_kitchen <-month_kitchen %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_kitchen<-month_morning_kitchen %>% 
  left_join(month_afternoon_kitchen, by = c("year","month")) %>%
  left_join(month_dusk_kitchen, by = c("year","month")) %>%
  left_join(month_night_kitchen, by = c("year","month")) 

month_kitchen <- month_kitchen %>%
  rename(morning_kitchen = mean.x,
         afternoon_kitchen = mean.y,
         dusk_kitchen = mean.x.x,
         night_kitchen = mean.y.y)

#3.4. SUB-METER 2 - LAUNDRY


month_laundry <-df %>%
  group_by(year, month, hour) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, month, hour) 

month_laundry<- month_laundry %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Dusk",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

month_laundry<- month_laundry %>%
  mutate(season = case_when(
    month %in%  9:11 ~ "Fall",
    month %in%  c(12, 1, 2)  ~ "Winter",
    month %in%  3:5  ~ "Spring",
    TRUE ~ "Summer")) 

month_morning_laundry <-month_laundry %>%
  filter(timezone %in% c("Morning")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_afternoon_laundry <-month_laundry %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_dusk_laundry <-month_laundry %>%
  filter(timezone %in% c("Dusk")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_night_laundry <-month_laundry %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_laundry<-month_morning_laundry %>% 
  left_join(month_afternoon_laundry, by = c("year","month")) %>%
  left_join(month_dusk_laundry, by = c("year","month")) %>%
  left_join(month_night_laundry, by = c("year","month")) 

month_laundry <- month_laundry %>%
  rename(morning_laundry = mean.x,
         afternoon_laundry = mean.y,
         dusk_laundry = mean.x.x,
         night_laundry = mean.y.y)


#3.3. SUB-METER 3 - WATER

month_water <-df %>%
  group_by(year, month, hour) %>%
  summarise(mean = mean(Sub_metering_1)) %>%
  arrange(year, month, hour) 

month_water<- month_water %>%
  mutate(timezone = case_when(
    hour %in%  6:13 ~ "Morning",
    hour %in%  13:19  ~ "Afternoon",
    hour %in%  19:23  ~ "Dusk",
    hour %in%  c(23, 0, 1, 2, 3, 4, 5, 6)  ~ "Night")) 

month_water<- month_water %>%
  mutate(season = case_when(
    month %in%  9:11 ~ "Fall",
    month %in%  c(12, 1, 2)  ~ "Winter",
    month %in%  3:5  ~ "Spring",
    TRUE ~ "Summer")) 

month_morning_water <-month_water %>%
  filter(timezone %in% c("Morning")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_afternoon_water <-month_water %>%
  filter(timezone %in% c("Afternoon")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_dusk_water <-month_water %>%
  filter(timezone %in% c("Dusk")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_night_water <-month_water %>%
  filter(timezone %in% c("Night")) %>%
  group_by(year, month) %>%
  summarise(mean = mean(mean)) %>%
  arrange(year, month) 

month_water<-month_morning_water %>% 
  left_join(month_afternoon_water, by = c("year","month")) %>%
  left_join(month_dusk_water, by = c("year","month")) %>%
  left_join(month_night_water, by = c("year","month")) 

month_water <- month_water %>%
  rename(morning_water = mean.x,
         afternoon_water = mean.y,
         dusk_water = mean.x.x,
         night_water = mean.y.y)

# 4. JOINING DATAFRAME AND CHANGING NAMES


total <- mean_per_week_water %>% 
  left_join(mean_per_week_kitchen, by = c("year", "week")) %>%
  left_join(mean_per_week_laundry, by = c("year", "week")) %>%
  left_join(mean_per_week_total, by = c("year", "week"))

print(mean_per_week_water)
print(mean_per_week_water$year==2008)

total <- total %>%
  rename(mean_per_week_water = mean.x,
         mean_per_week_kitchen = mean.y,
         mean_per_week_laundry = mean.x.x,
         mean_per_week_total = mean.y.y)


total_month<-mean_per_month_water %>% 
  left_join(mean_per_month_kitchen, by = c("year", "month")) %>%
  left_join(mean_per_month_laundry, by = c("year", "month")) %>%
  left_join(mean_per_month_total, by = c("year", "month"))

total_month <- total_month %>%
  rename(mean_per_month_water = mean.x,
         mean_per_month_kitchen = mean.y,
         mean_per_month_laundry = mean.x.x,
         mean_per_month_total= mean.y.y)


total_month <- mean_per_month_water %>% 
  left_join(mean_per_month_kitchen, by = c("year", "month", "week", "day", "weekday")) %>%
  left_join(mean_per_month_laundry, by = c("year", "month", "week", "day", "weekday")) %>%
  left_join(mean_per_month_total, by = c("year", "month", "week", "day", "weekday"))


total_month <- total_month %>%
  rename(mean_per_month_water = mean.x,
         mean_per_month_kitchen = mean.y,
         mean_per_month_laundry = mean.x.x,
         mean_per_month_total= mean.y.y)

total_year<-mean_2007 %>% 
  left_join(mean_2008, by = c("weekday")) %>%
  left_join(mean_2009, by = c("weekday")) 

total_season<-season_1 %>% 
  left_join(season_2, by = c("year","season", "weekday")) %>%
  left_join(season_3, by = c("year", "season", "weekday"))

total_season <- total_season %>%
  rename(mean_per_season_kitchen = mean.x,
         mean_per_season_laundry = mean.y,
         mean_per_season_water = mean)

total_hour<-mean_per_hour_kitchen %>% 
  left_join(mean_per_hour_laundry, by = c("year", "hour")) %>%
  left_join(mean_per_hour_water, by = c("year", "hour"))

total_hour <- total_hour %>%
  rename(mean_per_hour_kitchen = mean.x,
         mean_per_hour_laundry = mean.y,
         mean_per_hour_water = mean)

total_weekday<-mean_per_weekday_total %>% 
  left_join(mean_per_weekday_kitchen, by = c("year", "weekday")) %>%
  left_join(mean_per_weekday_laundry, by = c("year", "weekday")) %>%
  left_join(mean_per_weekday_water, by = c("year", "weekday"))

total_weekday <- total_weekday %>%
  rename(mean_per_weekday_total = mean.x,
         mean_per_weekday_kitchen = mean.y,
         mean_per_weekday_laundry = mean.x.x,
         mean_per_weekday_water= mean.y.y)




#LEGEND: 
#SUB_METER 1-> KITCHEN
#SUB_METER_2-> LAUNDRY ROOM
#SUB_METER_3-> WATER HEATER & AC



## Iterate it with a for (dictionary)


  