table<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                  stringsAsFactors=FALSE, dec=".")
table<-table[table$Date %in% c("1/2/2007","2/2/2007"),]
table$Global_active_power<-as.numeric(table$Global_active_power)
png("plot1.png", width=480, height=480)
hist(table$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
















