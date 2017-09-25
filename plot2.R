# Read input file
fileName <- "household_power_consumption.txt"
inputData = read.table(fileName, header=TRUE, sep = ";", na.strings = "?")
inputData$Date <- as.Date(inputData$Date, format = "%d/%m/%Y")

# Subset the data
trimmedData <- subset(inputData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
trimmedData$datetime <- strptime(paste(trimmedData$Date, trimmedData$Time), "%Y-%m-%d %H:%M:%S")
trimmedData$datetime <- as.POSIXct(trimmedData$datetime)

# Plot 2
plot(trimmedData$Global_active_power ~ trimmedData$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
