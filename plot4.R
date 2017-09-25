# Read input file
fileName <- "household_power_consumption.txt"
inputData = read.table(fileName, header=TRUE, sep = ";", na.strings = "?")
inputData$Date <- as.Date(inputData$Date, format = "%d/%m/%Y")

# Subset the data
trimmedData <- subset(inputData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
trimmedData$datetime <- strptime(paste(trimmedData$Date, trimmedData$Time), "%Y-%m-%d %H:%M:%S")
trimmedData$datetime <- as.POSIXct(trimmedData$datetime)

# Plot 4
par(mfrow = c(2, 2))

with(trimmedData, plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = ""))
with(trimmedData, plot(Voltage ~ datetime, type = "l"))
with(trimmedData, plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = ""))
with(trimmedData, lines(Sub_metering_2 ~ datetime, col = "Red"))
with(trimmedData, lines(Sub_metering_3 ~ datetime, col = "Blue"))
with(trimmedData, legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n"))

with(trimmedData, plot(Global_reactive_power ~ datetime, type = "l"))

# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
