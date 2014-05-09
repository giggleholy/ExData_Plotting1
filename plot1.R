# reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';',na.strings = c("Not Available"))
# subsetting
df <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
# histogram
setwd("D://My Documents/My Document")
png(filename = "plot1.png",width = 480, height = 480)
par(mar=c(4,5,1,1))
hist(as.numeric(as.character(df$Global_active_power)),col="red1",xlab="Global Active Power (kilowatts)",xlim=c(0,6),ylim = c(0, 1200),main="Global Active Power",breaks=12)
dev.off