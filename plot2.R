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
png(file = "./plot2.png", width = 480, height = 480)

with(power, plot(Time, Global_active_power, ylab="Global Active Power (kilowatts)", xlab = " ", type = "n"))
with(power, lines(Time, Global_active_power))
## Close PNG
dev.off()