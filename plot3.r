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
png(filename="plot3.png", height=480, width=480, bg="transparent")

# Plot the first
plot(sub_data$Timestamp,
     sub_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

#Plot the second
lines(sub_data$Timestamp,
      sub_data$Sub_metering_2,
      type="l",
      col="red")

#Plot the third
lines(sub_data$Timestamp,
      sub_data$Sub_metering_3,
      type="l",
      col="blue")
#Legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))


# Save figure
dev.off()