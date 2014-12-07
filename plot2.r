pwrconsume <- fread("household_power_consumption.txt")
pwrconsume$Date <- as.Date(pwrconsume$Date,format="%d/%m/%Y")
date1 <- rbind(pwrconsume[pwrconsume$Date=="2007-02-01",],pwrconsume[pwrconsume$Date=="2007-02-02",])
date1$Global_active_power <- as.numeric(date1$Global_active_power)


# datetime <- paste(date1$Date,date1$Time)
# date.time <- as.POSIXct(datetime)

date1$datetime <- as.POSIXct(paste(date1$Date,date1$Time))#date.time
# date2 <- date1[,c(10,3:9)]
plot(date1$datetime,date1$Global_active_power,ylab="Global Active Power(Kilowatts)",xlab="",type="l")
dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px", bg = "white")
dev.off()