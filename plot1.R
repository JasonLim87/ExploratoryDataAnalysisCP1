baseData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na="?" ,stringsAsFactors=FALSE, colClasses = c("character", "character", rep("numeric",7)))

#Grabbing subset of the 2 dates required in this analysis
subSet<-baseData$Date == "1/2/2007" | baseData$Date == "2/2/2007"
subSetData<-baseData[subSet,]


#Generating Chart
png("plot1.png", width=480, height=480,unit="px")
hist(subSetData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

print(paste("Chart has been generated and saved at ",getwd(),"/plot1.png",sep=""))