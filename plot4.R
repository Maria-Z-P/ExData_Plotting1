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

sm1 <- my_proj$Sub_metering_1
sm2 <- my_proj$Sub_metering_2
sm3 <- my_proj$Sub_metering_3

#------------
# Plot4
par(mfcol=c(2,2), mar = c(4, 4, 1, 1), oma = c(0, 0, 1, 0))

plot(x=dif, y=gap, xlab = "", type = "l", xaxt = "n", ylab = "Global Active Power", cex = 0.5, main = "")
axis(1, c(1,24*60*60,24*60*60*2), c("Thu","Fri","Sat"))

plot(x=dif, y=sm1, xlab = "", type = "l", xaxt = "n", ylab = "Energy sub metering", main = "")
lines(x=dif, y=sm2, col = "red")
lines(x=dif, y=sm3, col = "blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),  cex = 0.7,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, c(1,24*60*60,24*60*60*2), c("Thu","Fri","Sat"))

plot(x=dif, y=my_proj$Voltage, xlab = "datetime", type = "l", xaxt = "n", ylab = "Voltage", main = "")
axis(1, c(1,24*60*60,24*60*60*2), c("Thu","Fri","Sat"))

plot(x=dif, y=my_proj$Global_reactive_power, xlab = "datetime", type = "l", xaxt = "n", ylab = "Global_reactive_power", main = "")
axis(1, c(1,24*60*60,24*60*60*2), c("Thu","Fri","Sat"))

dev.copy(png, file = "plot4.png")
dev.off()
