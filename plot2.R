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
png("plot2.png", width = 480, height = 480)
plot(data_plot$Date, data_plot$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = NA, type = "n")
lines(data_plot$Date, data_plot$Global_active_power)
dev.off()




