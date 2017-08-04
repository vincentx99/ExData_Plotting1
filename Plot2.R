#create plot2
png("Plot2.png")
with(HHPCF, plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(HHPCF, lines(DateTime, Global_active_power))
dev.off()
