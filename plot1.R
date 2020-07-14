p1 <- read.csv2('household_power_consumption.txt')
dim(p1)

my_proj <- subset(p1, Date == "1/2/2007" | Date == "2/2/2007")
dim(my_proj)
head(my_proj)
tail(my_proj)
my_proj[1,1:2]
my_proj[nrow(my_proj),1:2]
rm("p1")

for (i in 3:9) my_proj[[i]] <- as.numeric(my_proj[[i]])
str(my_proj)
any(is.na(my_proj))
summary(my_proj)

d <- as.Date(my_proj$Date, "%d/%m/%y")
head(d)
class(d)
gap <- my_proj$Global_active_power

#------------
# Plot1
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()  
