data <- read.csv2('data/household_power_consumption.txt', na.strings = '?', dec = '.', colClasses = c('Date' = 'character'))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

x <- strptime(paste(data[, c('Date')], data[, c('Time')]), "%d/%m/%Y %H:%M:%S")

y <- data[, c('Global_active_power')]

png(filename="plot2.png")

plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()