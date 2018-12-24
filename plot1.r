#Read data
library(data.table)
ePowerDS <- fread("household_power_consumption.txt")

# View(ePowerDS)
# class(ePowerDS$Date)

#install.packages("lubridate")
library(lubridate)
ePowerDS$Date <- dmy(ePowerDS$Date)
# class(ePowerDS$Date)

#head(ePowerDS$Date)

ePowerDSReqDate <- ePowerDS[which(ePowerDS$Date>="2007-02-01" & ePowerDS$Date<="2007-02-02"),]
# View(ePowerDSReqDate)
class(ePowerDS$Time)

#combine date and time columns
ePowerDSReqDate$DateTime <- paste(ePowerDSReqDate$Date, ePowerDSReqDate$Time)
ePowerDSReqDate$DateTime <- ymd_hms(ePowerDSReqDate$DateTime)

#########################
#now plotting
#########################
ePowerDSReqDate$Global_active_power <- as.numeric(ePowerDSReqDate$Global_active_power)

hist(ePowerDSReqDate$Global_active_power,col="Red",xlab="GlobalActive Power(kilowatts)",main="Global Active Power")
dev.copy(png, file="plot1.png",width = 480, height = 480, units = "px", bg = "white")
dev.off()
