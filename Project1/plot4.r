cdata<-read.table(text = grep("^([1,2]/2/2007|Date)",readLines("household_power_consumption.txt"),value=TRUE),header = TRUE,sep = ";",na.strings = "?",colClasses = c("character", "character", rep("numeric", 7)))
cdata <- cbind(datetime =strptime(paste(cdata$Date,cdata$Time),"%d/%m/%Y %H:%M:%S") ,cdata)
png(filename="plot4.png",width=480,height=480)
par(mfcol = c(2,2))
with(cdata,{
			plot(datetime,Global_active_power,type ="l",xlab= "", ylab ="Global Active Power")

			plot(datetime,Sub_metering_1,xlab = "", ylab = "Energy sub metering", type ="n")
			points(datetime,Sub_metering_1,type ="l",col="black")
			points(datetime,Sub_metering_2,type ="l",col="red")
			points(datetime,Sub_metering_3,type ="l",col="blue")
			legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))		

			plot(datetime,Voltage,type ="l", ylab ="Voltage")
			plot(datetime,Global_reactive_power,type ="l")
			})
dev.off()
