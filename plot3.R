# reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';',na.strings = c("Not Available"))
# subsetting
df <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
days <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')
# plotting
setwd("D://My Documents/My Document")
png(filename = "plot3.png",width = 480, height = 480)
plot(as.numeric(as.character(df$Sub_metering_1)),type="l",ylab="Energy sub metering",xaxt="n")
lines(as.numeric(as.character(df$Sub_metering_2)), type = "l", col = "red")
lines(as.numeric(as.character(df$Sub_metering_3)), type = "l", col = "blue")
axis(1, at=c(1,length(days)/2+1,length(days)),
     labels=c("Thu","Fri","Sat"))
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1    ", "Sub_metering_2     ", "Sub_metering_3     "))
dev.off
