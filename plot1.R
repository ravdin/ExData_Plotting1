library(dplyr)
data<-read.table('household_power_consumption.txt',header=TRUE,
                 quote='',sep=';',stringsAsFactors=NA,
                 comment.char='')

data<-filter(data, Date=='1/2/2007' | Date=='2/2/2007')

gap<-as.numeric(as.vector(data$Global_active_power))
png(file="plot1.png",width=480,height=480)
hist(gap,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col="red")
dev.off()