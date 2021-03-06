datafile <- "household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
settime <-strptime(paste(finaldata$Date, finaldata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldata <- cbind(settime, finaldata)
plot(finaldata$settime, finaldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()