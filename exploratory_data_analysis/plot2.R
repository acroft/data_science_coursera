# This script generates a line graph showing global active power for two days, from thursday 
# through saturday, for a household.

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

png(filename='plot2.png')
plot(x= hpc$DateTime, y=hpc$Global_active_power, type='l', xlab='', ylab="Global Active Power (kilowatts)")
dev.off()