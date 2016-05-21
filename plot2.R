table<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  stringsAsFactors=FALSE, dec=".")
table<-table[table$Date %in% c("1/2/2007","2/2/2007"),]
table$Global_active_power<-as.numeric(table$Global_active_power)
time <- strptime(paste(table$Date, table$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(time,table$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
