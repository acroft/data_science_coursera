# This script generates a histogram of active power from the UC Irvine Machine Learning Repository
# Electric power consumption dataset.

hpc <- read.table(
    file       = 'household_power_consumption.txt', 
    sep        = ';', 
    header     = TRUE,
    colClasses = c('character','character', 'numeric', 'numeric', 'numeric', 'numeric', 
                   'numeric', 'numeric', 'numeric'), 
    na.strings = '?',
)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc <- hpc[hpc$Date==as.Date("01/02/2007", format="%d/%m/%Y") 
           | hpc$Date==as.Date("02/02/2007", format="%d/%m/%Y"),]
#hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')

png(filename='plot1.png')
hist(hpc$Global_active_power, col='red', main='Global Active Power', xlab="Global Active Power (kilowatts)")
dev.off()