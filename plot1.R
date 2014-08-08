Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, skip= 66637, nrow=2880)

colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 

	x<-as.numeric(data$Global_active_power)

	png(file="plot1.png")
	par(bg="transparent")
	hist(x, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
	dev.off()
