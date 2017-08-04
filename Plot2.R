HHPC<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

HHPC$DateTime<-paste(HHPC$Date, HHPC$Time)
HHPC$DateTime<-as.POSIXct(HHPC$DateTime, "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())
HHPC$Date<-as.Date(HHPC$Date,"%d/%m/%Y")
HHPCF<-subset(HHPC,Date>="2007/02/01"& Date<="2007/02/02")

#create plot2
png("Plot2.png", width=480, height=480)
with(HHPCF, plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(HHPCF, lines(DateTime, Global_active_power))
dev.off()
