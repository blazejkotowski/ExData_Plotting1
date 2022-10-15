hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
filtered = filter(hpc, Datetime >= as.POSIXct("01/02/2007", format="%d/%m/%Y") & Datetime < as.POSIXct("03/02/2007", format="%d/%m/%Y"))

png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
# First
plot(filtered$Global_active_power~filtered$Datetime, type="l", xlab="", ylab="Global active power")

# Second
plot(filtered$Voltage~filtered$Datetime, type="l", xlab="datetime", ylab="Voltage")

# Third (from plot3.R)
plot(filtered$Sub_metering_1~filtered$Datetime, type="n", xlab="", ylab="Energy sub metering")
lines(filtered$Sub_metering_1~filtered$Datetime, col="black")
lines(filtered$Sub_metering_2~filtered$Datetime, col="red")
lines(filtered$Sub_metering_3~filtered$Datetime, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.95, bty="n")

# Fourth
plot(filtered$Global_reactive_power~filtered$Datetime, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.off()