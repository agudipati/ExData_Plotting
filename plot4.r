pwrconsume <- fread("household_power_consumption.txt")
pwrconsume$Date <- as.Date(pwrconsume$Date,format="%d/%m/%Y")
date1 <- rbind(pwrconsume[pwrconsume$Date=="2007-02-01",],pwrconsume[pwrconsume$Date=="2007-02-02",])
date1$Global_active_power <- as.numeric(date1$Global_active_power)


# datetime <- paste(date1$Date,date1$Time)
# date.time <- as.POSIXct(datetime)

date1$datetime <- as.POSIXct(paste(date1$Date,date1$Time))#date.time
par(mfcol=c(2,2))

#plot 1
plot(date1$datetime,date1$Global_active_power,ylab='Global Active Power',xlab='',type='l')

#plot 2

with(date1, plot(date1$datetime,date1$Sub_metering_1,type = "l",col = "black",ylab="Energy sub metering", xlab=""))

with(date1,points(date1$datetime,date1$Sub_metering_2,type = "l",col = "red"))

with(date1,points(date1$datetime,date1$Sub_metering_3, type="l",col = "blue"))
legend("topright", lwd = c(1,1,1), col = c("black", "red","blue"), bty='n',
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 3
plot(date1$datetime,date1$Voltage,ylab='Voltage',xlab='datetime',type='l')

#plot 4
plot(date1$datetime,date1$Global_reactive_power,ylab='Global_reactive_power',xlab='datetime',type='l')

dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px", bg = "white")
dev.off()