# read data file
dataInput <- "../01_inputData/household_power_consumption.txt"
data <- read.table(dataInput, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# select data from 1/2/2007 to 2/2/2007
dataTwoDays <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

# prepare the data to be ploted
dataDateTime <- strptime(paste(dataTwoDays$Date, dataTwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dataGlobalActivePower <- as.numeric(dataTwoDays$Global_active_power)
dataVoltage <- as.numeric(dataTwoDays$Voltage)
dataSubMatering1 <- as.numeric(dataTwoDays$Sub_metering_1)
dataSubMatering2 <- as.numeric(dataTwoDays$Sub_metering_2)
dataSubMatering3 <- as.numeric(dataTwoDays$Sub_metering_3)
dataGlobalReactivePower <- as.numeric(dataTwoDays$Global_reactive_power)

# make the png plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(dataDateTime, dataGlobalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(dataDateTime, dataVoltage, type="l", xlab="datetime", ylab="Voltage")

plot(dataDateTime, dataSubMatering1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(dataDateTime, dataSubMatering2, col="red", type="l")
lines(dataDateTime, dataSubMatering3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, lwd=1.5, col=c("black", "red", "blue"))

plot(dataDateTime, dataGlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
