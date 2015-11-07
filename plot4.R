
# helper functions to draw plots

draw_plot1 <- function(data) {
  x <- strptime(paste(data[, c('Date')], data[, c('Time')]), "%d/%m/%Y %H:%M:%S")
  y <- data[, c('Global_active_power')]
  plot(x, y, type="l", xlab="", ylab="Global Active Power")
}

draw_plot2 <- function(data) {
  x <- strptime(paste(data[, c('Date')], data[, c('Time')]), "%d/%m/%Y %H:%M:%S")
  y <- data[, c('Voltage')]
  plot(x, y, type="l", xlab="datetime", ylab="Voltage")
}

draw_plot3 <- function(data) {
  submetering1 <- data[, c('Sub_metering_1')]
  submetering2 <- data[, c('Sub_metering_2')]
  submetering3 <- data[, c('Sub_metering_3')]
  
  plot(time, submetering1, type="n", xlab="", ylab="Energy sub metering", ylim = range(submetering1, submetering2, submetering3))
  points(time, submetering1, col = 'black', type = 'l')
  points(time, submetering2, col = 'red', type = 'l')
  points(time, submetering3, col = 'blue', type = 'l')
  legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
}

draw_plot4 <- function(data) {
  x <- strptime(paste(data[, c('Date')], data[, c('Time')]), "%d/%m/%Y %H:%M:%S")
  y <- data[, c('Global_reactive_power')]
  plot(x, y, type="l", xlab="datetime", ylab="Global_reactive_power")
}


# data processing and layouting of plots 

data <- read.csv2('data/household_power_consumption.txt', na.strings = '?', dec = '.', colClasses = c('Date' = 'character'))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png(filename="plot4.png")

par(mfrow=c(2, 2), cex = 0.6)

draw_plot1(data)
draw_plot2(data)
draw_plot3(data)
draw_plot4(data)

dev.off()

