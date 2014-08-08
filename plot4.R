Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, skip= 66637, nrow=2880)
dates<-paste(data[,1], data[,2], sep=" ")
datetime<-strptime(dates, "%e/%m/%Y %H:%M:%S")
taula<-cbind(data, datetime)
colnames(taula)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "datetime") 
png(file="plot4.png")
par(mfrow=c(2,2), bg="transparent")
with(taula,{
	plot(taula$datetime, taula$Global_active_power, type='n', ylab="Global Active Power (kilowatts)", xlab =NA)
	lines(taula$datetime, taula$Global_active_power)


	plot(taula$datetime, taula$Voltage, type='n', ylab="Voltage", xlab="datetime")
	lines(taula$datetime, taula$Voltage)

	plot(taula$datetime, taula$Sub_metering_1, type='n', ylab="Energy sub metering", xlab =NA)
	lines(taula$datetime, taula$Sub_metering_1)
	lines(taula$datetime, taula$Sub_metering_2, col="red")
	lines(taula$datetime, taula$Sub_metering_3, col="blue")
	legend("topright", lty=1, names(taula)[7:9], col = c("black","red","blue"))

	plot(taula$datetime, taula$Global_reactive_power, type='n', ylab="Global_reactive_power", xlab="datetime")
	lines(taula$datetime, taula$Global_reactive_power)
})
dev.off()