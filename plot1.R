library(lubridate)

## read and subset needed data
data_all <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_id <- which(data_all$Date %in% c("1/2/2007", "2/2/2007"))
data_plot <- data_all[subset_id,]


## prepare data
data_plot$Date <- dmy(data_plot$Date)
data_plot$Time <- hms(data_plot$Time)


## make graph
png("plot1.png", width = 480, height = 480)
hist(data_plot$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")
dev.off()
