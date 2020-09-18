getwd()
setwd('C:/R')

df <- read.csv("data_fin.csv", header =T )
head(df)

df$tot <- df$MLB_Blog+df$MLB_TW+df$MLB_insta
head(df)
mlb <- cbind(df$MLB_ceng, df$tot)

time.points <- as.Date(df$date, "%Y-%m-%d") 
weeknum <- df$WEEKNUM
data <- zoo(mlb, time.points)
str(mlb_data)
head(date)
dim(mlb)
# 305   2

################## CausalImpact Date 있음######################

install.packages("CausalImpact")
library(CausalImpact)

matplot(mlb, type = "l")

pre.period <- as.Date(c("2019-11-01", "2019-11-07"))
post.period <- as.Date(c("2019-11-08", "2019-11-14"))

impact <- CausalImpact(data, pre.period, post.period)
plot(impact)

summary(impact)

impact$summary["Average","RelEffect"]

#############  CausalImpact Date 없음######################

pre.period <- c(4, 10)
post.period <- c(11, )

impact <- CausalImpact(mlb, pre.period, post.period)
plot(impact)

summary(impact)
