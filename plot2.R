library(dplyr)
data<-read.table('household_power_consumption.txt',header=TRUE,
                 quote='',sep=';',stringsAsFactors=NA,
                 comment.char='')

data<-filter(data, Date=='1/2/2007' | Date=='2/2/2007')

gap<-as.numeric(as.vector(data$Global_active_power))
dates <-strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
png("plot2.png",width=480,height=480)
plot(dates, gap, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
