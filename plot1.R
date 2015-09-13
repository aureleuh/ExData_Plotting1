## load the csv file (assuming it's in the working directory)
dat <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";", dec = ".", na.strings = "?")

## conversion of Date and Time fields
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
dat$Time <- strptime(dat$Time,"%H:%M:%S")

## create a subset of data with data of 2007 February 1st and 2nd
subdata <- subset(dat,dat$Date %in% (as.Date(c('2007-02-01', '2007-02-02'))))

## only one plot
par(mfrow = c(1, 1))

## Create an histogram
hist(subdata$Global_active_power,col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copy my plot to a PNG file named plot1.png with size 480x480
dev.copy(png, file = "plot1.png",width = 480, height = 480) 

## Close the PNG device
dev.off() 