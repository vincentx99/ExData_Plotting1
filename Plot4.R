HHPC<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

HHPC$DateTime<-paste(HHPC$Date, HHPC$Time)
HHPC$DateTime<-as.POSIXct(HHPC$DateTime, "%d/%m/%Y %H:%M:%S", tz=Sys.timezone())
HHPC$Date<-as.Date(HHPC$Date,"%d/%m/%Y")
HHPCF<-subset(HHPC,Date>="2007/02/01"& Date<="2007/02/02")

#create plot4
png("Plot4.png")
par(mfrow=c(2,2))

with(HHPCF, plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(HHPCF, lines(DateTime, Global_active_power))

with(HHPCF, plot(DateTime, Voltage, type="n", xlab="datetime", ylab="Voltage"))
with(HHPCF, lines(DateTime, Voltage, col="black"))

with(HHPCF, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(HHPCF, lines(DateTime, Sub_metering_1, col="black"))
with(HHPCF, lines(DateTime, Sub_metering_2, col="red"))
with(HHPCF, lines(DateTime, Sub_metering_3, col="blue"))

with(HHPCF, plot(DateTime, Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power"))
with(HHPCF, lines(DateTime, Global_reactive_power, col="black"))
dev.off()