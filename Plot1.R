data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

png(filename = "./data/plot1.png")
hist(as.numeric(data1$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "frequency")
dev.off()