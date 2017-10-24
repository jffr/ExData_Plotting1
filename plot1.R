## plot1.R

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./household_power_consumption.zip", mode = "wb")
unzip("household_power_consumption.zip")

# dataset has 2,075,259 rows and 9 columns
consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?")
# require in memory 79.8 Mb
print(object.size(consumption), units = "Mb")

# dates 2007-02-01 and 2007-02-02
twodays<-subset(consumption, as.Date(Date, "%d/%m/%Y")>=as.Date("2007-02-01", "%Y-%m-%d") & as.Date(Date, "%d/%m/%Y")<=as.Date("2007-02-02", "%Y-%m-%d"))
# twodays<-subset(consumption, as.Date(Date, "%d/%m/%Y") %in% c(as.Date("2007-02-01", "%Y-%m-%d"), as.Date("2007-02-02", "%Y-%m-%d")))

# Plot 1
hist(twodays$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
