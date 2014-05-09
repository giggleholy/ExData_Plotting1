# reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';',na.strings = c("Not Available"))
# subsetting
df <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
days <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')
# plotting
setwd("D://My Documents/My Document")
png(filename = "plot2.png",width = 480, height = 480)
plot(as.numeric(as.character(df$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=c(1,length(days)/2+1,length(days)),
     labels=c("Thu","Fri","Sat"))
dev.off
