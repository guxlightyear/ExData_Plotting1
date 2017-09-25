# Read input file
fileName <- "household_power_consumption.txt"
inputData = read.table(fileName, header=TRUE, sep = ";", na.strings = "?")
inputData$Date <- as.Date(inputData$Date, format = "%d/%m/%Y")

# Subset the data
trimmedData <- subset(inputData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


# Plot 1
hist(trimmedData$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
