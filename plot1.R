library("data.table")

powerdata <- data.table::fread( input = "household_power_consumption.txt", na.strings = "?")

subpower <- subset(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date == "2/2/2007")

hist(subpower [, Global_active_power], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.copy(png, filename = "plot1.png")
dev.off()