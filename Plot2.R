data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(data1$Date, data1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(data1$Global_active_power)

png(filename = "./data/plot2.png")
plot(datetime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
