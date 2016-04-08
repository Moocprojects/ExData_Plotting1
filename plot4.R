# unziping and reading the dataset
filename<- "exdata-data-household_power_consumption.zip"
unzip(filename)
datafile<- read.table("household_power_consumption.txt", sep = ";", header = TRUE,dec=".",stringsAsFactors = FALSE,na.strings="?",
                      colClasses=c("character", "character", "numeric",
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"))

# formating date and subsetting required data
datafile$DateTime<-paste(datafile$Date,datafile$Time)
datafile$DateTime<-strptime(datafile$DateTime,"%d/%m/%Y %H:%M:%S")
startDate <- which(datafile$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
endDate <- which(datafile$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
subsetdata<- datafile[startDate:endDate,]

#plot 4
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(subsetdata$DateTime, as.numeric(as.character(subsetdata$Global_active_power)),type='l',ylab="Global Active Power", xlab="")

plot(subsetdata$DateTime, as.numeric(as.character(subsetdata$Sub_metering_1)),type='l', xlab="",ylab ="Energy sub metering")
lines(subsetdata$DateTime, as.numeric(as.character(subsetdata$Sub_metering_2)),type='l', col='red')
lines(subsetdata$DateTime, subsetdata$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

plot(subsetdata$DateTime, as.numeric(as.character(subsetdata$Voltage)),type='l', 
     ylab="Voltage",xlab="datetime" )

plot(subsetdata$DateTime, as.numeric(as.character(subsetdata$Global_reactive_power)),type='l', 
     ylab="Global_reactive_power",xlab="datetime" )
dev.off()