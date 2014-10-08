library(dplyr)
data<-read.table('household_power_consumption.txt',header=TRUE,
                 quote='',sep=';',stringsAsFactors=NA,
                 comment.char='')

data<-filter(data, Date=='1/2/2007' | Date=='2/2/2007')

gap<-as.numeric(as.vector(data$Global_active_power))
Global_reactive_power<-as.numeric(as.vector(data$Global_reactive_power))
Voltage<-as.numeric(as.vector(data$Voltage))
datetime <-strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
Sub_metering_1<-as.numeric(as.vector(data$Sub_metering_1))
Sub_metering_2<-as.numeric(as.vector(data$Sub_metering_2))
Sub_metering_3<-as.numeric(as.vector(data$Sub_metering_3))

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2, 2))
plot(datetime, gap, type="l",
     xlab="", ylab="Global Active Power")

plot(datetime, Voltage, type="l")

plot(datetime, Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

points(datetime, Sub_metering_2, type="l", col="red")
points(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"), bty="n")

plot(datetime, Global_reactive_power, type="l")
dev.off()
