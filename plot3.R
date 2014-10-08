library(dplyr)
data<-read.table('household_power_consumption.txt',header=TRUE,
                 quote='',sep=';',stringsAsFactors=NA,
                 comment.char='')

data<-filter(data, Date=='1/2/2007' | Date=='2/2/2007')

dates <-strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
Sub_metering_1<-as.numeric(as.vector(data$Sub_metering_1))
Sub_metering_2<-as.numeric(as.vector(data$Sub_metering_2))
Sub_metering_3<-as.numeric(as.vector(data$Sub_metering_3))

png(file="plot3.png",width=480,height=480)
plot(dates, Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

points(dates, Sub_metering_2, type="l", col="red")
points(dates, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))
dev.off()