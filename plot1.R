
data <- read.csv2('data/household_power_consumption.txt', na.strings = '?', dec = '.', colClasses = c('Date' = 'character'))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png(filename="plot1.png")

hist(data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.off()