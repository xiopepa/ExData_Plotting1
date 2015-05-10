# Plot 3
# Global Energy vs day

# Load in the power consumption data set
# First two columns will be converted to date/time

restData <- read.csv("household_power_consumption.txt",
                     sep=";",
                     colClasses=c(rep("character",2),rep("numeric",7)),
                     na.strings="?")

# Combine the date and time columns in timestapm
restData$Timestamp <- strptime(paste(restData$Date,restData$Time),
                               format="%d/%m/%Y %H:%M:%S")

# Remove the now-unnecessary date and time cols
restData$Date=NULL
restData$Time=NULL

# Subset the data to only look at desired time span
# Here I'll be working with data from 2007-02-01 to 2007-02-02.
sub_data = subset(restData,as.Date(restData$Timestamp) >= "2007-02-01" 
                  & as.Date(restData$Timestamp) < "2007-02-03")

# Start png
png(filename="plot4.png", height=480, width=480, bg="transparent")

# Create split

par(mfrow=c(2,2))

# SUBPLOT 1

plot(sub_data$Timestamp,
     sub_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# SUBPLOT 2 - voltage vs time

plot(sub_data$Timestamp,
     sub_data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# SUBPLOT 3 -  the first sub-meter

plot(sub_data$Timestamp,
     sub_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

# - the second sub-meter
lines(sub_data$Timestamp,
      sub_data$Sub_metering_2,
      type="l",
      col="red")

# - the third sub-meter
lines(sub_data$Timestamp,
      sub_data$Sub_metering_3,
      type="l",
      col="blue")

# Legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n")

# SUBPLOT 4

plot(sub_data$Timestamp,
     sub_data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

# Save figure
dev.off()