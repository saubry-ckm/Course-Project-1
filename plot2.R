# Read data from local file

data <- read.csv("household_power_consumption.txt", sep = ";")


# Convert classes 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- paste(data$Time, data$Date, sep=" ")
data$Time <- strptime(data$Time, "%H:%M:%S %Y-%m-%d" )
data$Global_active_power <-as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <-as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))

# Subset the relevant time window
Data <- data[(data$Date == "2007-02-01"|data$Date == "2007-02-02"), ]

# Plot figure 2 into png graphic device
png("plot2.png", width=480, height=480)
with(Data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
dev.off()