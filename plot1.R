## import dplyr library for filtering
library("dplyr")

## read in data, set default NA value
power <- read.table(".//data//household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactor = FALSE, na.strings = "?")

## format date structure
power$Date <- as.Date(power$Date, "%d/%m/%Y")

## filter proper date range
power <- filter(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

## Prepare PNG file
png(file = "./plot1.png", width = 480, height = 480)

## Make histrogram, add color, label axes
with(power, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

## Close PNG
dev.off()