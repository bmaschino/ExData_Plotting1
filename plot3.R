## import dplyr library for filtering
library("dplyr")

## read in data, set default NA value
power <- read.table(".//data//household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactor = FALSE, na.strings = "?")

## format date structure
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## filter proper date range
power <- filter(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

## Format time into POSIX compatible format
power$Time <- paste(power$Date, power$Time)
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")

## Prepare PNG file
png(file = "./plot3.png", width = 480, height = 480)

## Attach power variable to clean make lines shorter :)
attach(power)

## Draw empty plot with labels
plot(Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")

## Draw the lines
lines(Time, Sub_metering_1, col = "black")
lines(Time, Sub_metering_2, col = "red")
lines(Time, Sub_metering_3, col = "blue")

## Add the legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close PNG
dev.off()