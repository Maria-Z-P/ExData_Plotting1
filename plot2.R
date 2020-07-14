p1 <- read.csv2('household_power_consumption.txt')
dim(p1)

my_proj <- subset(p1, Date == "1/2/2007" | Date == "2/2/2007")
dim(my_proj)
rm("p1")

for (i in 3:9) my_proj[[i]] <- as.numeric(my_proj[[i]])

gap <- my_proj$Global_active_power

dates <- my_proj$Date
times <- my_proj$Time
dt <- paste(dates, times)
head(dt)

library(lubridate)

start <- ymd_hms("2007-02-01 00:00:00")
dif <- as.period(interval(start, dmy_hms(dt)))
head(dif)

#------------
# Plot2
plot(x=dif, y=gap, xlab = "", type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", main = "")
axis(1, c(1,24*60*60,24*60*60*2), c("Thu","Fri","Sat"))
dev.copy(png, file = "plot2.png")
dev.off() 
