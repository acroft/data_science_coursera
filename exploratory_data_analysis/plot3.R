# This script generates a graph of energy sub metering for three separate areas.

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
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format='%F %H:%M:%S')

png(filename='plot3.png')
plot(x= hpc$DateTime, y=hpc$Sub_metering_1, col='black', type='l', xlab='', ylab="Energy Sub Metering")
lines(x= hpc$DateTime, y=hpc$Sub_metering_2, col='red', type='l', xlab='', ylab="Energy Sub Metering")
lines(x= hpc$DateTime, y=hpc$Sub_metering_3, col='blue', type='l', xlab='', ylab="Energy Sub Metering")

legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()