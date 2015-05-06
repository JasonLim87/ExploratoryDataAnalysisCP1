baseData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na="?" ,stringsAsFactors=FALSE, colClasses = c("character", "character", rep("numeric",7)))

#Grabbing subset of the 2 dates required in this analysis
subSet<-baseData$Date == "1/2/2007" | baseData$Date == "2/2/2007"
subSetData<-baseData[subSet,]

#Conversion of date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Generating Chart
png("plot3.png", width=480, height=480,unit="px")
plot(datetime, subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,subSetData$Sub_metering_2, type="l",col="red")
lines(datetime,subSetData$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

print(paste("Chart has been generated and saved at ",getwd(),"/plot3.png",sep=""))