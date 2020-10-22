library("data.table")

powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

subpower <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

subpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot3.png", width = 480, height = 480)

plot(subpower[, dateTime], subpower[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(subpower[, dateTime], subpower[, Sub_metering_2],col="red")
lines(subpower[, dateTime], subpower[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()