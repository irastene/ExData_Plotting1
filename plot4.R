rm(list = ls())
library(lubridate)

## read and subset needed data
data_all <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_id <- which(data_all$Date %in% c("1/2/2007", "2/2/2007"))
data_plot <- data_all[subset_id,]


## prepare Date column
data_plot$Date <- dmy(data_plot$Date)
data_plot$Date <- paste(data_plot$Date, data_plot$Time)
data_plot$Date <- strptime(data_plot$Date, "%Y-%m-%d %H:%M:%S")
data_plot <- data_plot[, -2]


## make graph
png("plot4.png", width = 480, height = 480)

par(mar = c(4,4,2,2), mfcol = c(2, 2))

# First plot (1st row, 1st column)
plot(data_plot$Date, data_plot$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = NA, type = "n")
lines(data_plot$Date, data_plot$Global_active_power)

# Second plot (2nd row, 1st column)
plot(data_plot$Date, data_plot$Sub_metering_1, 
     ylab = "Energy sub metering",
     xlab = NA, type = "n")
lines(data_plot$Date, data_plot$Sub_metering_1, col = "black")
lines(data_plot$Date, data_plot$Sub_metering_2, col = "red")
lines(data_plot$Date, data_plot$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

# Third plot (1st row, 2nd column)
plot(data_plot$Date, data_plot$Voltage, 
     ylab = "Voltage",
     xlab = "datetime", type = "n")
lines(data_plot$Date, data_plot$Voltage)

# Fourth plot (2nd row, 2nd column)
plot(data_plot$Date, data_plot$Global_reactive_power, 
     ylab = "Global_reactive_power",
     xlab = "datetime", type = "n")
lines(data_plot$Date, data_plot$Global_reactive_power)

dev.off()




