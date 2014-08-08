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

# Plot figure 4 into png graphic device
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(Data, plot(Time, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

with(Data, plot(Time, Voltage, type="l", ylab="Voltage"))

plot(Data$Time, Data$Sub_metering_1, type='l', col='black', ylim=c(0,40), ann=FALSE)
par(new=TRUE)
plot(Data$Time, Data$Sub_metering_2, type='l', col='red'  , ylim=c(0,40), ann=FALSE)
par(new=TRUE)
plot(Data$Time, Data$Sub_metering_3, type='l', col='blue' , ylim=c(0,40), ann=FALSE) 
legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
title(ylab="Energy sub metering")

with(Data, plot(Time, Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)"))

dev.off()