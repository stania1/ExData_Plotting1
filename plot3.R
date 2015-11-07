data <- read.csv2('data/household_power_consumption.txt', na.strings = '?', dec = '.', colClasses = c('Date' = 'character'))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

time <- strptime(paste(data[, c('Date')], data[, c('Time')]), "%d/%m/%Y %H:%M:%S")

submetering1 <- data[, c('Sub_metering_1')]
submetering2 <- data[, c('Sub_metering_2')]
submetering3 <- data[, c('Sub_metering_3')]

png(filename="plot3.png")

plot(time, submetering1, type="n", xlab="", ylab="Energy sub metering", ylim = range(submetering1, submetering2, submetering3))
points(time, submetering1, col = 'black', type = 'l')
points(time, submetering2, col = 'red', type = 'l')
points(time, submetering3, col = 'blue', type = 'l')
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

dev.off()