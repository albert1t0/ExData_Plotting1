if(!exists("hpc.data")) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
      unzip("data.zip")
      hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
      hpc.data <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
      hpc.data$DateTime <- strptime(paste(hpc.data$Date,hpc.data$Time), "%d/%m/%Y %H:%M:%S")
}

### Plot 1 ###

png("plot1.png", width = 480, height = 480, units = "px")
      hist(hpc.data$Global_active_power, 
            main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)", 
            col = "red")
dev.off()
