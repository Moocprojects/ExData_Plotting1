# unziping and reading the dataset
  filename<- "exdata-data-household_power_consumption.zip"
  unzip(filename)
  datafile<- read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors = FALSE,na.strings="?",
                        colClasses=c("character", "character", "numeric",
                                     "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric"))
  # formating date and subsetting required data
  datafile$Date<- as.Date(datafile$Date,format="%d/%m/%Y")
  startDate <- as.Date("01/02/2007", format="%d/%m/%Y")
  endDate <- as.Date("02/02/2007", format="%d/%m/%Y")
  subsetdata<- datafile[datafile$Date >= startDate & datafile$Date <= endDate,]
  
  # plot 1
  png(filename="plot1.png", width=480, height=480)
  hist(subsetdata$Global_active_power,col = "red",xlab="Global Active Power(kilowatts)",ylab= "Frequency",main="Global Active Power")
  dev.off()
  
  
  
  
  