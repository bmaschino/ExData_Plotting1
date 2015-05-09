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
png(file = "./plot4.png", width = 480, height = 480)

## Partition screen into two columns, two rows
par(mfcol = c(2,2))

## Attach power variable to clean make lines shorter :)
attach(power)

## Draw 1st plot in column 1, row 1
plot(Time, Global_active_power, ylab="Global Active Power", xlab = " ", type = "n")
lines(Time, Global_active_power)

## Draw 2nd plot in column 1, row 2
plot(Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")

## Draw the lines
lines(Time, Sub_metering_1, col = "black")
lines(Time, Sub_metering_2, col = "red")
lines(Time, Sub_metering_3, col = "blue")

## Add the legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Draw 3rd plot in column 2, row 1
plot(Time, Voltage, ylab="Voltage", xlab = "datetime", type = "n")
lines(Time, Voltage)

## Draw 4th plot in column 2, row 2
plot(Time, Global_reactive_power, xlab= "datetime", type = "n")
lines(Time, Global_reactive_power)
## Close PNG
dev.off()