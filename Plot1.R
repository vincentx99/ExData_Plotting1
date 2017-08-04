HHPC<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

HHPC$DateTime<-paste(HHPC$Date, HHPC$Time)
HHPC$DateTime<-as.POSIXct(HHPC$DateTime, "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())
HHPC$Date<-as.Date(HHPC$Date,"%d/%m/%Y")
HHPCF<-subset(HHPC,Date>="2007/02/01"& Date<="2007/02/02")

#create plot1
png("Plot1.png", width=480, height=480)
hist(HHPCF$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
