table<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  stringsAsFactors=FALSE, dec=".")
table<-table[table$Date %in% c("1/2/2007","2/2/2007"),]
table[,3]<-as.numeric(table[,3]);table[,4]<-as.numeric(table[,4])
table[,5]<-as.numeric(table[,5]);table[,7]<-as.numeric(table[,7])
table[,8]<-as.numeric(table[,8]);table[,9]<-as.numeric(table[,9])
time <- strptime(paste(table$Date, table$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480); par(mfrow = c(2, 2)) 

plot(time, table$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(time, table$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(time, table[,7], type="l", ylab="Energy sub metering", xlab="")
lines(time, table[,8], type="l", col="red")
lines(time, table[,9], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(time, table$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()