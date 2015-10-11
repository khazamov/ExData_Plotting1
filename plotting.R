

db <- read.csv('household_power_consumption.txt', sep=';')
subset = subset(db, Date=="2/1/2007"|Date=="2/2/2007",na.rm=T)

png(file = "myplot.png", bg = "transparent")

hist(as.double(subset$Global_active_power),col="red",xlab="Global active power (kilowatts)",main="Global Active Power")
dev.off()


#converting date and time string to posix format so hist is able to plot a frequency plot

Date <- paste0('',subset$Date)
Datetime <- paste0(Date,' ')
Datetime <- paste0(Datetime,subset$Time)
POSIXtime<-strptime(Datetime, "%m/%d/%Y  %H:%M:%S")

png(file="myplot2.png", bg='transparent')
hist(POSIXtime,as.double(subset$Global_active_power),  breaks=7, freq=TRUE)
dev.off()


png(file="myplot3.png", bg='transparent')
hist(POSIXtime,as.double(subset$Sub_meterering_1),   freq=TRUE, breaks = 7)
dev.off()

png(file="myplot4.png", bg='transparent')
hist(POSIXtime,as.double(subset$Global_active_power),  breaks=7, freq=TRUE)
hist(POSIXtime,as.double(subset$Sub_meterering_1),   freq=TRUE, breaks = 7)
hist(POSIXtime,as.double(subset$Voltage),   freq=TRUE, breaks = 7)
hist(POSIXtime,as.double(subset$Global_reactive_power),   freq=TRUE, breaks = 7)
dev.off()
