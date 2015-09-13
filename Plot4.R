data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(data1$Date, data1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(data1$Sub_metering_1)
submetering2 <- as.numeric(data1$Sub_metering_2)
submetering3 <- as.numeric(data1$Sub_metering_3)
voltage <- as.numeric(data1$Voltage)
global_reactive_power <- as.numeric(data1$Global_reactive_power)

png(filename = "./data/Plot4.png")
par(mfrow = c(2,2))

plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, voltage, type = "l", ylab = "Voltage")

plot(datetime, submetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, submetering2, col = "red", type = "l")
lines(datetime, submetering3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, col = c("black", "red", "blue"))

plot(datetime, global_reactive_power, type = "l", ylab = "Global_reactive_power")

dev.off()