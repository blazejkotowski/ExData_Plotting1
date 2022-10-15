hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
filtered = filter(hpc, Datetime >= as.POSIXct("01/02/2007", format="%d/%m/%Y") & Datetime < as.POSIXct("03/02/2007", format="%d/%m/%Y"))

png(filename="plot2.png", width=480, height=480, units="px")
plot(filtered$Global_active_power~filtered$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()