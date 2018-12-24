if(!is.null(dev.list())) dev.off()

rm(list=ls())

library(data.table)
library(lubridate)

#Read data
ePowerDS <- fread("household_power_consumption.txt")

#Convert Date variable to Date datatype 
ePowerDS$Date <- dmy(ePowerDS$Date)

#get only the interersted data
ePowerDSReqDate <- ePowerDS[which(ePowerDS$Date>="2007-02-01" & ePowerDS$Date<="2007-02-02"),]

#combine date and time columns
ePowerDSReqDate$DateTime <- paste(ePowerDSReqDate$Date, ePowerDSReqDate$Time)
ePowerDSReqDate$DateTime <- ymd_hms(ePowerDSReqDate$DateTime)

#########################
#now plotting
#########################
ePowerDSReqDate$Global_active_power <- as.numeric(ePowerDSReqDate$Global_active_power)

par(mfcol=c(2,2))

#plot 1
plot(ePowerDSReqDate$DateTime,ePowerDSReqDate$Global_active_power,ylab='Global Active Power',xlab='',type='l')

#plot 2

plot(ePowerDSReqDate$DateTime,ePowerDSReqDate$Sub_metering_1,type = "l",col = "black",ylab="Energy sub metering", xlab="")
points(ePowerDSReqDate$DateTime,ePowerDSReqDate$Sub_metering_2,type = "l",col = "red")
points(ePowerDSReqDate$DateTime,ePowerDSReqDate$Sub_metering_3, type="l",col = "blue")

legend("topright", lwd = c(1,1,1), col = c("black", "red","blue"), bty='n',
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 3
plot(ePowerDSReqDate$DateTime,ePowerDSReqDate$Voltage,ylab='Voltage',xlab='DateTime',type='l')

#plot 4
plot(ePowerDSReqDate$DateTime,ePowerDSReqDate$Global_reactive_power,ylab='Global_reactive_power',xlab='DateTime',type='l')

dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px", bg = "white")
dev.off()