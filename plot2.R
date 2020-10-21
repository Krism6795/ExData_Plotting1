library("data.table")

powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

subpower <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

subpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot2.png", width=480, height=480)

plot(x = subpower[, dateTime]
     , y = subpower[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

