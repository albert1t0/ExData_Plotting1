if(!exists("hpc.data")) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
      unzip("data.zip")
      hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
      hpc.data <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
      hpc.data$DateTime <- strptime(paste(hpc.data$Date,hpc.data$Time), "%d/%m/%Y %H:%M:%S")
}

### Plot 3 ###
png("plot3.png", width = 480, height = 480, units = "px")
      with(hpc.data, plot(DateTime, Sub_metering_1, type = "n", xlab ="", 
                    ylab = "Global Active Power (kilowatts)"))
      with(hpc.data, lines(DateTime, Sub_metering_1))
      with(hpc.data, lines(DateTime, Sub_metering_2, col = "red"))
      with(hpc.data, lines(DateTime, Sub_metering_3, col = "blue"))
      legend("topright", lty = 1, col = c("black","red","blue"), 
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

