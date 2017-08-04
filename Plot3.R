HHPC<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

HHPC$DateTime<-paste(HHPC$Date, HHPC$Time)
HHPC$DateTime<-as.POSIXct(HHPC$DateTime, "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())
HHPC$Date<-as.Date(HHPC$Date,"%d/%m/%Y")
HHPCF<-subset(HHPC,Date>="2007/02/01"& Date<="2007/02/02")

#create plot3
png("Plot3.png")
with(HHPCF, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(HHPCF, lines(DateTime, Sub_metering_1, col="black"))
with(HHPCF, lines(DateTime, Sub_metering_2, col="red"))
with(HHPCF, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), col=c("black","red","blue"))
dev.off()
