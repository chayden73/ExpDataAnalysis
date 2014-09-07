cdata<-read.table(text = grep("^([1,2]/2/2007|Date)",readLines("household_power_consumption.txt"),value=TRUE),header = TRUE,sep = ";",na.strings = "?",colClasses = c("character", "character", rep("numeric", 7)))
cdata <- cbind(datetime =strptime(paste(cdata$Date,cdata$Time),"%d/%m/%Y %H:%M:%S") ,cdata)
png(filename="plot1.png",width=480,height=480)
hist(cdata$Global_active_power,xlab="Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.off()