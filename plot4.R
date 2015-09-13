## load the csv file (assuming it's in the working directory)
dat <- read.csv("household_power_consumption.txt",header = TRUE,sep = ";", dec = ".", na.strings = "?")

## store the combination of date and time in the Time field
temp <- paste(dat$Date, dat$Time)
dat$Time <- strptime(temp, "%d/%m/%Y %H:%M:%S")

## conversion of Date field
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")

## create a subset of data with data of 2007 February 1st and 2nd
subdata <- subset(dat,dat$Date %in% (as.Date(c('2007-02-01', '2007-02-02'))))

## configure for Multiple Base Plots
par(mfrow = c(2, 2))

## first plot (toleft)
plot(subdata$Time, subdata$Global_active_power,type="l",ylab = "Global Active Power",xlab="")

## second plot (topright)
plot(subdata$Time, subdata$Voltage,type="l",xlab = "datetime",ylab="Voltage")

## third plot (bottom left)
## Create the plot for Sub metering 1
plot(subdata$Time, subdata$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
## add trendline to existing plot for Sub metering 2 in red
lines(subdata$Time, subdata$Sub_metering_2,type="l",col = "red")
## add trendline to existing plot for Sub metering 3 in blue
lines(subdata$Time, subdata$Sub_metering_3,type="l",col = "blue")
# add legend
legend("topright", bty = "n", pch= "_", cex=0.7, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## fourth plot (bottom right)
## second plot (topright)
plot(subdata$Time, subdata$Global_reactive_power,type="l",xlab = "datetime",ylab="Global_reactive_power")

## Copy my plot to a PNG file named plot1.png with size 480x480
dev.copy(png, file = "plot4.png",width = 480, height = 480) 

## Close the PNG device
dev.off() 


