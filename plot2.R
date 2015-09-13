## load the csv file (assuming it's in the working directory)
dat <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";", dec = ".", na.strings = "?")

## store the combination of date and time in the Time field
temp <- paste(dat$Date, dat$Time)
dat$Time <- strptime(temp, "%d/%m/%Y %H:%M:%S")

## conversion of Date field
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")

## create a subset of data with data of 2007 February 1st and 2nd
subdata <- subset(dat,dat$Date %in% (as.Date(c('2007-02-01', '2007-02-02'))))

## Create the plot 
plot(subdata$Time, subdata$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")

## Copy my plot to a PNG file named plot1.png with size 480x480
dev.copy(png, file = "plot2.png",width = 480, height = 480) 

## Close the PNG device
dev.off() 