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

#convert Global_active_power to numeric
ePowerDSReqDate$Global_active_power <- as.numeric(ePowerDSReqDate$Global_active_power)

plot(ePowerDSReqDate$DateTime,ePowerDSReqDate$Global_active_power,ylab="Global Active Power(Kilowatts)",xlab="",type="l")
dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px", bg = "white")
dev.off()