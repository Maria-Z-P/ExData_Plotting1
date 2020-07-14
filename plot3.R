p1 <- read.csv2('household_power_consumption.txt')
dim(p1)

my_proj <- subset(p1, Date == "1/2/2007" | Date == "2/2/2007")
dim(my_proj)
rm("p1")

for (i in 3:9) my_proj[[i]] <- as.numeric(my_proj[[i]])

dates <- my_proj$Date
times <- my_proj$Time
dt <- paste(dates, times)
head(dt)

library(lubridate)

start <- ymd_hms("2007-02-01 00:00:00")
dif <- as.period(interval(start, dmy_hms(dt)))
head(dif)

sm1 <- my_proj$Sub_metering_1
sm2 <- my_proj$Sub_metering_2
sm3 <- my_proj$Sub_metering_3

#------------
# Plot3
plot(x=dif, y=sm1, xlab = "", type = "l", xaxt = "n", ylab = "Energy sub metering", main = "")
lines(x=dif, y=sm2, col = "red")
lines(x=dif, y=sm3, col = "blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, c(1,24*60*60,24*60*60*2), c("Thu","Fri","Sat"))
dev.copy(png, file = "plot3.png")
dev.off()
