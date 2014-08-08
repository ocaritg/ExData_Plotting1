Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, skip= 66637, nrow=2880)
dates<-paste(data[,1], data[,2], sep=" ")
datetime<-strptime(dates, "%e/%m/%Y %H:%M:%S")
taula<-cbind(data, datetime)
colnames(taula)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "datetime") 

	png(file="plot2.png")
	par(bg="transparent")
	plot(taula$datetime, taula$Global_active_power, type='n', ylab="Global Active Power (kilowatts)", xlab =NA)
	lines(taula$datetime, taula$Global_active_power)
	dev.off()
