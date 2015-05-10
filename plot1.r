# Plot 1
# Histogram of Frequency vs Global Active Power

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
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot histogram
hist(sub_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Save figure
dev.off()