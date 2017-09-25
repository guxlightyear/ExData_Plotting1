# Read input file
fileName <- "household_power_consumption.txt"
inputData = read.table(fileName, header=TRUE, sep = ";", na.strings = "?")
inputData$Date <- as.Date(inputData$Date, format = "%d/%m/%Y")

# Subset the data
trimmedData <- subset(inputData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
trimmedData$datetime <- strptime(paste(trimmedData$Date, trimmedData$Time), "%Y-%m-%d %H:%M:%S")
trimmedData$datetime <- as.POSIXct(trimmedData$datetime)

# Plot 3
with(trimmedData, plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = ""))
with(trimmedData, lines(Sub_metering_2 ~ datetime, col = "Red"))
with(trimmedData, lines(Sub_metering_3 ~ datetime, col = "Blue"))
with(trimmedData, legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

# Save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
