## plot3.R

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./household_power_consumption.zip", mode = "wb")
unzip("household_power_consumption.zip")

# dataset has 2,075,259 rows and 9 columns
consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?")
# require in memory 79.8 Mb
print(object.size(consumption), units = "Mb")

# dates 2007-02-01 and 2007-02-02
twodays<-subset(consumption, as.Date(Date, "%d/%m/%Y")>=as.Date("2007-02-01", "%Y-%m-%d") & as.Date(Date, "%d/%m/%Y")<=as.Date("2007-02-02", "%Y-%m-%d"))

# Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(twodays, {
    plot(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1)
    lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red")
    lines(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = 1)
})
dev.off()
