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

#Plot 2 
png(filename="plot2.png", width=480, height=480)
plot(subsetdata$DateTime, as.numeric(as.character(subsetdata$Global_active_power)),
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()