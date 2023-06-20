# 5.6. DECOMPOSITION OF TIMESERIES

decomp_water <- decompose(weekly_water)
plot(decomp_water)

decomp_kitchen<- decompose(weekly_kitchen)
plot(decomp_kitchen)

decomp_laundry<- decompose(weekly_laundry)
plot(decomp_laundry)

decomp_total<- decompose(weekly_total)
plot(decomp_total)



weekly <- total[, c("mean_per_week_total", "mean_per_week_water",
                    "mean_per_week_kitchen", "mean_per_week_laundry")]
datacheck<- total[, c("mean_per_week_total")]

#DATA / TREND / SEASONAL/REMAINDER

datacheck_frequency %>% decompose(type="multiplicative") %>%
  autoplot() + xlab("week") +
  ggtitle("Classical multiplicative decomposition
of electrical equipment index")

datacheck_frequency %>% decompose(type="additive") %>%
  autoplot() + xlab("week") +
  ggtitle("Classical multiplicative decomposition
of electrical equipment index")


## Note: Multiplicative: Top Line (data)

## TIME SERIES MULTIPLICATIVE AND ADDITIVE CHECK INFORMATION

## Additive Time Series: Top Line (data), variation stays more or less the same, 
## Constant trend



#PLOT WEEKLY FREQUENCY

weekly_frequency<-ts(weekly, start=c(2007, 1), frequency=52)
datacheck_frequency<-ts(datacheck, start=c(2007, 1), frequency=52)
autoplot(weekly_frequency)


#TAKING AWAY THE TREND FOR TOTAL SUB_METER:

weekly_total <- total[, c("mean_per_week_total")]
weekly_total_frequency<-ts(weekly_total, start=c(2007, 1), frequency=52)
DY<-diff(weekly_total_frequency)
autoplot(DY)

ggseasonplot(DY)
ggsubseriesplot(DY)

fit<-snaive(DY)
print(summary(fit))
checkresiduals(fit)


## residuals: normal and centered around 0
## ACF: CHECK


#FORECAST


autoplot(weekly) + xlab("day") + ylab("Sub_metering_3") +
  ggtitle("Sub_Metering_3 Mean Per Week")

fit <- stl(weeky, t.window=13, s.window="periodic",
           robust=TRUE)
fit %>% seasadj() %>% naive() %>%
  autoplot() + ylab("mean") +
  ggtitle("Naive forecasts of seasonally adjusted data")

fit %>% forecast(method="naive") %>%
  autoplot() + ylab("mean")

df %>% decompose(type="multiplicative") %>%
  autoplot() + xlab("Year") +
  ggtitle("Classical multiplicative decomposition
of electrical equipment index")

d<-df %>%
  group_by(month, day, weekday) %>%
  summarise(mean = mean(Sub_metering_3)) %>%
  arrange(month, day, weekday)

weekLy <- ts(d$mean, frequency=52, start=c(2007,1), end = c(2009, 52))

