# this R script reads the electrical consumption data and plots usage details
# set your working directory to where the data file is stored and run this script.
# setwd("./Coursera/Exploratory_data_analysis/")

# these lines will do the following:
# 1- read the data table, assigning ? as NA values
# 2- converting date format to yyyy-mm-dd
# 3- making a subset of data
# 4- concatenating date and time columns into datetime values
# 5- extracting the day of week from date time functions

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
data$Date <- as.Date(as.character(data$Date),  "%d/%m/%Y")
data.sm <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
data.sm$datetime <- as.POSIXct(paste(data.sm$Date, data.sm$Time), format="%Y-%m-%d %H:%M:%S")
data.sm$day <- weekdays(data.sm$Date)

# these lines will do the following steps:
# 6- create and open a png file as the graphic device
# 7- plotting a xy plot into the png device
# 8- closing the png device


png(filename = "Plot2.png",  width = 480, height = 480, units = "px")
plot(data.sm$datetime, data.sm$Global_active_power, type = "l", xlab="", ylab = "Global active power")
dev.off()
