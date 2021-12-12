# Visualization of results
library(magrittr)
library(tidyverse)
library(lubridate)
tmy_1<-read.csv("tmy_1.csv")
#make the time of bootstrap files as DATE
tmy_1<- tmy_1 %>%
  mutate(date = paste("2021",Month, Day,sep = "-"))
tmy_1$date=paste(tmy_1$date,tmy_1$Hour,sep = " ")
tmy_1$date=paste(tmy_1$date,":00:00",sep = "")
ymd_hms(tmy_1$date)
#make the time of original files as DATE
df_tmy_1<- df1[1:8760,]
df_tmy_1<- df_tmy_1 %>%
  mutate(date = paste("2021",Month, Day,sep = "-"))
df_tmy_1$date=paste(df_tmy_1$date,df_tmy_1$Hour,sep = " ")
df_tmy_1$date=paste(df_tmy_1$date,":00:00",sep = "")
ymd_hms(df_tmy_1$date)

#plot to compare result

factor_boot<- ts(tmy_1$Temperature,start =c(1,1), end=c(12,12),frequency = 12)
plot(factor_boot,xlab = "Month",ylab ="factor",ylim=c(-20,40),col = "red")
par(new=TRUE)

factor_tmy<- ts(df_tmy_1$Temperature,start =c(1,1), end=c(12,12),frequency = 12)
plot(factor_tmy,xlab = "Month",ylab ="factor",ylim=c(-20,40),col = "blue")
