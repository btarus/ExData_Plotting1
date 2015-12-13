# read data file
dataInput <- "../01_inputData/household_power_consumption.txt"
data <- read.table(dataInput, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# select data from 1/2/2007 to 2/2/2007
dataTwoDays <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

# prepare the data to be ploted
dataDateTime <- strptime(paste(dataTwoDays$Date, dataTwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
dataGlobalActivePower <- as.numeric(dataTwoDays$Global_active_power)

# make the png plot
png("plot2.png", width=480, height=480)
plot(dataDateTime, dataGlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
